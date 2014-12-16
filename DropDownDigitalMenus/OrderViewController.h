//
//  OrderViewController.h
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 11/10/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface OrderViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UIButton *orderButton;
@property (strong, nonatomic) IBOutlet UIButton *payButton;
@property (strong, nonatomic) IBOutlet UIButton *changeOrder;
 
@property (strong, nonatomic) IBOutlet UIBarButtonItem *EditOrder;

- (IBAction)editOrder:(UIBarButtonItem *)sender;
- (IBAction)placeOrder:(UIButton *)sender;
- (IBAction)payOrder:(UIButton *)sender;

@end
