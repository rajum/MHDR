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
        self.navigationItem.title = @"MHDR";
        
        
         
        self.isdDRList = [NSMutableArray arrayWithCapacity:1];
        
        self.imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"main_BKGND"]];
        self.imgView.frame = self.view.bounds;
        self.imgView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.imgView.contentMode = UIViewContentModeScaleAspectFill;
        [self.tableView addSubview:self.imgView];
        [self.view addSubview:self.imgView];
        //[self.view sendSubviewToBack:self.imgView];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    UIBarButtonItem *logOutButton = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(logOut)];
    self.navigationItem.rightBarButtonItem = logOutButton;
    self.isdDRList = [NSArray arrayWithObjects:
                      @"Application Portfolio Manager",
                      @"ASM / TSM Directory",
                      @"Contact Lists",
                      @"Change Management",
                      @"Disaster Recovery Plan",
                      @"ISD On-Call Schedule",
                      @"ISD Team Members Contact",
                      nil];
    

    //[self.tableView sendSubviewToBack:self.imgView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    //[self.tableView sendSubviewToBack:self.imgView];
    //[self.view addSubview:self.imgView];
    //[self.tableView sendSubviewToBack:self.imgView];
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:32.0/255.0 green:34.0/255.0 blue:91.0/255.0 alpha:0.9]];
    //self.tableView.opaque = NO;

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)logOut
{
    
//    LoginViewController *loginVC = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
//    [self presentViewController:loginVC animated:YES completion:nil];
    UIStoryboard *loginStoryboard = [UIStoryboard storyboardWithName:@"LoginStoryboard" bundle:nil];
    LoginStoryboardViewController *loginStoryboardVC = [loginStoryboard instantiateInitialViewController];
    //self.window.rootViewController = loginStoryboardVC;
    [self presentViewController:loginStoryboardVC animated:YES completion:nil];
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
    detailCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    NSString *isdDRInfo = [self.isdDRList objectAtIndex:indexPath.row];
    
    detailCell.textLabel.text = isdDRInfo;
    //
    
    detailCell.opaque = NO;
    
    detailCell.textLabel.backgroundColor = [UIColor clearColor];
    detailCell.detailTextLabel.backgroundColor = [UIColor clearColor];
    detailCell.backgroundColor = [UIColor colorWithWhite:1 alpha:.55];
    
    

        
    return detailCell;
}

-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([indexPath row] == ((NSIndexPath*)[[tableView indexPathsForVisibleRows] lastObject]).row){
        //end of loading
        //for example [activityIndicator stopAnimating];
        [self.tableView sendSubviewToBack:self.imgView];
    }
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
            
            //APMPickerViewController *apmPvc = [[APMPickerViewController alloc] init];
            //[self.navigationController pushViewController:apmPvc animated:YES];

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
    [button setTitle:@"Back" forState:UIControlStateNormal];
    //button.frame = CGRectMake(80, 210, 160, 40);
    
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(5, 5, 100, 30);

    
    [button addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
    [webView addSubview:button];
}

- (IBAction)close:(id)sender {
    
    [[self.view viewWithTag:55] removeFromSuperview];
    
}



@end
