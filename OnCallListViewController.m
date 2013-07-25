//
//  OnCallListViewController.m
//  MHDR
//
//  Created by Raju Maharjan on 7/18/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import "OnCallListViewController.h"

@interface OnCallListViewController ()

@end

@implementation OnCallListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization

        UITabBarItem *listTabBarItem = self.tabBarItem;
        listTabBarItem.title=@"Team List";
        UIImage *tabImage = [UIImage imageNamed:@"Time.png"];
        listTabBarItem.image = tabImage;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tabBarController.navigationItem.title = @"Team List";
    
    self.memberList = [NSArray arrayWithObjects:
                     @"Person1",
                     @"Person2",
                     @"Person3",
                     @"Person4",
                     @"Person5",
                     nil];
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
    return self.memberList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"DeptCell";
    
    UITableViewCell *memberListCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!memberListCell)
    {
        memberListCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    NSString *memberInfo = [self.memberList objectAtIndex:indexPath.row];
    
    memberListCell.textLabel.text = memberInfo;
    
    return memberListCell;

}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    OnCallDetailViewController *detailViewController = [[OnCallDetailViewController alloc] init];
     // ...
     // Pass the selected object to the new view controller.
     //[self.tabBarController.selectedViewController pushViewController:detailViewController animated:YES];
    
}

@end
