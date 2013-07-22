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
    
    __weak IBOutlet UILabel *companyField;
    
    __weak IBOutlet UILabel *cityField;
}

@property (nonatomic,strong) TeamMember *member;

@end
