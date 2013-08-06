//
//  OnCallGroupViewController.m
//  MHDR
//
//  Created by Raju Maharjan on 7/18/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import "OnCallGroupViewController.h"

@interface OnCallGroupViewController ()

@end

@implementation OnCallGroupViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        UITabBarItem *groupTabBarItem = self.tabBarItem;
        groupTabBarItem.title=@"Department";
        UIImage *tabImage = [UIImage imageNamed:@"Hypno.png"];
        groupTabBarItem.image = tabImage;
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.

    self.tabBarController.navigationItem.title = @"Department";
    
    self.deptList = [NSArray arrayWithObjects:
                     @"Accounting",
                     @"Care Management",
                     @"Cerner",
                     @"Data Center",
                     @"Internal Development",
                     @"MHealth",
                     @"Network Admininstration",
                     @"Network Engineering",
                     @"Supply Chain",
                     @"Women Services", nil];
    
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.deptList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"DeptCell";
    
    UITableViewCell *deptCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!deptCell)
    {
        deptCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    NSString *deptInfo = [self.deptList objectAtIndex:indexPath.row];
    
    deptCell.textLabel.text = deptInfo;
    
    return deptCell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     //OnCallListViewController *detailViewController = [[OnCallListViewController alloc] init];
     //[[self.navigationController pushViewController:detailViewController animated:YES];
    //[self.tabBarController.]
}

@end
