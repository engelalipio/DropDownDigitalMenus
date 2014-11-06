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

@property (nonatomic,strong) NSTimer   *drinksTimer;
@property (nonatomic,strong) NSTimer   *appsTimer;
@property (nonatomic,strong) NSTimer   *meatsTimer;
@property (nonatomic,strong) NSTimer   *dessertsTimer;

@property (nonatomic,strong) NSRunLoop *loop;


@property(nonatomic,strong) NSIndexPath *indexPath;


-(void) startTimers;
-(void) stopTimers;

@end
