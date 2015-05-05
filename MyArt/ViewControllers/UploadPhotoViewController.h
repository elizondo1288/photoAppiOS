//
//  UploadPhotoViewController.h
//  MyArt
//
//  Created by Esteban Mac on 12/01/15.
//  Copyright (c) 2015 OM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UploadPhotoViewController : UIViewController <UIScrollViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollPhoto;
@property (weak, nonatomic) IBOutlet UIImageView *imgPhotoSelected;

@property (weak, nonatomic) IBOutlet UIView *viewRemember1;
@property (weak, nonatomic) IBOutlet UIView *viewRemember2;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIView *viewRememberMain;

@property (weak, nonatomic) IBOutlet UIView *viewBackground;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end
