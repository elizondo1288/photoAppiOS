//
//  DailyArtistViewController.h
//  MyArt
//
//  Created by Esteban Mac on 25/01/15.
//  Copyright (c) 2015 OM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DailyArtistViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lblArtist;
@property (weak, nonatomic) IBOutlet UILabel *lblAmountPhotos;

@property (weak, nonatomic) IBOutlet UIImageView *imgStar1;
@property (weak, nonatomic) IBOutlet UIImageView *imgStar2;
@property (weak, nonatomic) IBOutlet UIImageView *imgStar3;
@property (weak, nonatomic) IBOutlet UIImageView *imgStar4;
@property (weak, nonatomic) IBOutlet UIImageView *imgStar5;

@property (weak, nonatomic) IBOutlet UITableView *tblPhotosArtistDay;

@property (weak, nonatomic) IBOutlet UIView *viewBackground;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end
