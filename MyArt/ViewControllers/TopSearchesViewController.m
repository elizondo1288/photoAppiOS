//
//  TopSearchesViewController.m
//  MyArt
//
//  Created by Esteban Mac on 26/01/15.
//  Copyright (c) 2015 OM. All rights reserved.
//

#import "TopSearchesViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface TopSearchesViewController ()

@end

@implementation TopSearchesViewController

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
    
    [self.viewFirstSearch.layer setShadowColor:[UIColor whiteColor].CGColor];
    [self.viewFirstSearch.layer setShadowOpacity:1];
    [self.viewFirstSearch.layer setShadowRadius:3.0];
    [self.viewFirstSearch.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    
    [self.viewSecondSearch.layer setShadowColor:[UIColor whiteColor].CGColor];
    [self.viewSecondSearch.layer setShadowOpacity:1];
    [self.viewSecondSearch.layer setShadowRadius:3.0];
    [self.viewSecondSearch.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    
    [self.viewThirdSearch.layer setShadowColor:[UIColor whiteColor].CGColor];
    [self.viewThirdSearch.layer setShadowOpacity:1];
    [self.viewThirdSearch.layer setShadowRadius:3.0];
    [self.viewThirdSearch.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    
    [self.viewFourthSearch.layer setShadowColor:[UIColor whiteColor].CGColor];
    [self.viewFourthSearch.layer setShadowOpacity:1];
    [self.viewFourthSearch.layer setShadowRadius:3.0];
    [self.viewFourthSearch.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    
    [self.viewFifthSearch.layer setShadowColor:[UIColor whiteColor].CGColor];
    [self.viewFifthSearch.layer setShadowOpacity:1];
    [self.viewFifthSearch.layer setShadowRadius:3.0];
    [self.viewFifthSearch.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    
    [self setUpUIInitial];
    
}

-(void)setUpUIInitial{
    
    self.viewFirstSearch.alpha = 0.0;
    self.viewSecondSearch.alpha = 0.0;
    self.viewThirdSearch.alpha = 0.0;
    self.viewFourthSearch.alpha = 0.0;
    self.viewFifthSearch.alpha = 0.0;
    
    self.lblFirst.alpha = 0.0;
    self.lblSecond.alpha = 0.0;
    self.lblThird.alpha = 0.0;
    self.lblFourth.alpha = 0.0;
    self.lblFifth.alpha = 0.0;
    
    self.viewBackground.alpha = 0.0;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    

}
- (IBAction)loadInfo:(id)sender {
    
    NSNumber * numb1 = [NSNumber numberWithFloat:250.f];
    NSNumber * numb2 = [NSNumber numberWithFloat:200.f];
    NSNumber * numb3 = [NSNumber numberWithFloat:150.f];
    NSNumber * numb4 = [NSNumber numberWithFloat:100.f];
    NSNumber * numb5 = [NSNumber numberWithFloat:50.f];
    
    NSArray * values = [NSArray arrayWithObjects:numb1,numb2,numb3,numb4,numb5, nil];
    
    [self animations:values];
}

-(void)animations:(NSArray *)array{
    
    CGRect rect1 = [self.viewFirstSearch frame];
    CGRect rect2 = [self.viewSecondSearch frame];
    CGRect rect3 = [self.viewThirdSearch frame];
    CGRect rect4 = [self.viewFourthSearch frame];
    CGRect rect5 = [self.viewFifthSearch frame];

    
    rect1.size.width = [[array objectAtIndex:0]floatValue];
    rect2.size.width = [[array objectAtIndex:1]floatValue];
    rect3.size.width = [[array objectAtIndex:2]floatValue];
    rect4.size.width = [[array objectAtIndex:3]floatValue];
    rect5.size.width = [[array objectAtIndex:4]floatValue];
    
    
    
    
    [UIView animateWithDuration:0.7 animations:^{
        [self.viewFirstSearch setFrame:rect1];
        [self.viewSecondSearch setFrame:rect2];
        [self.viewThirdSearch setFrame:rect3];
        [self.viewFourthSearch setFrame:rect4];
        [self.viewFifthSearch setFrame:rect5];
        
        self.viewFirstSearch.alpha = 1.0;
        self.viewSecondSearch.alpha = 1.0;
        self.viewThirdSearch.alpha = 1.0;
        self.viewFourthSearch.alpha = 1.0;
        self.viewFifthSearch.alpha = 1.0;
        
        self.lblFirst.alpha = 1.0;
        self.lblSecond.alpha = 1.0;
        self.lblThird.alpha = 1.0;
        self.lblFourth.alpha = 1.0;
        self.lblFifth.alpha = 1.0;
    }];
    
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
