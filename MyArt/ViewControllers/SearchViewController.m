//
//  SearchViewController.m
//  MyArt
//
//  Created by Esteban Mac on 07/01/15.
//  Copyright (c) 2015 OM. All rights reserved.
//

#import "SearchViewController.h"
#import "ImageCollectionViewCell.h"
#import "PhotoViewController.h"

@interface SearchViewController ()
@property (nonatomic,strong) NSMutableArray * searchResults;
@end

@implementation SearchViewController


NSString * imageName = @"";

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
    self.searchBar.delegate = self;
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

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Search Bar Delegates
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSLog(@"Text change - %@",searchText);
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"Cancel clicked");
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"Search Clicked");
    [self.searchBar resignFirstResponder];
    
    
    self.searchResults = [NSMutableArray arrayWithObjects:@"IMG_1020.JPG",@"IMG_1723.JPG",@"IMG_2430.JPG",@"IMG_1020.JPG",@"IMG_2430.JPG",@"IMG_1020.JPG",@"IMG_1723.JPG",@"IMG_1020.JPG",@"IMG_2430.JPG",@"IMG_1020.JPG",@"IMG_1723.JPG",@"IMG_2430.JPG",@"IMG_1020.JPG",@"IMG_2430.JPG",@"IMG_1020.JPG", nil];
    [self.colectionPhotos reloadData];
    
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
    
    imageName = imageString;
    
    [self performSegueWithIdentifier:@"search_images_segue" sender:self];
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath{
    

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"search_images_segue"]) {
        PhotoViewController * view = (PhotoViewController *) segue.destinationViewController;
        
        view.imageSelected = [UIImage imageNamed:imageName];
        
    }
}




@end
