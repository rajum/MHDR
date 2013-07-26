//
//  APMApplicationViewController.h
//  MHDR
//
//  Created by Raju Maharjan on 7/26/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APMApplication.h"

@interface APMApplicationViewController : UIViewController
{
    __weak IBOutlet UILabel *nameField;
    
    __weak IBOutlet UILabel *companyField;
    
    __weak IBOutlet UILabel *cityField;
}

@property (nonatomic,strong) APMApplication *application;

@end
