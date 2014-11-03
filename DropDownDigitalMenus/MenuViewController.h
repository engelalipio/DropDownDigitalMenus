//
//  MenuViewController.h
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 10/29/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface MenuViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@property (strong, nonatomic) UIPageControl *pageControl;

@property (nonatomic,strong) NSTimer   *timer;
@property (nonatomic,strong) NSRunLoop *loop;


@property(nonatomic,strong) NSIndexPath *indexPath;
@end
