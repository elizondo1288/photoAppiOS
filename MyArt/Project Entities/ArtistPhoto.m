//
//  ArtistPhoto.m
//  MyArt
//
//  Created by Esteban Mac on 25/01/15.
//  Copyright (c) 2015 OM. All rights reserved.
//

#import "ArtistPhoto.h"

@implementation ArtistPhoto

-(ArtistPhoto *)initWithRank:(NSString *)rank
            withAmmountRates:(NSString *)ar
                 withPhotoId:(NSString *)pid
                 andPhotoURL:(NSString *)purl{
    
    self.rank = rank;
    self.ammountRates = ar;
    self.photoId = pid;
    self.photoUrl = purl;
    
    return self;
}

@end
