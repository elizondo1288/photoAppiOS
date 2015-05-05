//
//  PhotoViewController.m
//  MyArt
//
//  Created by Esteban Mac on 11/01/15.
//  Copyright (c) 2015 OM. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

bool FLAG_ISZOOMED = NO;


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
    
    UITapGestureRecognizer * dobleTapImageBefore = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubletapImage)];
    dobleTapImageBefore.numberOfTapsRequired = 2;
    [self.imgPhotoSelected addGestureRecognizer:dobleTapImageBefore];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //self.scrollPhoto.contentSize = self.imageSelected.size;
    self.scrollPhoto.delegate = self;
    
    // self.scroll panning/scrolling in the scrollView
    self.scrollPhoto.scrollEnabled = YES;
    
    
    // For supporting zoom,
    self.scrollPhoto.minimumZoomScale = 1.0;
    self.scrollPhoto.maximumZoomScale = 3.0;
    
    
    self.scrollPhoto.zoomScale = 1.0f;
    self.scrollPhoto.bounces = NO;
    
    self.viewInfoArtist.alpha = 0.0;
    self.viewBackground.alpha = 0.0;
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    if (self.imageSelected) {
        self.imgPhotoSelected.image = self.imageSelected;
    }
    
    CGRect rect = self.imgPhotoSelected.frame;
    [self.scrollPhoto zoomToRect:rect animated:NO];

}

-(void)viewDidLayoutSubviews{
    [self.scrollPhoto setScrollEnabled:YES];
    [self.scrollPhoto setContentSize:CGSizeMake(self.imgPhotoSelected.frame.size.width, self.imgPhotoSelected.frame.size.height)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        self.imgPhotoSelected.image = nil;
    }];
    
}

- (IBAction)showInfo:(id)sender {
    
    self.lblArtistName.text = @"Pedro Perez";
    self.lblPhotoAmmount.text = @"3 photo(s) in MyArt";
    
    [self goNormalStars];
    [self goHighlight:3];
    
    [UIView animateWithDuration:1.0 animations:^{
        self.viewInfoArtist.alpha = 1.0;
    } completion:nil];
}




#pragma mark - Gestures

-(void)doubletapImage{
    
    if (FLAG_ISZOOMED) {
        [self.scrollPhoto setZoomScale:1.0 animated:YES];
        FLAG_ISZOOMED = NO;
    }else{
        [self.scrollPhoto setZoomScale:3.0 animated:YES];
        FLAG_ISZOOMED = YES;
    }
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

#pragma mark - Scroll View Delegate
- (UIView*)viewForZoomingInScrollView:(UIScrollView *)aScrollView {
    
    NSLog(@"entro en viewfoRzoom");
    return self.imgPhotoSelected;
}

-(void)scrollViewDidZoom:(UIScrollView *)scrollView{
    
}


#pragma mark - Artist info view methods

- (IBAction)closeInfo:(id)sender {
    
    [UIView animateWithDuration:1.0 animations:^{
        self.viewInfoArtist.alpha = 0.0;
    } completion:nil];
    
}

- (IBAction)sendEmail:(id)sender {
    // Email Subject
    NSString *emailTitle = @"Hello Artist / Interest In Photo";
    // Email Content
    NSString *messageBody = @"<Write message here>";
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"support@kromephotos.com"];
    
    if ([MFMailComposeViewController canSendMail]) {
        
        MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
        mc.mailComposeDelegate = self;
        
        [mc setSubject:emailTitle];
        [mc setMessageBody:messageBody isHTML:NO];
        [mc setToRecipients:toRecipents];
        
        NSData *data = UIImagePNGRepresentation(self.imgPhotoSelected.image);
        [mc addAttachmentData:data
                     mimeType:@"image/png"
                     fileName:@"photo.png"];
        
        // Present mail view controller on screen
        [self presentViewController:mc animated:YES completion:NULL];
    }
}



#pragma mark - Emails
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:{
            
            break;
        }
        case MFMailComposeResultSaved:
            break;
        case MFMailComposeResultSent:
        {
            break;
        }
        case MFMailComposeResultFailed:
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}


@end
