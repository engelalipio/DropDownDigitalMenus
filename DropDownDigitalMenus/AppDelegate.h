//
//  AppDelegate.h
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 10/22/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import <UIKit/UIKit.h>


enum OrderType {
     OrderTypeDrinks	= 1,
     OrderTypeSalads	= 2,
     OrderTypeMeats		= 3,
     OrderTypeDesserts	= 4
};

typedef int OrderTypeSelection;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, assign) NSInteger currentOrderItems;

@property (strong, nonatomic) NSMutableDictionary *drinkItems;
@property (strong, nonatomic) NSMutableDictionary *appItems;
@property (strong, nonatomic) NSMutableDictionary *soupItems;
@property (strong, nonatomic) NSMutableDictionary *saladItems;
@property (strong, nonatomic) NSMutableDictionary *dessertItems;
@property (strong, nonatomic) NSMutableDictionary *entreeItems;
+(AppDelegate *) currentDelegate;

@end


