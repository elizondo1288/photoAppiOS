//
//  Constants.h
//  iBusCR
//
//  Created by Esteban Mac on 02/01/14.
//  Copyright (c) 2014 Oreliz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Constants : NSObject


extern NSString * const VERSION_APP;

extern NSString * const ERROR;
extern NSString * const CODERESPONSE;
extern NSString * const SUCCESS;
extern NSString * const UPDATED;
extern NSString * const INFORMATION;
extern NSString * const LINE;
extern NSString * const EMPTY_CONST;
extern NSString * const OK_CONST;
extern NSString * const OFFLINE_MODE;


//KROME VARIABLES FOR REQUEST
extern NSString * const REQUEST_SERVER;
extern NSString * const API_PID;
extern NSString * const API_SID;


extern NSString * const REQUEST_DOMAIN;
extern NSString * const REQUEST_URL;


extern NSString * const HOST_NAME;
extern int const PORT_NUMBER;
extern int const WS_BADREQUEST;
extern int const WS_UNAUTHORIZED;
extern int const WS_UNPROCESSABLE;
extern int const WS_INTERNALSERVER;
extern int const WS_SUCCESS;

enum {
    REQUEST_TYPE_PLAIN = 1,
    REQUEST_TYPE_BODY = 2,
    REQUEST_TYPE_IMAGE = 3
};
typedef NSUInteger NSFetchedResultsChangeType;
@end
