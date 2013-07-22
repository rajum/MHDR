//
//  LoginViewController.h
//  MHDR
//
//  Created by Raju Maharjan on 7/16/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"


@interface LoginViewController : UIViewController

@property (nonatomic, retain) IBOutlet UITextField  *usernameTextField;
@property (nonatomic, retain) IBOutlet UITextField  *passwordTextField;

-(IBAction)authenticate:(id)sender;

@end
