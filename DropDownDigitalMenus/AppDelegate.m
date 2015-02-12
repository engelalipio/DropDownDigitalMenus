//
//  AppDelegate.m
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 10/22/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize drinkItems = _drinkItems;
@synthesize saladItems = _saladItems;
@synthesize soupItems  = _soupItems;
@synthesize entreeItems  = _entreeItems;
@synthesize dessertItems = _dessertItems;
@synthesize appItems = _appItems;
@synthesize currentOrderItems = _currentOrderItems;
@synthesize language = _language;
@synthesize isDynamic = _isDynamic;
@synthesize restaurantTable = _restaurantTable;
@synthesize restaurantName = _restaurantName;
@synthesize restaurantAddress = _restaurantAddress;
@synthesize restaurantCity = _restaurantCity;
@synthesize restaurantState = _restaurantState;
@synthesize restaurantZip = _restaurantZip;
@synthesize interval = _interval;
@synthesize isSent = _isSent;
@synthesize isPaid = _isPaid;


+(AppDelegate *) currentDelegate{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

-(void)tabBarController:(UITabBarController *)tabBarControllerThis didSelectViewController:(UIViewController *)viewController
{
    [UIView transitionWithView:viewController.view
                      duration:0.1
                       options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionTransitionCrossDissolve
                    animations:^(void){
                    } completion:^(BOOL finished){
                        [UIView beginAnimations:@"animation" context:nil];
                        [UIView setAnimationDuration:0.7];
                        [UIView setAnimationBeginsFromCurrentState:YES];
                        [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp
                                               forView:viewController.view
                                                 cache:NO];
                        [UIView commitAnimations];
                    }];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    _language = @"English";
    _isDynamic = NO;
    _isSent   = NO;
    
    _restaurantTable   = @"Table 1";
    _restaurantName    = @"Demo Restaurant";
    _restaurantAddress = @"123 Beach Street";
    _restaurantCity    = @"Jacksonville Beach";
    _restaurantState   = @"FL";
    _restaurantZip     = @"32250";
    _interval          = 5;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
