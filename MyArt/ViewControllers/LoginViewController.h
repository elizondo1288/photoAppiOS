//
//  LoginViewController.h
//  MyArt
//
//  Created by Esteban Mac on 31/12/14.
//  Copyright (c) 2014 OM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UITextField *txtUserName_SignIn;
@property (weak, nonatomic) IBOutlet UITextField *txtPass1_SignIn;
@property (weak, nonatomic) IBOutlet FBLoginView *facebook_SignIn;


//Sign Up View
@property (weak, nonatomic) IBOutlet UITextField *txtEmail_SignUp;
@property (weak, nonatomic) IBOutlet UITextField *txtPass1_SignUp;
@property (weak, nonatomic) IBOutlet UITextField *txtPass2_SignUp;
@property (weak, nonatomic) IBOutlet UIView *view_SignUp;
@property (weak, nonatomic) IBOutlet FBLoginView *facebook_SignUp;

@end
