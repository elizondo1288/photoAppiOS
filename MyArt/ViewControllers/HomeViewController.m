//
//  HomeViewController.m
//  MyArt
//
//  Created by Esteban Mac on 02/01/15.
//  Copyright (c) 2015 OM. All rights reserved.
//

#import "HomeViewController.h"
#import "LoginViewController.h"
@interface HomeViewController ()


@property (nonatomic,strong) NSMutableArray * userOptions;
@property (nonatomic,strong) NSMutableArray * userOptions_Icons;
@property (nonatomic,strong) NSMutableArray * appOptions;

@end

@implementation HomeViewController

NSString * MyOders = @"My Photos";
NSString * MyInformation = @"My information";
NSString * ArtistOfDay = @"Artist of the Day";
NSString * PhotoOfDay = @"Photo of the Day";
NSString * LookSomething = @"Looking for Something?";
NSString * MyMessages = @"My Messages";

NSString * TopSearches = @"Top Searches";
NSString * FAQs = @"FAQ's";
NSString * AboutUs = @"About Us";
NSString * ContactUs = @"Contact Us";

NSString * MakeAccount = @"Login";



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
    
    
    self.appOptions = [NSMutableArray arrayWithObjects:TopSearches,FAQs,AboutUs,ContactUs, nil];
    
    self.tblUserOptions.delegate = self;
    self.tblUserOptions.dataSource = self;
    
    self.tblAppOptions.delegate = self;
    self.tblAppOptions.dataSource = self;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSString * type = [[NSUserDefaults standardUserDefaults]objectForKey:@"UserType"];
    
    if (type && [type isEqualToString:@"1"]) {
        
        self.userOptions = [NSMutableArray arrayWithObjects:MyOders,MyInformation, ArtistOfDay, PhotoOfDay,LookSomething,MyMessages, nil];
        
        self.userOptions_Icons = [NSMutableArray arrayWithObjects:@"Icon_orders.png",@"Icon_more.png", @"Icon_orders.png", @"Icon_orders.png",@"Icon_more.png",@"Icon_more.png",@"Statistics",nil];
        
    }else{
        
        self.userOptions = [NSMutableArray arrayWithObjects:MakeAccount, ArtistOfDay, PhotoOfDay,LookSomething,MyMessages, nil];
        
        self.userOptions_Icons = [NSMutableArray arrayWithObjects:@"Icon_orders.png",@"Icon_more.png", @"Icon_orders.png", @"Icon_orders.png",@"Icon_more.png",@"Icon_more.png",@"Statistics",nil];
        
    }
    
    [self.tblUserOptions reloadData];
    [self.tblAppOptions reloadData];
    
}
- (IBAction)signOut:(id)sender {
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"UserType"];
    [self.view.window.rootViewController dismissViewControllerAnimated:YES completion:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#pragma mark- TableView delegates
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 35.0;
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == self.tblUserOptions) {
        return [self.userOptions count];
    }else{
        return [self.appOptions count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == self.tblUserOptions) {
        
        static NSString *CellIdentifier = @"cellUser";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if ( cell == nil ) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        }
        
        
        NSString * option = [self.userOptions objectAtIndex:indexPath.row];
        
        //100 image
        UIImageView * imgIcon = (UIImageView *)[cell viewWithTag:100];
        imgIcon.image = [UIImage imageNamed:[self.userOptions_Icons objectAtIndex:indexPath.row]];
        
        //101 option
        UILabel * lblId = (UILabel *)[cell viewWithTag:101];
        lblId.text = [NSString stringWithFormat:@"%@",option];
        
        return cell;
        
    }else{
        
        static NSString *CellIdentifier = @"cellApp";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if ( cell == nil ) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        }
        
        
        NSString * option = [self.appOptions objectAtIndex:indexPath.row];
        
        //100 image
        UIImageView * imgIcon = (UIImageView *)[cell viewWithTag:100];
        imgIcon.image = [UIImage imageNamed:[self.userOptions_Icons objectAtIndex:indexPath.row]];
        
        //101 option
        UILabel * lblId = (UILabel *)[cell viewWithTag:101];
        lblId.text = [NSString stringWithFormat:@"%@",option];

        return cell;
    }
    return nil;
    
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //
    
    if (tableView == self.tblUserOptions) {
    
        [self.tblUserOptions deselectRowAtIndexPath:indexPath animated:YES];
        
        NSString * option = [self.userOptions objectAtIndex:indexPath.row];
        
        if ([option isEqualToString:MyOders]) {
            
            [self performSegueWithIdentifier:@"menu_myPhotos_segue" sender:self];
            
        }else if ([option isEqualToString:MyInformation]){
            
            [self performSegueWithIdentifier:@"menu_artistInfo_segue" sender:self];
            
        }else if ([option isEqualToString:ArtistOfDay]){
            
            [self performSegueWithIdentifier:@"menu_ArtistDay_segue" sender:self];
            
        }else if ([option isEqualToString:PhotoOfDay]){
            
            [self clicked_PhotoOfDay];
            
        }else if ([option isEqualToString:LookSomething]){
            
            [self performSegueWithIdentifier:@"menu_search_segue" sender:self];
            
        }else if ([option isEqualToString:MyMessages]){
            
            [self performSegueWithIdentifier:@"menu_messages_segue" sender:self];
            
        }else if ([option isEqualToString:MakeAccount]){
            
            [self clicked_MakeOrder];
        }
        
    }else{
        
        [self.tblAppOptions deselectRowAtIndexPath:indexPath animated:YES];
        
        NSString * option = [self.appOptions objectAtIndex:indexPath.row];
        
        if ([option isEqualToString:TopSearches]) {
            [self performSegueWithIdentifier:@"menu_top_segue" sender:self];
           
        }else if ([option isEqualToString:MyInformation]){
            
        }else if ([option isEqualToString:ArtistOfDay]){
            
        }else if ([option isEqualToString:PhotoOfDay]){
            
        }else if ([option isEqualToString:LookSomething]){
            
        }
    }
    
}


#pragma mark -  User Options
-(void)clicked_MyOrders{
    
}

-(void)clicked_MyInformation{
    
}

-(void)clicked_ArtistOfDay{
    
}
-(void)clicked_PhotoOfDay{
    
}
-(void)clicked_LookSomething{
    
}
-(void)clicked_MyMessages{
    
}

-(void)clicked_MakeOrder{
    
    UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController * login = [storyBoard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self presentViewController:login animated:YES completion:nil];
    
}
@end
