//
//  OnCallSolSegmentPickerViewController.m
//  MHDR
//
//  Created by Raju Maharjan on 7/30/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import "OnCallSolSegmentPickerViewController.h"


@interface OnCallSolSegmentPickerViewController ()

@end

@implementation OnCallSolSegmentPickerViewController
@synthesize solSegmentPickerView;
@synthesize solSegmentLabelField;


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
    solSegmentPickerView.showsSelectionIndicator = TRUE;
    
    self.solSegmentList=[[NSArray alloc] initWithObjects:@"Accounting",@"Decision Support",@"Internal Development",@"Medical Records",@"Patient Management",@"PIE", nil];
    
    [super viewDidLoad];
    
       
    
      
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = @"On Call - Select Segment";
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationItem.title = @"Back";
    
}

#pragma mark - UIPickerView Delegate
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.solSegmentList.count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.solSegmentList objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.solSegmentLabelField.text = [self.solSegmentList objectAtIndex:row];
}

- (IBAction)search:(id)sender
{
    OnCallListViewController *onCallLvc = [[OnCallListViewController alloc] initWithStyle:UITableViewStylePlain];
    
    [self.navigationController pushViewController:onCallLvc animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
