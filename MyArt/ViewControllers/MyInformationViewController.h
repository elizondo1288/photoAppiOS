//
//  MyInformationViewController.h
//  MyArt
//
//  Created by Esteban Mac on 03/01/15.
//  Copyright (c) 2015 OM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyInformationViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtArtistEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtArtistPassword;
@property (weak, nonatomic) IBOutlet UISwitch *switchPassword;


@property (weak, nonatomic) IBOutlet UITextField *txtArtistName;
@property (weak, nonatomic) IBOutlet UITextField *txtArtistLastName;
@property (weak, nonatomic) IBOutlet UITextField *txtemailPayPal;

@property (weak, nonatomic) IBOutlet UIView *viewBackground;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end
