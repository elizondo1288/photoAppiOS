//
//  WS_GetCreator.m
//  Krome
//
//  Created by Orlando Esteban Elizondo on 6/23/14.
//  Copyright (c) 2014 Krome. All rights reserved.
//

#import "WS_GetCreator.h"

@implementation WS_GetCreator



//singleton method
+ (WS_GetCreator *)sharedManager
{
    static WS_GetCreator *sharedLocationControllerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedLocationControllerInstance = [[self alloc] init];
    });
    return sharedLocationControllerInstance;
}

+(NSMutableURLRequest *) createRequest:(NSURL *)url withParameters:(NSArray *)array{
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 30.0];

    NSLog(@"URL: %@",url);
    
    //we set the type of the method
    [request setHTTPMethod:@"GET"];
    
    //we add the security headers
    /*
     NSString * md5JSON = [Validations getMD5:[NSString stringWithFormat:@"%@ %@",API_PID,[array objectAtIndex:0]]];
     [request setValue:md5JSON forHTTPHeaderField:@"KP-Auth"];
     [request setValue:API_SID forHTTPHeaderField:@"KP-PId"];
    */
    return request;
}
@end
