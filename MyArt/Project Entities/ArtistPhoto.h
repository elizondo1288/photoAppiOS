//
//  ArtistPhoto.h
//  MyArt
//
//  Created by Esteban Mac on 25/01/15.
//  Copyright (c) 2015 OM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArtistPhoto : NSObject

@property (nonatomic,strong) NSString * rank;
@property (nonatomic,strong) NSString * ammountRates;
@property (nonatomic,strong) NSString * photoId;
@property (nonatomic,strong) NSString * photoUrl;

-(ArtistPhoto *)initWithRank:(NSString *)rank
            withAmmountRates:(NSString *)ar
                 withPhotoId:(NSString *)pid
                 andPhotoURL:(NSString *)purl;

@end
