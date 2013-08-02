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
                //self.navigationItem.title = @"Login";
                //UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Login_BKGND2"]];
                //[self.view addSubview:backgroundView];
        self.imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_BKGND"]];
        self.imgView.frame = self.view.bounds;
        self.imgView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.imgView.contentMode = UIViewContentModeScaleAspectFill;
        [self.view addSubview:self.imgView];
        
                
        //[imgView release];
            }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self.view addSubview:self.imgView];
    //self.imgView.opaque = NO;
    //[self.view addSubview:self.imgView];
    //[self.view sendSubviewToBack:imgView];
    //[self.usernameTextField setBackgroundColor:[UIColor clearColor]];
    //[self.usernameTextField setBackgroundColor:[UIColor clearColor]];
   [self.view sendSubviewToBack:self.imgView];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    //[self.view addSubview:self.imgView];
    //self.imgView.opaque = NO;
    [self.view sendSubviewToBack:self.imgView];

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
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mainlvc];
    
    
    
    //[self presentViewController:self.navigationController animated:YES completion:nil];
    //[self.navigationController pushViewController:mainlvc animated:YES];
    [self presentViewController:navController animated:YES completion:nil];
    
    
}

@end
