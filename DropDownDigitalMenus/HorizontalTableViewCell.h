//
//  HorizontalTableViewCell.h
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 10/31/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface HorizontalTableViewCell : UITableViewCell<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *horizontalTableView;
@property (strong, nonatomic) NSMutableDictionary *items;
@end
