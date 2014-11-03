//
//  SecondViewController.h
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 10/22/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import <GameKit/GameKit.h>

@interface GamesViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end

