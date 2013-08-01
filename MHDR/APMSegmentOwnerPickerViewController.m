//
//  APMSegmentOwnerPickerViewController.m
//  MHDR
//
//  Created by Raju Maharjan on 7/31/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import "APMSegmentOwnerPickerViewController.h"

@interface APMSegmentOwnerPickerViewController ()

@end

@implementation APMSegmentOwnerPickerViewController
@synthesize segmentOwnerPickerView;
@synthesize segmentOwnerLabelField;


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
    segmentOwnerPickerView.showsSelectionIndicator = TRUE;
    
    self.segmentOwnerList=[[NSArray alloc] initWithObjects:@"Brian Beardmore", @"Chao-lin Liang",@"Hector Villarreal",@"Wilmer Champ", nil];

    
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = @"APM - Segment Owner";
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationItem.title = @"Back";
    
}

#pragma mark - UIPickerView Delegate
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.segmentOwnerList.count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.segmentOwnerList objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.segmentOwnerLabelField.text = [self.segmentOwnerList objectAtIndex:row];
}

- (IBAction)search:(id)sender
{
    APMListViewController *apmLvc = [[APMListViewController alloc] initWithStyle:UITableViewStylePlain];
    
    [self.navigationController pushViewController:apmLvc animated:YES];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
