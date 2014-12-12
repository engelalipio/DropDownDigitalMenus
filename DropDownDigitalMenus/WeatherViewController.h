//
//  WeatherViewController.h
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 12/11/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherViewController : UIViewController<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UINavigationItem *weatherNav;

@end
