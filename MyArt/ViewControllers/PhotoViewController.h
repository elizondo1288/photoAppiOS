//
//  PhotoViewController.h
//  MyArt
//
//  Created by Esteban Mac on 11/01/15.
//  Copyright (c) 2015 OM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageUI/MessageUI.h"

@interface PhotoViewController : UIViewController <UIScrollViewDelegate, MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollPhoto;
@property (weak, nonatomic) IBOutlet UIImageView *imgPhotoSelected;

@property (strong, nonatomic) UIImage * imageSelected;

#pragma mark - info subview
@property (weak, nonatomic) IBOutlet UIView *viewInfoArtist;

@property (weak, nonatomic) IBOutlet UILabel *lblArtistName;
@property (weak, nonatomic) IBOutlet UILabel *lblPhotoAmmount;

@property (weak, nonatomic) IBOutlet UIImageView *imgStar1;
@property (weak, nonatomic) IBOutlet UIImageView *imgStar2;
@property (weak, nonatomic) IBOutlet UIImageView *imgStar3;
@property (weak, nonatomic) IBOutlet UIImageView *imgStar4;
@property (weak, nonatomic) IBOutlet UIImageView *imgStar5;

@property (weak, nonatomic) IBOutlet UIView *viewBackground;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end
