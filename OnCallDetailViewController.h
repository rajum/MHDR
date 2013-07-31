//
//  OnCallDetailViewController.h
//  MHDR
//
//  Created by Raju Maharjan on 7/30/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OnCall.h"

@interface OnCallDetailViewController : UIViewController
{

__weak IBOutlet UILabel *solSegmentLabelField;

__weak IBOutlet UILabel *onCallPersonLabelField;

__weak IBOutlet UILabel *detailsLabelField;

__weak IBOutlet UILabel *pagerLabelField;

__weak IBOutlet UILabel *cellPhoneLabelField;

__weak IBOutlet UILabel *phoneLabelField;

__weak IBOutlet UILabel *startDateLabelField;

__weak IBOutlet UILabel *sTimeLabelField;

__weak IBOutlet UILabel *endDateLabelField;

__weak IBOutlet UILabel *eTimeLabelField;

}

@property (nonatomic,strong) OnCall *member;

@end
