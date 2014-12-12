//
//  NewsViewController.h
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 11/10/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UINavigationItem *newsNav;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIImageView *newsImage;

@end
