//
//  DessertsViewController.h
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 10/24/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *txtTableNumber;

@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtAddress;
@property (strong, nonatomic) IBOutlet UITextField *txtCity;
@property (strong, nonatomic) IBOutlet UITextField *txtState;
@property (strong, nonatomic) IBOutlet UITextField *txtZip;
@property (strong, nonatomic) IBOutlet UISwitch *switchOrderReset;

@property (strong, nonatomic) IBOutlet UISwitch *switchDynamic;
@property (strong, nonatomic) IBOutlet UIStepper *stepperInterval;
@property (strong, nonatomic) IBOutlet UITextField *txtSeconds;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerLanguage;
@property (strong, nonatomic) IBOutlet UIButton *btnSave;
@property (strong, nonatomic) IBOutlet UIImageView *languageImage;
@property (strong, nonatomic) IBOutlet UILabel *savedLabel;

- (IBAction)actionSaveSettings:(UIButton *)sender;
- (IBAction)actionChangeInterval:(UIStepper *)sender;
- (IBAction)actionDynamicChanged:(UISwitch *)sender;

@end
