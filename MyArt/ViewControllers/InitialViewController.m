//
//  InitialViewController.m
//  MyArt
//
//  Created by Esteban Mac on 14/01/15.
//  Copyright (c) 2015 OM. All rights reserved.
//

#import "InitialViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface InitialViewController ()

@end

@implementation InitialViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.lblCreateArt.alpha = 1.0;
    [self.lblCreateArt.layer setShadowColor:[UIColor whiteColor].CGColor];
    [self.lblCreateArt.layer setShadowOpacity:1];
    [self.lblCreateArt.layer setShadowRadius:9.0];
    [self.lblCreateArt.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    [self.lblCreateArt.layer setCornerRadius:30.0f];
    
    self.lblWantArt.alpha = 1.0;
    [self.lblWantArt.layer setShadowColor:[UIColor whiteColor].CGColor];
    [self.lblWantArt.layer setShadowOpacity:1];
    [self.lblWantArt.layer setShadowRadius:9.0];
    [self.lblWantArt.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    [self.lblWantArt.layer setCornerRadius:30.0f];
    
    //gesture to show the viewSelectPhotoMenu
    UITapGestureRecognizer * tapCreate = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userCreatesArt)];
    [self.lblCreateArt addGestureRecognizer:tapCreate];
    

    //gesture to show the viewSelectPhotoMenu
    UITapGestureRecognizer * tapWant = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userWantArt)];
    [self.lblWantArt addGestureRecognizer:tapWant];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

-(void)userCreatesArt{
    [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"UserType"];
    [self performSegueWithIdentifier:@"init_login_segue" sender:self];
}

-(void)userWantArt{
    [[NSUserDefaults standardUserDefaults]setObject:@"2" forKey:@"UserType"];
    [self performSegueWithIdentifier:@"init_home_segue" sender:self];
}



@end
