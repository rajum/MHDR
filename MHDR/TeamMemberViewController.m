//
//  TeamMemberViewController.m
//  MHDR
//
//  Created by Raju Maharjan on 7/17/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import "TeamMemberViewController.h"

@interface TeamMemberViewController ()

@end

@implementation TeamMemberViewController

@synthesize member;

// Replacing the synthesized setter method for teamMember to set the title using navigationItem
/*
- (void)setMember:(TeamMember *)teamMember
{
    self.member = teamMember;
    self.navigationItem.title = @"just testing...";
}
*/

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    nameField.text = self.member.Customer_ID;
    companyField.text = self.member.Company_Name;
    cityField.text = self.member.City;
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

@end
