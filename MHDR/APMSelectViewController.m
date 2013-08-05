//
//  APMSelectViewController.m
//  MHDR
//
//  Created by Raju Maharjan on 8/5/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import "APMSelectViewController.h"

@interface APMSelectViewController ()

@end

@implementation APMSelectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    //One column array example
    self.solSegmentList=[[NSArray alloc] initWithObjects:@"Accounting",@"Decision Support",@"Internal Development",@"Medical Records",@"Patient Management",@"PIE", nil];
    
    //Two column array example
    self.segOwnerList=[[NSArray alloc] initWithObjects:@"Brian Beardmore", @"Chao-lin Liang",@"Hector Villarreal",@"Wilmer Champ", nil];

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
