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
    
    [officePhoneBtn setTitle:self.member.OfficePhone forState:UIControlStateNormal];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UITapGestureRecognizer *officePhoneGR = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(officePhoneTapped)];
    officePhoneField.userInteractionEnabled = YES;
    [officePhoneField addGestureRecognizer:officePhoneGR];
    
}

- (void)officePhoneTapped
{
    UIDevice *device = [UIDevice currentDevice];
    if ([[device model] isEqualToString:@"iPhone"] ) {
        NSString *officePhone = [@"tel://" stringByAppendingString:officePhoneField.text];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:officePhone]];
    } else {
        UIAlertView *notPermitted=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Your device doesn't support this feature." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [notPermitted show];
    }
}

- (IBAction)callPhone:(id)sender
{
    UIDevice *device = [UIDevice currentDevice];
    if ([[device model] isEqualToString:@"iPhone"] )
    {
        NSString *officePhone = [@"telprompt://" stringByAppendingString:officePhoneBtn.titleLabel.text]; // officePhoneBtn.titleLabel.text;
        //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:130-032-2837"]]];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:officePhone]];
    }
    else
    {
        UIAlertView *notPermitted=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Your device doesn't support this feature." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [notPermitted show];
        
    }
    /*
    UIDevice *device = [UIDevice currentDevice];
    if ([[device model] isEqualToString:@"iPhone"] ) {
        NSString *phoneNumber = [@"tel://" stringByAppendingString:agencyPhone.text];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
    } else {
        UIAlertView *Notpermitted=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Your device doesn't support this feature." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [Notpermitted show];
    }
    */
    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://2135554321"]];
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
