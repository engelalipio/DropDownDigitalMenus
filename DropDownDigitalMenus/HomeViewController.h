//
//  HomeViewController.h
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 10/24/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface HomeViewController : UIPageViewController<UITableViewDataSource,UITableViewDelegate,UIPageViewControllerDataSource,UIAlertViewDelegate,ADBannerViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (strong, nonatomic) IBOutlet ADBannerView *bannerView;
@property (strong, nonatomic) IBOutlet UILabel *backgrounLabelHolder;

@property (strong,nonatomic)  NSArray *pageTitles;
@property (strong,nonatomic)  NSArray *pageImages;

@property (nonatomic, assign) NSUInteger currentPageIndex;

@property (strong, nonatomic) UIPageControl *pageControl;

@property (nonatomic,strong) NSTimer   *timer;
@property (nonatomic,strong) NSRunLoop *loop;

-(void) startTimer;
-(void) stopTimer;

@end
