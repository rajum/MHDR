//
//  ASM_TSMListViewController.h
//  MHDR
//
//  Created by Raju Maharjan on 7/26/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASM_TSMViewController.h"
#import "ASM_TSM.h"
#import "ASM_TSMStoryboardDetailViewController.h"

@interface ASM_TSMListViewController : UITableViewController

@property (nonatomic,strong) NSMutableArray *asmTsmList;
@property (nonatomic,copy) void (^dismissBlock)(void);

@end
