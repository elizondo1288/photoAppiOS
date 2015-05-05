//
//  WS_GetCreator.h
//  Krome
//
//  Created by Orlando Esteban Elizondo on 6/23/14.
//  Copyright (c) 2014 Krome. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WS_GetCreator : NSObject


+(WS_GetCreator *)sharedManager;

+(NSMutableURLRequest *) createRequest:(NSURL *)url withParameters:(NSArray *)array;


@end
