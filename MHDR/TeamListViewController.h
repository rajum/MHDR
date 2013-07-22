//
//  TeamListViewController.h
//  MHDR
//
//  Created by Raju Maharjan on 7/12/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TeamMember.h"
#import "TeamMemberViewController.h"

@interface TeamListViewController : UITableViewController

@property (nonatomic,strong) NSURLConnection *connection;
@property (nonatomic,strong) NSMutableData *jsonData;
@property (nonatomic,strong) NSMutableArray *teamMemberList;
@property (nonatomic,copy) void (^dismissBlock)(void);

-(void)fetchFeed;

@end
