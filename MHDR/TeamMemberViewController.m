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
    
    nameField.text = self.member.FullName;
    cellPhoneField.text = self.member.CellPhone;
    pagerField.text = self.member.Pager;
    officePhoneField.text = self.member.OfficePhone;
    homePhoneField.text = self.member.HomePhone;
    
    officePhoneBtn.titleLabel.text = self.member.OfficePhone;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)callPhone:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://2135554321"]];
    /*
    NSString *cleanedString = [[phoneNumber componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789-+()"] invertedSet]] componentsJoinedByString:@""];
    NSURL *telURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", cleanedString]];
    s*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
