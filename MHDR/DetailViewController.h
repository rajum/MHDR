//
//  DetailViewController.h
//  MHDR
//
//  Created by Raju Maharjan on 8/1/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeamMember.h"

@interface DetailViewController : UITableViewController
@property (nonatomic, strong) IBOutlet UILabel *fullNameLabelField;
@property (strong, nonatomic) IBOutlet UILabel *cellPhoneLabelField;
@property (strong, nonatomic) IBOutlet UILabel *pagerLabelField;
@property (strong, nonatomic) IBOutlet UILabel *officePhoneLabelField;
@property (strong, nonatomic) IBOutlet UILabel *homePhoneLabelField;

@property (nonatomic, strong) TeamMember *member;

@end
