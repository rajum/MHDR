//
//  MainViewController.h
//  MHDR
//
//  Created by Raju Maharjan on 7/18/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeamListViewController.h"
#import "OnCallGroupViewController.h"
#import "OnCallListViewController.h"
#import "OnCallDetailViewController.h"
#import "APMGroupViewController.h"

@interface MainViewController : UITableViewController

@property (nonatomic,strong) NSArray *isdDRList;
@property (nonatomic,copy) void (^dismissBlock)(void);

@end
