//
//  OnCallDatePickerViewController.h
//  MHDR
//
//  Created by Raju Maharjan on 7/26/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OnCallDatePickerViewController : UIViewController<UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *selectedDateField;
@end
