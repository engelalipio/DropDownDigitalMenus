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

@property (strong, nonatomic) NSMutableDictionary *drinkItems;
@property (strong, nonatomic) NSMutableDictionary *saladItems;
@property (strong, nonatomic) NSMutableDictionary *meatItems;
@property (strong, nonatomic) NSMutableDictionary *dessertItems;
@end


