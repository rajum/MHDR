//
//  LoginStoryboardViewController.h
//  MHDR
//
//  Created by Raju Maharjan on 8/3/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface LoginStoryboardViewController : UITableViewController <UITextFieldDelegate>

@property (nonatomic,strong) UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;

-(IBAction)authenticate:(id)sender;



@end
