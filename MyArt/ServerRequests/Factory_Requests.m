//
//  Factory_Requests.m
//  RequestsManager
//
//  Created by Esteban Mac on 25/11/14.
//  Copyright (c) 2014 OM. All rights reserved.
//

#import "Factory_Requests.h"
#import "WS_PostCreator.h"
#import "WS_MultiPartCreator.h"
#import "WS_GetCreator.h"

@implementation Factory_Requests

//singleton method
+ (Factory_Requests *)sharedManager
{
    static Factory_Requests *sharedLocationControllerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedLocationControllerInstance = [[self alloc] init];
    });
    return sharedLocationControllerInstance;
}

+ (NSMutableURLRequest *)createCorrectRequests:(RequestInfo *)info andImage:(NSData *)imageData{
    
    //we check the type
    if (info.type == REQUEST_TYPE_BODY) {
        //http://
        //we build the url
        NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@%@%@%@", REQUEST_SERVER, REQUEST_DOMAIN, REQUEST_URL,info.action]];
        return [WS_PostCreator createRequest:url withBody:info.body];

    }else if (info.type == REQUEST_TYPE_PLAIN){
        
        NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@%@%@%@", REQUEST_SERVER, REQUEST_DOMAIN,info.action,info.body]];
        NSArray * arrayParameters = @[info.body];
        return [WS_GetCreator createRequest:url withParameters:arrayParameters];
        
    }else if (info.type == REQUEST_TYPE_IMAGE){
        
        //we build the url
        NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"https://%@%@%@%@", REQUEST_SERVER, REQUEST_DOMAIN, REQUEST_URL,info.action]];
        return [WS_MultiPartCreator createRequest:url withBody:info.body andImage:imageData];
    }
    
    return nil;
}
@end
