//
//  LoginViewController.m
//  MyArt
//
//  Created by Esteban Mac on 31/12/14.
//  Copyright (c) 2014 OM. All rights reserved.
//

#import "LoginViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    
    // drop shadow
    self.loginView.alpha = 0.0;
    self.view_SignUp.alpha = 0.0;
    [self.loginView.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.loginView.layer setShadowOpacity:1];
    [self.loginView.layer setShadowRadius:3.0];
    [self.loginView.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    [self.loginView.layer setCornerRadius:30.0f];

    self.view_SignUp.alpha = 0.0;
    [self.view_SignUp.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.view_SignUp.layer setShadowOpacity:1];
    [self.view_SignUp.layer setShadowRadius:3.0];
    [self.view_SignUp.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    [self.view_SignUp.layer setCornerRadius:30.0f];
    
    self.txtUserName_SignIn.delegate = self;
    self.txtPass1_SignIn.delegate = self;
    
    self.txtEmail_SignUp.delegate = self;
    self.txtPass1_SignUp.delegate = self;
    self.txtPass2_SignUp.delegate = self;
    
    // In your viewDidLoad method:
    self.facebook_SignIn.readPermissions = @[@"public_profile", @"email", @"user_friends"];
//    self.facebook_SignIn.delegate = self;
    
    CGRect rect = [self.facebook_SignIn frame];
    rect.size.width = rect.size.width + 150;
    [self.facebook_SignIn setFrame:rect];
}

-(void)viewDidAppear:(BOOL)animated{

    [UIView animateWithDuration:0.5 animations:^{
        self.loginView.alpha = 1.0;
        
    } completion:^(BOOL finished) {
       
        //completion code can go here
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Sign In View
- (IBAction)goSignUp:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        self.view_SignUp.alpha = 1.0;
        self.loginView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self.view endEditing:YES];
    }];
}

- (IBAction)signIn:(id)sender {
    
    [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"UserType"];
    [self performSegueWithIdentifier:@"goHome_segue" sender:self];
}

#pragma mark - Sign Up View
- (IBAction)signUp:(id)sender {
    [self performSegueWithIdentifier:@"goHome_segue" sender:self];
}

- (IBAction)goSignIn:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        self.view_SignUp.alpha = 0.0;
        self.loginView.alpha = 1.0;
    } completion:^(BOOL finished) {
        [self.view endEditing:YES];
    }];
    
}

- (IBAction)showInfo_SignUp:(id)sender {
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Information" message:@"text of information" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alert show];
}



#pragma mark - UITextfield delegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


#pragma mark - Facebook Delegate
// This method will be called when the user information has been fetched
- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
   // NSString * text = user.objectID;
    NSString * name = user.name;
    
    NSLog(@"qui con la info de %@",name);
}

@end
