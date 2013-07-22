//
//  TeamJSONObjectDelegate.h
//  MHDR
//
//  Created by Raju Maharjan on 7/12/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TeamJSONObjectDelegate <NSObject>

-(void)readFromTeamJSONObject:(NSDictionary *)teamJSONObject;

@end
