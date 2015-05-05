//
//  RequestInfo.m
//  RequestsManager
//
//  Created by Esteban Mac on 25/11/14.
//  Copyright (c) 2014 OM. All rights reserved.
//

#import "RequestInfo.h"

@implementation RequestInfo

-(RequestInfo *) createRequestInfowithAction:(NSString *)action withTag:(NSString *)tag withBody:(NSString *)body andType:(int)type{
    self.action = action;
    self.tag = tag;
    self.body = body;
    self.type = type;
    
    return self;
}

@end
