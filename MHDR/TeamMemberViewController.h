//
//  TeamMemberViewController.h
//  MHDR
//
//  Created by Raju Maharjan on 7/17/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeamMember.h"

@interface TeamMemberViewController : UIViewController
{
    __weak IBOutlet UILabel *nameField;
    
    __weak IBOutlet UILabel *cellPhoneField;
    
    __weak IBOutlet UILabel *pagerField;
    
    __weak IBOutlet UILabel *officePhoneField;
    
    __weak IBOutlet UILabel *homePhoneField;
    
    __weak IBOutlet UIButton *officePhoneBtn;
    
}


@property (nonatomic,strong) TeamMember *member;
- (IBAction)callPhone:(id)sender;

@end
