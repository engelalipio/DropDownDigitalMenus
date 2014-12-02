//
//  GameViewController.h
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 10/29/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface GameViewController : UIViewController<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSString *gameURL;
@property (strong, nonatomic) IBOutlet UIButton *btnBack;
- (IBAction)backAction:(UIButton *)sender;

@end
