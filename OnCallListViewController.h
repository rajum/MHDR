//
//  OnCallListViewController.h
//  MHDR
//
//  Created by Raju Maharjan on 7/18/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OnCallDetailViewController.h"
#import "OnCall.h"
#import "OnCallStoryboardDetailViewController.h"

@interface OnCallListViewController : UITableViewController

@property (nonatomic,strong) NSMutableArray *teamMemberList;
@property (nonatomic,copy) void (^dismissBlock)(void);

@end
