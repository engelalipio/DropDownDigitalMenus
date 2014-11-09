//
//  MenuDetailViewController.h
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 11/5/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"


@interface MenuDetailViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITextView *drinksTextLabel;
@property (strong, nonatomic) IBOutlet UITextView *wineTextLabel;


@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableDictionary *menuDetailData;

@end
