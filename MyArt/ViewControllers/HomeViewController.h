//
//  HomeViewController.h
//  MyArt
//
//  Created by Esteban Mac on 02/01/15.
//  Copyright (c) 2015 OM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lblNameUser;
@property (weak, nonatomic) IBOutlet UILabel *lblOrdersCount;
@property (weak, nonatomic) IBOutlet UITableView *tblUserOptions;
@property (weak, nonatomic) IBOutlet UITableView *tblAppOptions;


@end
