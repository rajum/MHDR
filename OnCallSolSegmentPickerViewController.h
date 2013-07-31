//
//  OnCallSolSegmentPickerViewController.h
//  MHDR
//
//  Created by Raju Maharjan on 7/30/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OnCallGroupViewController.h"
#import "OnCallListViewController.h"

@interface OnCallSolSegmentPickerViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *solSegmentPickerView;

@property (strong, nonatomic) IBOutlet UILabel *solSegmentLabelField;

@property (strong, nonatomic) NSArray *solSegmentList;

- (IBAction)search:(id)sender;

@end
