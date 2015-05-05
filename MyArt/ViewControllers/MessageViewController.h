//
//  MessageViewController.h
//  MyArt
//
//  Created by Esteban Mac on 06/01/15.
//  Copyright (c) 2015 OM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *txtAreaReply;
@property (weak, nonatomic) IBOutlet UIView *viewReply;

@property (weak, nonatomic) IBOutlet UIView *viewBackground;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end
