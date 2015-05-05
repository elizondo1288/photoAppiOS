//
//  MyPhotosViewController.h
//  MyArt
//
//  Created by Esteban Mac on 12/01/15.
//  Copyright (c) 2015 OM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyPhotosViewController : UIViewController <UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *colectionPhotos;

@property (weak, nonatomic) IBOutlet UIView *viewBackground;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end
