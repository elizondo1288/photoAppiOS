//
//  MyPhotosViewController.m
//  MyArt
//
//  Created by Esteban Mac on 12/01/15.
//  Copyright (c) 2015 OM. All rights reserved.
//

#import "MyPhotosViewController.h"
#import "ImageCollectionViewCell.h"
#import "ArtistPhotoViewController.h"

@interface MyPhotosViewController ()

@property (nonatomic,strong) NSMutableArray * searchResults;

@end

@implementation MyPhotosViewController

NSString * imageName_MyPhotos = @"";


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
    
    self.colectionPhotos.delegate = self;
    self.colectionPhotos.dataSource = self;
    self.viewBackground.alpha = 0.0;
    
    self.searchResults = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    self.searchResults = [NSMutableArray arrayWithObjects:@"IMG_1020.JPG",@"IMG_1723.JPG",@"IMG_2430.JPG",@"IMG_1020.JPG",@"IMG_2430.JPG",@"IMG_1020.JPG",@"IMG_1723.JPG",@"IMG_1020.JPG",@"IMG_2430.JPG",@"IMG_1020.JPG",@"IMG_1723.JPG",@"IMG_2430.JPG",@"IMG_1020.JPG",@"IMG_2430.JPG",@"IMG_1020.JPG", nil];
    [self.colectionPhotos reloadData];
    
    
}
- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Collection View

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView {
    // _data is a class member variable that contains one array per section.
    return 1;
}

- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.searchResults count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ImageCollectionViewCell * imgCell = [self.colectionPhotos dequeueReusableCellWithReuseIdentifier:@"imgCell" forIndexPath:indexPath];
    
    
    NSString * imageName = [self.searchResults objectAtIndex:indexPath.row];
    
    UIImage * imagep = [UIImage imageNamed:imageName];
    [imgCell.imgPhoto setImage:imagep];
    [imgCell.lblName setText:imageName];
    
    return imgCell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString * imageString = [self.searchResults objectAtIndex:indexPath.row];
    
    NSLog(@"%@",imageString);
    
    imageName_MyPhotos = imageString;
    
   [self performSegueWithIdentifier:@"myPhotos_Photos_segue" sender:self];
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"myPhotos_Photos_segue"]) {
        ArtistPhotoViewController * view = (ArtistPhotoViewController *) segue.destinationViewController;
        
        view.photoSelected = [UIImage imageNamed:imageName_MyPhotos];
        
    }
}
@end
