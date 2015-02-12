//
//  PaymentMethodViewController.h
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 2/10/15.
//  Copyright (c) 2015 Digital World International. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaymentMethodViewController : UITableViewController<UITextFieldDelegate, UIPickerViewDataSource,UIPickerViewDelegate, UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UIButton *btnCancel;
- (IBAction)actionCancel:(UIButton *)sender;

@property (strong, nonatomic) NSString *totalAmount ;
@property (strong, nonatomic) IBOutlet UITextField *txtFirstName;
@property (strong, nonatomic) IBOutlet UITextField *txtCardName;
@property (strong, nonatomic) IBOutlet UIPickerView *pckDate;
@property (strong, nonatomic) IBOutlet UIButton *btnCamera;
@property (strong, nonatomic) IBOutlet UIButton *btnAddCard;

@property (strong, nonatomic) IBOutlet UIButton *addGiftCard;
@property (strong, nonatomic) IBOutlet UITextField *txtCardSet1;

@property (strong, nonatomic) IBOutlet UITextField *txtCardSet2;

@property (strong, nonatomic) IBOutlet UITextField *txtCardSet3;

@property (strong, nonatomic) IBOutlet UITextField *txtCardSet4;
@property (strong, nonatomic) IBOutlet UITextField *txtGiftCard;

@property (strong, nonatomic) IBOutlet UITextField *txtSecurityCode;
- (IBAction)actionAddCard:(UIButton *)sender;
- (IBAction)actionAddGiftCard:(UIButton *)sender;

@end
