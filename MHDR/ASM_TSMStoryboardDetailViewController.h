//
//  ASM_TSMStoryboardDetailViewController.h
//  MHDR
//
//  Created by Raju Maharjan on 8/6/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASM_TSM.h"

@interface ASM_TSMStoryboardDetailViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UILabel *solSegmentLabelField;
@property (weak, nonatomic) IBOutlet UILabel *onCallLabelField;
@property (weak, nonatomic) IBOutlet UILabel *typeLabelField;
@property (weak, nonatomic) IBOutlet UILabel *detailsLabelField;
@property (weak, nonatomic) IBOutlet UILabel *pagerLabelField;
@property (weak, nonatomic) IBOutlet UILabel *cellPhoneLabelField;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabelField;

@property (nonatomic, strong) ASM_TSM *asmTSM;

@end
