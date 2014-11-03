//
//  PageContentViewController.h
//
//
//  Created by Engel Alipio on 9/7/14.
//  Copyright (c) 2014. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIPageViewController <UIPageViewControllerDataSource,UIPageViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) IBOutlet UILabel     *titleLabel;

@property (strong, nonatomic) IBOutlet UIButton *btnSignUp;

@property (strong, nonatomic) IBOutlet UIButton *btnSignIn;

@property (strong, nonatomic) IBOutlet UIButton *btnExplore;


@property (nonatomic, assign) NSUInteger pageIndex;
@property (nonatomic, strong) NSString   *titleText;
@property (nonatomic, strong) NSString   *imageFile;
@property (nonatomic, assign) CGRect     frameRect;


@end
