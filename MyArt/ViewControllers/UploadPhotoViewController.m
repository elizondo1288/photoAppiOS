//
//  UploadPhotoViewController.m
//  MyArt
//
//  Created by Esteban Mac on 12/01/15.
//  Copyright (c) 2015 OM. All rights reserved.
//

#import "UploadPhotoViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface UploadPhotoViewController ()

@property (nonatomic,strong) UIImagePickerController * camara;

@end

@implementation UploadPhotoViewController

bool FLAG_ISZOOMED_UPLOAD = NO;

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
    
    //Gestures to swipe the images
    UISwipeGestureRecognizer * swipeRightWelcome = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeRight)];
    
    UISwipeGestureRecognizer * swipeLeftWelcome = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeLeft)];
    
    UITapGestureRecognizer * dobleTapImageBefore = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubletapImage)];
    dobleTapImageBefore.numberOfTapsRequired = 2;
    
    [swipeLeftWelcome setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeRightWelcome setDirection:UISwipeGestureRecognizerDirectionRight];
    
    [self.viewRemember2 addGestureRecognizer:swipeRightWelcome];
    [self.viewRemember1 addGestureRecognizer:swipeLeftWelcome];
    
    [self.imgPhotoSelected addGestureRecognizer:dobleTapImageBefore];
    
    self.viewRemember2.alpha = 0.0;
    self.viewBackground.alpha = 0.0;
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
    [self dismissViewControllerAnimated:YES completion:NO];
}

#pragma mark - Gestures

-(void)doubletapImage{
    
    if (FLAG_ISZOOMED_UPLOAD) {
        [self.scrollPhoto setZoomScale:1.0 animated:YES];
        FLAG_ISZOOMED_UPLOAD = NO;
    }else{
        [self.scrollPhoto setZoomScale:3.0 animated:YES];
        FLAG_ISZOOMED_UPLOAD = YES;
    }
}

-(void)swipeRight{

    [UIView animateWithDuration:0.5 animations:^{
        self.viewRemember1.alpha = 1.0;
        self.viewRemember2.alpha = 0.0;
    } completion:^(BOOL finished) {
        self.pageControl.currentPage = 0;
    }];

}

-(void)swipeLeft{
    
    [UIView animateWithDuration:0.5 animations:^{
        self.viewRemember1.alpha = 0.0;
        self.viewRemember2.alpha = 1.0;
    } completion:^(BOOL finished) {
        self.pageControl.currentPage = 1;
    }];
    
}


- (IBAction)continueUploading:(id)sender {
    
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.viewRememberMain.alpha = 0.0;
        self.viewRemember1.alpha = 0.0;
        self.viewRemember2.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        
        self.camara = [[UIImagePickerController alloc] init];
        self.camara.delegate = self;
        self.camara.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:self.camara animated:YES completion:NULL];
    }];
    
    
}

#pragma mark - Scroll View Delegate
- (UIView*)viewForZoomingInScrollView:(UIScrollView *)aScrollView {
    
    NSLog(@"entro en viewfoRzoom");
    return self.imgPhotoSelected;
}

-(void)scrollViewDidZoom:(UIScrollView *)scrollView{
    
}

#pragma mark - UIPickerView delegate methods
//Tells the delegate that the user picked a still image or movie.
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    UIImage *imageFromCamara = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self.imgPhotoSelected setImage:imageFromCamara];
    imageFromCamara = nil;
    
    CGRect rect = self.imgPhotoSelected.frame;
    [self.scrollPhoto zoomToRect:rect animated:NO];
}
@end
