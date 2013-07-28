//
//  TeamMember.h
//  MHDR
//
//  Created by Raju Maharjan on 7/12/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TeamJSONObjectDelegate.h"

@interface TeamMember : NSObject


@property (strong,nonatomic) NSString *LastName;
@property (strong,nonatomic) NSString *FirstName;
@property (strong,nonatomic) NSString *CellPhone;
@property (strong,nonatomic) NSString *Pager;
@property (strong,nonatomic) NSString *OfficePhone;
@property (strong,nonatomic) NSString *HomePhone;

@property (strong,nonatomic) NSString *FullName;

@property NSInteger sectionNumber;

@end
