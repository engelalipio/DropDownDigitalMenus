//
//  LanguagesViewController.h
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 12/12/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LanguagesViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
