//
//  WS_MultiPartCreator.m
//  Krome
//
//  Created by Orlando Esteban Elizondo on 6/23/14.
//  Copyright (c) 2014 Krome. All rights reserved.
//

#import "WS_MultiPartCreator.h"

@implementation WS_MultiPartCreator

//singleton method
+ (WS_MultiPartCreator *)sharedManager
{
    static WS_MultiPartCreator *sharedLocationControllerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedLocationControllerInstance = [[self alloc] init];
    });
    return sharedLocationControllerInstance;
}

+(NSMutableURLRequest *) createRequest:(NSURL *)url withBody:(NSString *)json andImage:(NSData *)imageData{
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: url cachePolicy:  NSURLRequestUseProtocolCachePolicy timeoutInterval: 45.0];
    
    //if we are sending images we need a boundary to delimit information
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    //add the content type for the header
    NSString *contentTypeHeader = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    
    
    //we set the type of the method
    [request setHTTPMethod:@"POST"];
    
    //we add the security headers
    
    [request setValue: contentTypeHeader forHTTPHeaderField:@"Content-Type"];
    
    //add Mutable Data for image
    NSMutableData *postBody = [NSMutableData data];
    
    
    //start with the boundary
    [postBody appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [postBody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; \r\n\r\n", @"body"] dataUsingEncoding:NSUTF8StringEncoding]];
    [postBody appendData:[[NSString stringWithFormat:@"%@\r\n", json] dataUsingEncoding:NSUTF8StringEncoding]];
    [postBody appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSString * imageName = [[NSUserDefaults standardUserDefaults]objectForKey:@"IMAGE_SERVER_NAME"];
    NSString * content = [NSString stringWithFormat:@"Content-Disposition: form-data; name=\"file\"; filename=\"%@.jpg\"\r\n",imageName];
    
    NSLog(@"%@",content);
    
    [postBody appendData:[content dataUsingEncoding:NSUTF8StringEncoding]];
    [postBody appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [postBody appendData:[NSData dataWithData:imageData]];
    [postBody appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [postBody appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [request setHTTPBody:postBody];
    
    return request;
}

@end
