//
//  TeamListViewController.h
//  MHDR
//
//  Created by Raju Maharjan on 7/12/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "AFHTTPClient.h"
//#import "AFHTTPRequestOperation.h"
#import "TeamMember.h"
#import "TeamMemberViewController.h"
#import "TeamMemberDetailViewController.h"
#import "NSStringAdditions.h"

//#import "TeamMemberDetailStoryboard.storyboard"

@interface TeamListViewController : UITableViewController

@property (nonatomic,strong) NSURLConnection *connection;
@property (nonatomic,strong) NSMutableData *jsonData;
@property (nonatomic,strong) NSMutableArray *teamMemberList;
@property (nonatomic,copy) void (^dismissBlock)(void);

@property (nonatomic,strong) UIActivityIndicatorView *indicator;

-(void)fetchFeed;

@end
