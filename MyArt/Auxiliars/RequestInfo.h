//
//  RequestInfo.h
//  RequestsManager
//
//  Created by Esteban Mac on 25/11/14.
//  Copyright (c) 2014 OM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestInfo : NSObject

@property (nonatomic,strong) NSString * action;
@property (nonatomic,strong) NSString * tag;
@property (nonatomic,strong) NSString * body;//this could save the json body or text parameters
@property int type;

//constructor method of the request
-(RequestInfo *) createRequestInfowithAction:(NSString *)action withTag:(NSString *)tag withBody:(NSString *)body andType:(int)type;

@end
