//
//  MyInformationViewController.m
//  MyArt
//
//  Created by Esteban Mac on 03/01/15.
//  Copyright (c) 2015 OM. All rights reserved.
//

#import "MyInformationViewController.h"

@interface MyInformationViewController ()

@end

@implementation MyInformationViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveInformation:(id)sender {
    
}
@end
