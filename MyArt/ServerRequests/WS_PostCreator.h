//
//  WS_PostCreator.h
//  Krome
//
//  Created by Orlando Esteban Elizondo on 6/23/14.
//  Copyright (c) 2014 Krome. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WS_PostCreator : NSObject


+(WS_PostCreator *)sharedManager;

+(NSMutableURLRequest *) createRequest:(NSURL *)url withBody:(NSString *)json;

@end
