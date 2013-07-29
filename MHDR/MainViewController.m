//
//  MainViewController.m
//  MHDR
//
//  Created by Raju Maharjan on 7/18/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"ISD Disaster Recovery";
        self.isdDRList = [NSMutableArray arrayWithCapacity:1];
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
    self.isdDRList = [NSArray arrayWithObjects:
                      @"Application Portfolio Manager",
                      @"ASM / TSM Directory",
                      @"Contact Lists",
                      @"Change Management",
                      @"Disaster Recovery Plan",
                      @"ISD On-Call Schedule",
                      @"ISD Team Members Contact Info",
                      //@"Situation Management",
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return self.teamMemberList.count; THIS IS WHERE THE ERROR IS AND ALSO CHECK setCity or City will be used
    return self.isdDRList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"DetailViewCell";
    
    UITableViewCell *detailCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!detailCell)
    {
        detailCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    NSString *isdDRInfo = [self.isdDRList objectAtIndex:indexPath.row];
    
    detailCell.textLabel.text = isdDRInfo;
        
    return detailCell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    //NSString *isdDRInfo = [self.isdDRList objectAtIndex:indexPath.row];
    switch (indexPath.row) {
        case 0: // Application Portfolio Manager
        {
            APMGroupViewController *apmGvc = [[APMGroupViewController alloc] init];
            [self.navigationController pushViewController:apmGvc animated:YES];

            break;
        }
        case 1: // ASM/TSM
        {
            ASM_TSMListViewController *asmTsmLvc = [[ASM_TSMListViewController alloc]init];
            [self.navigationController pushViewController:asmTsmLvc animated:YES];
            
            break;
        }
            
        case 2: // Contact Lists
        {
            ContactListViewController *contactLvc = [[ContactListViewController alloc]init];
            [self.navigationController pushViewController:contactLvc animated:YES];

            
            break;
        }

        case 3: // Change Management
        {
            [self loadDocument:@"ScheduleEventsSummary.pdf"];
            
            break;
        }
            
        case 4: // Disaster Recovery Plan
        {
            [self loadDocument:@"DisasterRecovery.pdf"];
            
            break;
        }

        case 5: // ISD On Call
        {
            OnCallDatePickerViewController *onCallDpc = [[OnCallDatePickerViewController alloc]init];
            [self.navigationController pushViewController:onCallDpc animated:YES];
            
            break;
        }
            
        
        case 6: // ISD Team Member
        {
            TeamListViewController *teamlvc = [[TeamListViewController alloc] init];
            [self.navigationController pushViewController:teamlvc animated:YES];
            
            break;
        }

        
            
        default:
            break;
    }
    
    /*
    if ([isdDRInfo isEqualToString:@"ISD Team Members Contact Info"])
    {
        TeamListViewController *teamlvc = [[TeamListViewController alloc] init];
        [self.navigationController pushViewController:teamlvc animated:YES];
    }
   
    else if ([isdDRInfo isEqualToString:@"Application Portfolio Manager"])
    {
        OnCallGroupViewController *oncallGroupVC = [[OnCallGroupViewController alloc] init];
        OnCallListViewController *oncallListVC = [[OnCallListViewController alloc] init];
        
        UITabBarController *tabBarController = [[UITabBarController alloc] init];
        
        NSArray *viewControllers = [NSArray arrayWithObjects:oncallGroupVC, oncallListVC, nil];
        [tabBarController setViewControllers:viewControllers];
        
        [self.navigationController pushViewController:tabBarController animated:YES];

    }
    
    else if ([isdDRInfo isEqualToString:@"Application Portfolio Manager"])
    {
        APMGroupViewController *apmGvc = [[APMGroupViewController alloc] init];
        [self.navigationController pushViewController:apmGvc animated:YES];
    }
     */
}

/* To do: make this utility method so that it can be shared among multiple viewcontrollers/pages */
- (void)loadDocument:(NSString*)documentName
{
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    webView.tag = 55;
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
    
    [[self.view viewWithTag:55] removeFromSuperview];
    
}



@end
