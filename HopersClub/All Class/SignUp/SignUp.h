//
//  SignUp.h
//  HopersClub
//
//  Created by Raj iOS on 07/06/16.
//  Copyright © 2016 Parshwa iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUp : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *txtLastName;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtMobile;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtConPass;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end
