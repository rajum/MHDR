//
//  ContactListViewController.h
//  MHDR
//
//  Created by Raju Maharjan on 7/29/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactListViewController : UITableViewController

@property (nonatomic,strong) NSArray *contactList;
- (void)loadDocument:(NSString*)documentName; 
- (IBAction)close:(id)sender;

@end
