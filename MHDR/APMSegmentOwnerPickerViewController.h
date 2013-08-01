//
//  APMSegmentOwnerPickerViewController.h
//  MHDR
//
//  Created by Raju Maharjan on 7/31/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APMListViewController.h"

@interface APMSegmentOwnerPickerViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *segmentOwnerPickerView;

@property (strong, nonatomic) IBOutlet UILabel *segmentOwnerLabelField;

@property (strong, nonatomic) NSArray *segmentOwnerList;

- (IBAction)search:(id)sender;


@end
