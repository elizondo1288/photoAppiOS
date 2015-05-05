//
//  WS_PostCreator.m
//  Krome
//
//  Created by Orlando Esteban Elizondo on 6/23/14.
//  Copyright (c) 2014 Krome. All rights reserved.
//

#import "WS_PostCreator.h"

@implementation WS_PostCreator

//singleton method
+ (WS_PostCreator *)sharedManager
{
    static WS_PostCreator *sharedLocationControllerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedLocationControllerInstance = [[self alloc] init];
    });
    return sharedLocationControllerInstance;
}


+(NSMutableURLRequest *) createRequest:(NSURL *)url withBody:(NSString *)json{
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: url cachePolicy:  NSURLRequestUseProtocolCachePolicy timeoutInterval: 40.0];
    
    //we set the type of the method
    [request setHTTPMethod:@"POST"];
    
    //we set the regular headers
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%lu",(unsigned long)[json length]] forHTTPHeaderField:@"Content-Length"];
    
    //we add the security headers
    /*NSString * md5JSON = [Validations getMD5:[NSString stringWithFormat:@"%@ %@",API_PID,json]];
    [request setValue:md5JSON forHTTPHeaderField:@"KP-Auth"];
    [request setValue:API_SID forHTTPHeaderField:@"KP-PId"];
    */
    //we set the body of the json
    [request setHTTPBody: [json dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES]];
    
    return request;
}


@end
