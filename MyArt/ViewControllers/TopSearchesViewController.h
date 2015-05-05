//
//  TopSearchesViewController.h
//  MyArt
//
//  Created by Esteban Mac on 26/01/15.
//  Copyright (c) 2015 OM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Draw2D.h"

@interface TopSearchesViewController : UIViewController

@property (weak, nonatomic) IBOutlet Draw2D *viewFirstSearch;
@property (weak, nonatomic) IBOutlet Draw2D *viewSecondSearch;
@property (weak, nonatomic) IBOutlet Draw2D *viewThirdSearch;
@property (weak, nonatomic) IBOutlet Draw2D *viewFourthSearch;
@property (weak, nonatomic) IBOutlet Draw2D *viewFifthSearch;

@property (weak, nonatomic) IBOutlet UILabel *lblFirst;
@property (weak, nonatomic) IBOutlet UILabel *lblSecond;
@property (weak, nonatomic) IBOutlet UILabel *lblThird;
@property (weak, nonatomic) IBOutlet UILabel *lblFourth;
@property (weak, nonatomic) IBOutlet UILabel *lblFifth;

@property (weak, nonatomic) IBOutlet UIView *viewBackground;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;


@end
