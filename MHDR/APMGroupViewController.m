//
//  APMGroupViewController.m
//  MHDR
//
//  Created by Raju Maharjan on 7/25/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import "APMGroupViewController.h"

@interface APMGroupViewController ()

@end

@implementation APMGroupViewController
@synthesize thePickerView;
@synthesize selectedCountry;
@synthesize selectedCity;
@synthesize oneColumnList;
@synthesize secondColumnList;

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
        //delegate and daasource is already set in xib file
    //thePickerView.delegate = self;
    //thePickerView.dataSource = self;
    // Do any additional setup after loading the view from its nib.
    
    thePickerView.showsSelectionIndicator = TRUE;
    
    //One column array example
    self.oneColumnList=[[NSArray alloc] initWithObjects:@"Accounting",@"Decision Support",@"Internal Development",@"Medical Records",@"Patient Management",@"PIE", nil];
    
    //Two column array example
    self.secondColumnList=[[NSArray alloc] initWithObjects:@"Brian Beardmore", @"Chao-lin Liang",@"Hector Villarreal",@"Wilmer Champ", nil];
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = @"APM - Solution Segment";
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationItem.title = @"Back";
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component == 0)
    {
        return oneColumnList.count;
    }
    return secondColumnList.count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //return 2;
    return 1;
}

#pragma mark - UIPickerView Delegate
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 30.0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //For one component (column)
    //return [oneColumnList objectAtIndex:row];
    
    if (component == 0)
    {
        return [oneColumnList objectAtIndex:row];
    }
return [secondColumnList objectAtIndex:row];

}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0)
    {
        self.selectedCity.text = [oneColumnList objectAtIndex:row];
        return;
    }
    self.selectedCountry.text = [secondColumnList objectAtIndex:row];
}

- (IBAction)next:(id)sender
{
    APMSegmentOwnerPickerViewController *apmSegmentOwnerPickerVc = [[APMSegmentOwnerPickerViewController alloc] init];
    
    [self.navigationController pushViewController:apmSegmentOwnerPickerVc animated:YES];

}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
