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
    self.oneColumnList=[[NSArray alloc] initWithObjects:@"New York",@"Montreal",@"Miami",@"Boston",@"Philadelphia",@"Toronto",@"Calcary",@"Vancouver",@"Los Angeles",@"Cupertino",@"Austin",@"New Orleans", nil];
    
    //Two column array example
    self.secondColumnList=[[NSArray alloc] initWithObjects:@"Canada", @"United States",@"Mexico",@"England",@"France",@"Greece", @"Slovakia",@"Switzerland", nil];
    [super viewDidLoad];
    
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
    return 2;
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
