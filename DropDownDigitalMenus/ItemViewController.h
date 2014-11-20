//
//  ItemViewController.h
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 11/9/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ItemViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) IBOutlet UILabel *labelDescription;
@property (strong, nonatomic) IBOutlet UILabel *labelPrice;
@property (strong, nonatomic) IBOutlet UILabel *labelQuantity;
@property (strong, nonatomic) IBOutlet UIStepper *itemStepper;
@property (strong, nonatomic) IBOutlet UIButton *addToOrderButton;
@property (strong, nonatomic) IBOutlet UILabel *labelTitle;


- (IBAction)cancelOrder:(UIButton *)sender;

- (IBAction)addToOrderAction:(UIButton *)sender;

- (IBAction)stepperAction:(UIStepper *)sender;

@end
