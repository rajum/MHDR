//
//  LoginViewController.m
//  MHDR
//
//  Created by Raju Maharjan on 7/16/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
                self.navigationItem.title = @"Login";
            }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)authenticate:(id)sender
{
    //TeamListViewController *teamlvc = [[TeamListViewController alloc] initWithStyle:UITableViewStylePlain];
    MainViewController *mainlvc = [[MainViewController alloc] initWithStyle:UITableViewStyleGrouped];
    
    //UINavigationController *navController = [[UINavigationController alloc]  initWithRootViewController:teamlvc];
    
    
    
    //[self presentViewController:self.navigationController animated:YES completion:nil];
    [self.navigationController pushViewController:mainlvc animated:YES];
}

@end
