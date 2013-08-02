//
//  APMPickerViewController.h
//  MHDR
//
//  Created by Raju Maharjan on 8/2/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APMListViewController.h"

@interface APMPickerViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIPickerView *segmentOwnerPickerView;

@property (strong, nonatomic) IBOutlet UIPickerView *solutionSegmentPickerView;

@property (strong, nonatomic) NSArray *segmentOwnerList;

@property (strong, nonatomic) NSArray *solutionSegmentList;

- (IBAction)search:(id)sender;

@end
