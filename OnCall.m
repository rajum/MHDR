//
//  OnCall.m
//  MHDR
//
//  Created by Raju Maharjan on 7/30/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import "OnCall.h"

@implementation OnCall

- (NSString *)Pager
{
    if([_Pager isKindOfClass:[NSNull class]])
        return nil;
    return _Pager;
}

- (NSString *)CellPhone
{
    if([_CellPhone isKindOfClass:[NSNull class]])
        return nil;
    return _CellPhone;
}


- (NSString *)Phone
{
    if([_Phone isKindOfClass:[NSNull class]])
        return nil;
    return _Phone;
}



@end
