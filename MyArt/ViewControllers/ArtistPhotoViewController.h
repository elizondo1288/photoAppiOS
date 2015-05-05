//
//  ArtistPhotoViewController.h
//  MyArt
//
//  Created by Esteban Mac on 13/01/15.
//  Copyright (c) 2015 OM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArtistPhotoViewController : UIViewController

@property (nonatomic,strong) UIImage * photoSelected;
@property (weak, nonatomic) IBOutlet UIImageView *imgSelected;

@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UILabel *lblAmmountPeople;
@property (weak, nonatomic) IBOutlet UIImageView *imgStar1;
@property (weak, nonatomic) IBOutlet UIImageView *imgStar2;
@property (weak, nonatomic) IBOutlet UIImageView *imgStar3;
@property (weak, nonatomic) IBOutlet UIImageView *imgStar4;
@property (weak, nonatomic) IBOutlet UIImageView *imgStar5;

@property (weak, nonatomic) IBOutlet UIView *viewBackground;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end
