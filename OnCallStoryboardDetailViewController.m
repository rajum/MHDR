//
//  OnCallStoryboardDetailViewController.m
//  MHDR
//
//  Created by Raju Maharjan on 8/5/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import "OnCallStoryboardDetailViewController.h"

@interface OnCallStoryboardDetailViewController ()

@end

@implementation OnCallStoryboardDetailViewController

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.solSegmentLabelField.text = self.onCall.SolSegment;
    self.onCallPersonLabelField.text = self.onCall.OnCallPerson;
    self.detailsLabelField.text = self.onCall.Details;
    self.pagerLabelField.text = self.onCall.Pager;
    self.phoneLabelField.text = self.onCall.Phone;
    self.startDateLabelField.text = self.onCall.StartDate;
    self.endDateLabelField.text = self.onCall.EndDate;
    
    self.navigationItem.title = @"Info";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
