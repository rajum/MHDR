//
//  OnCallStoryboardDetailViewController.h
//  MHDR
//
//  Created by Raju Maharjan on 8/5/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OnCall.h"

@interface OnCallStoryboardDetailViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UILabel *solSegmentLabelField;
@property (strong, nonatomic) IBOutlet UILabel *onCallPersonLabelField;
@property (strong, nonatomic) IBOutlet UILabel *detailsLabelField;
@property (strong, nonatomic) IBOutlet UILabel *pagerLabelField;
@property (strong, nonatomic) IBOutlet UILabel *phoneLabelField;
@property (strong, nonatomic) IBOutlet UILabel *startDateLabelField;
@property (strong, nonatomic) IBOutlet UILabel *endDateLabelField;

@property (nonatomic, strong) OnCall *onCall;

@end
