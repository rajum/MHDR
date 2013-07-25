//
//  APMGroupViewController.h
//  MHDR
//
//  Created by Raju Maharjan on 7/25/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APMGroupViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UIPickerView *thePickerView;
@property (strong,nonatomic) IBOutlet UITextField *selectedCountry;
@property (strong,nonatomic) IBOutlet UITextField *selectedCity;

@property (strong,nonatomic) NSArray *oneColumnList;
@property (strong, nonatomic) NSArray *secondColumnList;
@end
