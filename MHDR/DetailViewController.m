//
//  DetailViewController.m
//  MHDR
//
//  Created by Raju Maharjan on 8/1/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        //self.navigationItem.title = @"Info"; doesn't work here 
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
    
    //self.navigationItem.leftBarButtonItem.title = @"BackIt";
    
    self.fullNameLabelField.text = self.member.FullName;
    self.cellPhoneLabelField.text = self.member.CellPhone;
    self.pagerLabelField.text = self.member.Pager;
    self.officePhoneLabelField.text = self.member.OfficePhone;
    self.homePhoneLabelField.text = self.member.HomePhone;
    
    self.navigationItem.title = @"Info";
    
    UITapGestureRecognizer *phoneGR = [[UITapGestureRecognizer alloc]
                                       initWithTarget:self
                                       action:@selector(phoneTapped)];
    //self.cellPhoneLabelField.userInteractionEnabled = YES;
    //[self.cellPhoneLabelField addGestureRecognizer:phoneGR];
    
    self.officePhoneLabelField.userInteractionEnabled = YES;
    [self.officePhoneLabelField addGestureRecognizer:phoneGR];
    
    //self.homePhoneLabelField.userInteractionEnabled = YES;
    //[self.homePhoneLabelField addGestureRecognizer:phoneGR];



}

- (void)phoneTapped
{
    UIDevice *device = [UIDevice currentDevice];
    if ([[device model] isEqualToString:@"iPhone"] ) {
        NSString *officePhone = [@"telprompt://" stringByAppendingString:self.officePhoneLabelField.text];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:officePhone]];
    } else {
        UIAlertView *notPermitted=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Your device doesn't support this feature." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [notPermitted show];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
