//
//  APMPickerViewController.m
//  MHDR
//
//  Created by Raju Maharjan on 8/2/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import "APMPickerViewController.h"

@interface APMPickerViewController ()

@end

@implementation APMPickerViewController
@synthesize segmentOwnerPickerView;
@synthesize solutionSegmentPickerView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        solutionSegmentPickerView.frame = CGRectMake(0.0, 0.0, 320.0, 120.0);
        
    }
    return self;
}

- (void)viewDidLoad
{
    solutionSegmentPickerView.showsSelectionIndicator = TRUE;
    segmentOwnerPickerView.showsSelectionIndicator = TRUE;
    
    
    self.solutionSegmentList=[[NSArray alloc] initWithObjects:@"Accounting",@"Decision Support",@"Internal Development",@"Medical Records",@"Patient Management",@"PIE", nil];
    self.segmentOwnerList=[[NSArray alloc] initWithObjects:@"Brian Beardmore", @"Chao-lin Liang",@"Hector Villarreal",@"Wilmer Champ", nil];

    
    [super viewDidLoad];
    solutionSegmentPickerView.frame = CGRectMake(0.0, 0.0, 320.0, 120.0);
    
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = @"APM - Segment & Owner";
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationItem.title = @"Back";
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return (pickerView == solutionSegmentPickerView ? self.solutionSegmentList.count : self.segmentOwnerList.count );
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
      return 1; //or return ( pickerView == picker1 ? 2 : 3 );
}

#pragma mark - UIPickerView Delegate


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSArray *values = ( pickerView == solutionSegmentPickerView ? self.solutionSegmentList : self.segmentOwnerList );
    return [values objectAtIndex: row];
    
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
