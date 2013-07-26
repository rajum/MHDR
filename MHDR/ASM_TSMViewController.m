//
//  ASM_TSMViewController.m
//  MHDR
//
//  Created by Raju Maharjan on 7/26/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import "ASM_TSMViewController.h"

@interface ASM_TSMViewController ()

@end

@implementation ASM_TSMViewController

@synthesize asmTsm;

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
    
    
    solSegmentField.text = self.asmTsm.SolSegment;
    onCallPersonField.text = self.asmTsm.OnCallPerson;
    typeField.text = self.asmTsm.Type;
    detailsField.text = self.asmTsm.Details;
    pagerField.text = self.asmTsm.Pager;
    cellPhoneField.text = self.asmTsm.CellPhone;
    phoneField.text = self.asmTsm.Phone;
  
    
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
