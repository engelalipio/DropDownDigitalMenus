//
//  FirstViewController.h
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 10/22/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServiceViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UILabel *lblOrderStatus;
@property (strong, nonatomic) IBOutlet UILabel *lblBillStatus;

@property (strong, nonatomic) IBOutlet UIButton *btnRequestBill;
@property (strong, nonatomic) IBOutlet UIButton *btnCallWaiter;

- (IBAction)actionRequestBill:(UIButton *)sender;
- (IBAction)actionCallWaiter:(UIButton *)sender;

@end

