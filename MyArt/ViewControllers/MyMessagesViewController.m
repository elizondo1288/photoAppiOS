//
//  MyMessagesViewController.m
//  MyArt
//
//  Created by Esteban Mac on 06/01/15.
//  Copyright (c) 2015 OM. All rights reserved.
//

#import "MyMessagesViewController.h"
#import "PMessage.h"

@interface MyMessagesViewController ()

@property (nonatomic,strong) NSMutableArray * messagesArray;

@end

@implementation MyMessagesViewController

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
    PMessage * message = [[PMessage alloc]initWithMessage:@"message test" andAuthor:@"Miguel angel" andDate:@"12/13/15" andTitle:@"Title test"];
    
    PMessage * message1 = [[PMessage alloc]initWithMessage:@"message test 2" andAuthor:@"Pedro angel" andDate:@"12/13/15" andTitle:@"Title test"];
    
    
    self.messagesArray = [NSMutableArray arrayWithObjects:message,message1, nil];
 
    self.tblMessages.dataSource = self;
    self.tblMessages.delegate = self;
    [self.tblMessages reloadData];
    
    self.viewBackground.alpha = 0.0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


#pragma mark- TableView delegates
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0;
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
   
    return [self.messagesArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *CellIdentifier = @"cellMessage";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
    if ( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
        
        
    PMessage * msg = [self.messagesArray objectAtIndex:indexPath.row];
        
    //100 image
    UILabel * lblArtist = (UILabel *)[cell viewWithTag:100];
    lblArtist.text = [NSString stringWithFormat:@"%@",msg.author];
    
    //101 option
    UILabel * lblDate = (UILabel *)[cell viewWithTag:101];
    lblDate.text = [NSString stringWithFormat:@"%@",msg.date];

    //102 option
    UILabel * lblTitle = (UILabel *)[cell viewWithTag:102];
    lblTitle.text = [NSString stringWithFormat:@"%@",msg.title];

    return cell;
    
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //
    
    [self.tblMessages deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"myMessages_Message_segue" sender:self];
  
    
}
@end
