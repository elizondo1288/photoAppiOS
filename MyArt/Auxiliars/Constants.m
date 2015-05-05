//
//  Constants.m
//  iBusCR
//
//  Created by Esteban Mac on 02/01/14.
//  Copyright (c) 2014 Oreliz. All rights reserved.
//

#import "Constants.h"

@implementation Constants

//CHANGE THIS ON EVERY RELEASE
NSString * const VERSION_APP =@"1.0.3";

//DEFAULT VARIABLES
NSString * const ERROR =@"Error";
NSString * const CODERESPONSE = @"CodeResponse";
NSString * const SUCCESS =@"Success";
NSString * const UPDATED =@"updated";
NSString * const INFORMATION =@"Information";
NSString * const LINE =@"-";
NSString * const OK_CONST =@"OK";
NSString * const EMPTY_CONST = @"";
NSString * const OFFLINE_MODE =@"Offline Mode";


//SECURITY VARIABLES
NSString * const REQUEST_SERVER =@"www.w3schools.com/";
NSString * const REQUEST_DOMAIN = @"/website/";
NSString * const REQUEST_URL =@"/Krome-webapp/api/";

//NSString * const API_SID = @"2a0e921b9cb9ba39b8894ab82ace56e6";
//NSString * const API_PID = @"3979ae6e3a16eec8e8a9903fd4404f04";


//NSString * const REQUEST_TYPE_PLAIN =@"plain";
//NSString * const REQUEST_TYPE_BODY =@"body";
//NSString * const REQUEST_TYPE_IMAGE =@"image";


//NSString * const HOST_NAME = @"172.16.1.225"; //--------> testing
NSString * const HOST_NAME = @"184.106.163.41"; //------> production
int const PORT_NUMBER = 1199;
int const WS_BADREQUEST = 400;
int const WS_UNAUTHORIZED = 401;
int const WS_UNPROCESSABLE = 402;
int const WS_INTERNALSERVER = 403;
int const WS_SUCCESS = 200;



@end
