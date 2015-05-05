//
//  PMessage.m
//  MyArt
//
//  Created by Esteban Mac on 06/01/15.
//  Copyright (c) 2015 OM. All rights reserved.
//

#import "PMessage.h"

@implementation PMessage

-(PMessage *) initWithMessage:(NSString *)message andAuthor:(NSString *)author andDate:(NSString *)date andTitle:(NSString *)title{
    self.message = message;
    self.author = author;
    self.date = date;
    self.title = title;
    return self;
}

@end
