//
//  ArtistPhotoViewController.m
//  MyArt
//
//  Created by Esteban Mac on 13/01/15.
//  Copyright (c) 2015 OM. All rights reserved.
//

#import "ArtistPhotoViewController.h"

@interface ArtistPhotoViewController ()

@end

@implementation ArtistPhotoViewController

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
    self.viewBackground.alpha = 0.0;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    
    if (self.photoSelected) {
        self.imgSelected.image = self.photoSelected;
    }
    
    [self goNormalStars];
    [self goHighlight:4];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)deletePhoto:(id)sender {
}

- (IBAction)shareEmail:(id)sender {
}
- (IBAction)shareTwitter:(id)sender {
}
- (IBAction)shareFacebook:(id)sender {
}

-(void)goNormalStars{
    self.imgStar1.highlighted = NO;
    self.imgStar2.highlighted = NO;
    self.imgStar3.highlighted = NO;
    self.imgStar4.highlighted = NO;
    self.imgStar5.highlighted = NO;
}

-(void)goHighlight:(int)number{
    
    if (number >= 1)
        self.imgStar1.highlighted = YES;
    if (number >= 2)
        self.imgStar2.highlighted = YES;
    if (number >= 3)
        self.imgStar3.highlighted = YES;
    if (number >= 4)
        self.imgStar4.highlighted = YES;
    if (number >= 5)
        self.imgStar5.highlighted = YES;
}
@end
