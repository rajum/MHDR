//
//  OnCallDatePickerViewController.m
//  MHDR
//
//  Created by Raju Maharjan on 7/26/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import "OnCallDatePickerViewController.h"

@interface OnCallDatePickerViewController ()

@end

@implementation OnCallDatePickerViewController

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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterMediumStyle;
    self.selectedDateField.text = [NSString stringWithFormat:@"%@", [df stringFromDate:[NSDate date]]];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    
    self.datePicker.date = [NSDate date];
    [self.datePicker addTarget:self action:@selector(changeDateInLabel:) forControlEvents:UIControlEventValueChanged];

}

- (void)changeDateInLabel:(id)sender
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterMediumStyle;
    self.selectedDateField.text = [NSString stringWithFormat:@"%@", [df stringFromDate:self.datePicker.date]];
    
    //self.datePicker.date = [NSDate date];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
