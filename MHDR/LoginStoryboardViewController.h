//
//  LoginStoryboardViewController.h
//  MHDR
//
//  Created by Raju Maharjan on 8/3/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface LoginStoryboardViewController : UITableViewController

@property (nonatomic,strong) UIImageView *imgView;

-(IBAction)authenticate:(id)sender;



@end
