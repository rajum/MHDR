//
//  APMSelectViewController.h
//  MHDR
//
//  Created by Raju Maharjan on 8/5/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APMSelectViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *solSegmentTableView;
@property (strong, nonatomic) IBOutlet UITableView *segOwnerTableView;
@property (nonatomic,strong) NSArray *solSegmentList;
@property (nonatomic,strong) NSArray *segOwnerList;
@property (nonatomic,copy) void (^dismissBlock)(void);
//- (IBAction)search:(id)sender;
@end
