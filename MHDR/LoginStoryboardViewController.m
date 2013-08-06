//
//  LoginStoryboardViewController.m
//  MHDR
//
//  Created by Raju Maharjan on 8/3/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import "LoginStoryboardViewController.h"

@interface LoginStoryboardViewController ()

@end

@implementation LoginStoryboardViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_BKGND"]];
    
    self.tableView.backgroundView = imageView;
    float yOffset = 50.0f; // Change this how much you want!
    self.tableView.frame =  CGRectMake(self.tableView.frame.origin.x, self.tableView.frame.origin.y + yOffset, self.tableView.frame.size.width, self.tableView.frame.size.height);
    [self.tableView setContentInset:UIEdgeInsetsMake(140,0,0,0)];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.separatorColor = [UIColor clearColor];
    [self.view endEditing:true];
//    [self.usernameTextField resignFirstResponder];
//    [self.pwdTextField resignFirstResponder];
//    self.imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_BKGND"]];
//    self.imgView.frame = self.view.bounds;
//    self.imgView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    self.imgView.contentMode = UIViewContentModeScaleAspectFill;
//    
//    [self.view insertSubview:self.imgView belowSubview:self.tableView];
//    // [self.tableView.superview sendSubviewToBack:self.imgView];
//    
//    
//    [self.view sendSubviewToBack:self.imgView];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
//[self.tableView sendSubviewToBack:self.imgView];
    //[self.view sendSubviewToBack:self.imgView];
//       self.tableView.opaque = NO;
//    self.tableView.backgroundColor = [UIColor clearColor];
//    self.tableView.backgroundColor = [UIColor colorWithWhite:1 alpha:.55];
//    //NSIndexPath *indexPath = [[NSIndexPath alloc] initWithIndex:1];
//    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]];
//    cell.opaque = NO;
//    cell.textLabel.backgroundColor = [UIColor clearColor];
//    cell.detailTextLabel.backgroundColor = [UIColor clearColor];
//    cell.backgroundColor = [UIColor colorWithWhite:1 alpha:.55];
}


-(IBAction)authenticate:(id)sender
{
    MainViewController *mainlvc = [[MainViewController alloc] initWithStyle:UITableViewStyleGrouped];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mainlvc];
    
    [self presentViewController:navController animated:YES completion:nil];
    
    
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"LoginStoryboardDetailViewCell";
    
    UITableViewCell *detailCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!detailCell)
    {
        detailCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    [self.tableView sendSubviewToBack:self.imgView];
    
    detailCell.opaque = NO;
    
    detailCell.textLabel.backgroundColor = [UIColor clearColor];
    detailCell.detailTextLabel.backgroundColor = [UIColor clearColor];
    detailCell.backgroundColor = [UIColor colorWithWhite:1 alpha:.55];
    
    
    return detailCell;
}
*/


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    // create the parent view that will hold header Label
    UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, 300.0, 44.0)];
    
    // create the button object
    UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.opaque = NO;
    headerLabel.textColor = [UIColor whiteColor];
    headerLabel.highlightedTextColor = [UIColor whiteColor];
    //headerLabel.font = [UIFont boldSystemFontOfSize:20];
    headerLabel.frame = CGRectMake(10.0, 0.0, 300.0, 44.0);
    
    // If you want to align the header text as centered
    // headerLabel.frame = CGRectMake(150.0, 0.0, 300.0, 44.0);
    
    headerLabel.text = @"MHDR Login"; // i.e. array element
    [customView addSubview:headerLabel];
    
    return customView;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    /*
    [self.usernameTextField resignFirstResponder];
    [self.pwdTextField resignFirstResponder];
    */
     return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.usernameTextField resignFirstResponder];
    [self.pwdTextField resignFirstResponder];
    return NO;
}

@end
