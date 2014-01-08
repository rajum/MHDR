//
//  MainViewController.h
//  MHDR
//
//  Created by Raju Maharjan on 7/18/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeamListViewController.h"
#import "OnCallDatePickerViewController.h"
#import "OnCallGroupViewController.h"
#import "OnCallListViewController.h"
#import "OnCallDetailViewController.h"
#import "APMGroupViewController.h" 
#import "APMPickerViewController.h" //to be commented
#import "ASM_TSMListViewController.h"
#import "ContactListViewController.h"
#import "LoginViewController.h"
#import "LoginStoryboardViewController.h"
#import "DocumentLoaderViewController.h"


#import "APMSolutionSegmentListViewController.h"

@interface MainViewController : UITableViewController

@property (nonatomic,strong) UIImageView *imgView;
@property (nonatomic,strong) NSArray *isdDRList;
@property (nonatomic,copy) void (^dismissBlock)(void);
- (IBAction)close:(id)sender;

@end
