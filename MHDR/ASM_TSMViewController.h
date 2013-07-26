//
//  ASM_TSMViewController.h
//  MHDR
//
//  Created by Raju Maharjan on 7/26/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASM_TSM.h"

@interface ASM_TSMViewController : UIViewController
{
 __weak IBOutlet UILabel *solSegmentField;

__weak IBOutlet UILabel *onCallPersonField;

__weak IBOutlet UILabel *typeField;

__weak IBOutlet UILabel *detailsField;

__weak IBOutlet UILabel *pagerField;

__weak IBOutlet UILabel *cellPhoneField;

__weak IBOutlet UILabel *phoneField;
}

@property (nonatomic,strong) ASM_TSM *asmTsm;

@end
