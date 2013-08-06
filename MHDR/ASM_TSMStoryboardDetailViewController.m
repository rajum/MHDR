//
//  ASM_TSMStoryboardDetailViewController.m
//  MHDR
//
//  Created by Raju Maharjan on 8/6/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import "ASM_TSMStoryboardDetailViewController.h"

@interface ASM_TSMStoryboardDetailViewController ()

@end

@implementation ASM_TSMStoryboardDetailViewController

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
    
    
    self.solSegmentLabelField.text = self.asmTSM.SolSegment;
    self.onCallLabelField.text = self.asmTSM.OnCallPerson;
    self.typeLabelField.text = self.asmTSM.Type;
    self.detailsLabelField.text = self.asmTSM.Details;
    self.pagerLabelField.text = self.asmTSM.Pager;
    self.cellPhoneLabelField.text = self.asmTSM.CellPhone;
    self.phoneLabelField.text = self.asmTSM.Phone;
    
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
