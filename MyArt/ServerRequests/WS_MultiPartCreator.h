//
//  WS_MultiPartCreator.h
//  Krome
//
//  Created by Orlando Esteban Elizondo on 6/23/14.
//  Copyright (c) 2014 Krome. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WS_MultiPartCreator : NSObject


+(WS_MultiPartCreator *)sharedManager;

+(NSMutableURLRequest *) createRequest:(NSURL *)url withBody:(NSString *)json andImage:(NSData *)imageData;
@end
