//
//  MessageViewController.m
//  MyArt
//
//  Created by Esteban Mac on 06/01/15.
//  Copyright (c) 2015 OM. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

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
    [self.viewReply setAlpha:0.0];
    self.viewBackground.alpha = 0.0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)goBack:(id)sender {
    [self.viewReply setAlpha:0.0];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)reply:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        self.viewReply.alpha =1.0;
    }];
}

#pragma mark - Reply View methods

- (IBAction)sendReplay:(id)sender {
}

- (IBAction)cancel:(id)sender {
    
    [UIView animateWithDuration:0.3 animations:^{
        self.viewReply.alpha = 0.0;
    } completion:^(BOOL finished) {
        self.txtAreaReply.text = @"";
    }];
}


@end
