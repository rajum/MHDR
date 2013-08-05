//
//  NSStringAdditions.h
//  MHDR
//
//  Created by Raju Maharjan on 8/5/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSStringAdditions : NSObject

+ (NSString *) base64StringFromData:(NSData *)data length:(int)length;

@end
