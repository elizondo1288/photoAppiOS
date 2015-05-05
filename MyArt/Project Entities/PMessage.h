//
//  PMessage.h
//  MyArt
//
//  Created by Esteban Mac on 06/01/15.
//  Copyright (c) 2015 OM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PMessage : NSObject

@property (nonatomic,strong) NSString * message;
@property (nonatomic,strong) NSString * author;
@property (nonatomic,strong) NSString * date;
@property (nonatomic,strong) NSString * title;

-(PMessage *) initWithMessage:(NSString *)message andAuthor:(NSString *)author andDate:(NSString *)date andTitle:(NSString *)title;


@end
