//
//  ImageCollectionViewCell.h
//  MyArt
//
//  Created by Esteban Mac on 09/01/15.
//  Copyright (c) 2015 OM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgPhoto;
@property (weak, nonatomic) IBOutlet UILabel *lblName;


@end
