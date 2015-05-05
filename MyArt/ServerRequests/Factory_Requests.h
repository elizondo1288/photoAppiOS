//
//  Factory_Requests.h
//  RequestsManager
//
//  Created by Esteban Mac on 25/11/14.
//  Copyright (c) 2014 OM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Factory_Requests : NSObject


+ (Factory_Requests *)sharedManager;

+ (NSMutableURLRequest *)createCorrectRequests:(RequestInfo *)info andImage:(NSData *)imageData;

@end
