//
//  APMListViewController.h
//  MHDR
//
//  Created by Raju Maharjan on 7/26/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APMApplication.h"
#import "APMApplicationViewController.h"

@interface APMListViewController : UITableViewController

@property (nonatomic,strong) NSMutableData *jsonData;
@property (nonatomic,strong) NSMutableArray *applicationList;
@property (nonatomic,copy) void (^dismissBlock)(void);

@end
