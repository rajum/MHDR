//
//  OnCall.h
//  MHDR
//
//  Created by Raju Maharjan on 7/30/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OnCall : NSObject

@property (strong,nonatomic) NSString *SolSegment;
@property (strong,nonatomic) NSString *OnCallPerson;
@property (strong,nonatomic) NSString *Details;
@property (strong,nonatomic) NSString *Pager;
@property (strong,nonatomic) NSString *CellPhone;
@property (strong,nonatomic) NSString *Phone;
@property (strong,nonatomic) NSString *StartDate;
@property (strong,nonatomic) NSString *STime;
@property (strong,nonatomic) NSString *EndDate;
@property (strong,nonatomic) NSString *ETime;

@property NSInteger sectionNumber;

@end
