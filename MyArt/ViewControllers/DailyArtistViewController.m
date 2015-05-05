//
//  DailyArtistViewController.m
//  MyArt
//
//  Created by Esteban Mac on 25/01/15.
//  Copyright (c) 2015 OM. All rights reserved.
//

#import "DailyArtistViewController.h"
#import "ArtistPhoto.h"
#import "PhotoViewController.h"


@interface DailyArtistViewController ()

@property (nonatomic,strong) NSMutableArray * arrayPhotosArtist;

@end

@implementation DailyArtistViewController

NSString * URL_TOGET = @"";

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
    self.viewBackground.alpha = 0.0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    ArtistPhoto * ap1 = [[ArtistPhoto alloc]initWithRank:@"3" withAmmountRates:@"1" withPhotoId:@"123" andPhotoURL:@"IMG_2430.JPG"];
    
    ArtistPhoto * ap2 = [[ArtistPhoto alloc]initWithRank:@"4" withAmmountRates:@"20" withPhotoId:@"123" andPhotoURL:@"IMG_1723.JPG"];
    
    ArtistPhoto * ap3 = [[ArtistPhoto alloc]initWithRank:@"2" withAmmountRates:@"15" withPhotoId:@"123" andPhotoURL:@"IMG_1020.JPG"];
    
    ArtistPhoto * ap4 = [[ArtistPhoto alloc]initWithRank:@"1" withAmmountRates:@"4" withPhotoId:@"123" andPhotoURL:@"IMG_1723.JPG"];
    
    
    self.arrayPhotosArtist = [NSMutableArray arrayWithObjects:ap1,ap2,ap3,ap4,nil];
    
    self.tblPhotosArtistDay.delegate = self;
    self.tblPhotosArtistDay.dataSource = self;
    [self.tblPhotosArtistDay reloadData];
}

- (IBAction)sendMessage:(id)sender {
    
}

- (IBAction)sendEmail:(id)sender {
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark- TableView delegates
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70.0;
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.arrayPhotosArtist count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *CellIdentifier = @"cellBestPhoto";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
    if ( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    
    ArtistPhoto * ap = [self.arrayPhotosArtist objectAtIndex:indexPath.row];
    
    //100 image thumbnail
    UIImageView * imgIcon = (UIImageView *)[cell viewWithTag:100];
    imgIcon.image = [UIImage imageNamed:ap.photoUrl];
        
    //101 lbl amount ranks
    UILabel * lblId = (UILabel *)[cell viewWithTag:101];
    lblId.text = [NSString stringWithFormat:@"%@",ap.ammountRates];
    
    if ((ap.rank) && (![ap.rank isEqualToString:@""])){
        int value = [ap.rank intValue];
        
        if (value >=1) {
            UIImageView * imgStar = (UIImageView *)[cell viewWithTag:102];
            imgStar.highlighted = YES;
        }
        if (value >=2) {
            UIImageView * imgStar = (UIImageView *)[cell viewWithTag:103];
            imgStar.highlighted = YES;
        }
        if (value >=3) {
            UIImageView * imgStar = (UIImageView *)[cell viewWithTag:104];
            imgStar.highlighted = YES;
        }
        if (value >=4) {
            UIImageView * imgStar = (UIImageView *)[cell viewWithTag:105];
            imgStar.highlighted = YES;
        }
        if (value >=5) {
            UIImageView * imgStar = (UIImageView *)[cell viewWithTag:106];
            imgStar.highlighted = YES;
        }
        
        
    }
        
    return cell;
        
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.tblPhotosArtistDay deselectRowAtIndexPath:indexPath animated:YES];
    
    ArtistPhoto * photo = [self.arrayPhotosArtist objectAtIndex:indexPath.row];
    
    URL_TOGET = photo.photoUrl;
    
    [self performSegueWithIdentifier:@"artistDay_photo_segue" sender:self];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    PhotoViewController *vc = (PhotoViewController *) segue.destinationViewController;
    vc.imageSelected = [UIImage imageNamed:URL_TOGET];
}

@end
