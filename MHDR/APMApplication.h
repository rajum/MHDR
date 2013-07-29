//
//  APMApplication.h
//  MHDR
//
//  Created by Raju Maharjan on 7/26/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APMApplication : NSObject

@property (strong,nonatomic) NSString *Application;
@property (strong,nonatomic) NSString *SegmentOwner;
@property (strong,nonatomic) NSString *SolutionSegment;

@property NSInteger sectionNumber;

@end
