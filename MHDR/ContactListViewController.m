//
//  ContactListViewController.m
//  MHDR
//
//  Created by Raju Maharjan on 7/29/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import "ContactListViewController.h"

@interface ContactListViewController ()

@end

@implementation ContactListViewController

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
    
    self.contactList = [NSArray arrayWithObjects:
                      @"Interface Engine Contacts",
                      @"Medical Plaza North",
                      @"Vendor Contact Info",
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
    return self.contactList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"DetailViewCell";
    
    UITableViewCell *detailCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!detailCell)
    {
        detailCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    NSString *contactInfo = [self.contactList objectAtIndex:indexPath.row];
    
    detailCell.textLabel.text = contactInfo;
    
    return detailCell;

}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
     
        case 0: // Interface Engine Contacts
        {
            [self loadDocument:@"OPS_Guide_Update.doc"];
            
            break;

        }
            
        case 1: // Medical Plaza North
        {
            [self loadDocument:@"MedicalPlazaNorth.xls"];
            
            break;
        }
            
            
        case 2: // Vendor Contact Info
        {

            [self loadDocument:@"VendorContact.xls"];
            
            break;
        }
            
            
            
        default:
        break;
    }
}

/* To do: make this utility method so that it can be shared among multiple viewcontrollers/pages */
- (void)loadDocument:(NSString*)documentName 
{
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    webView.tag = 56;
    webView.scalesPageToFit = YES;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:documentName  ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:webView];
    
    /* Close Button for webView */
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Close" forState:UIControlStateNormal];
    button.frame = CGRectMake(80, 210, 160, 40);
    [button addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
    [webView addSubview:button];
}

- (IBAction)close:(id)sender {
    
    [[self.view viewWithTag:56] removeFromSuperview];
    
}

@end
