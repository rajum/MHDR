//
//  OnCallDetailViewController.m
//  MHDR
//
//  Created by Raju Maharjan on 7/30/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import "OnCallDetailViewController.h"

@interface OnCallDetailViewController ()

@end

@implementation OnCallDetailViewController

@synthesize member;

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
    solSegmentLabelField.text = self.member.SolSegment;
    onCallPersonLabelField.text = self.member.OnCallPerson;
    detailsLabelField.text = self.member.Details;
    
    //to do: do this check at the domain class level
    //if(![self.member.Pager isKindOfClass:[NSNull class]])
    pagerLabelField.text = self.member.Pager;
    
    //cellPhoneLabelField.text = self.member.CellPhone;
    phoneLabelField.text = self.member.Phone;
    startDateLabelField.text = self.member.StartDate;
    //sTimeLabelField.text = self.member.STime;
    endDateLabelField.text = self.member.EndDate;
    //eTimeLabelField.text = self.member.ETime;
    
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
