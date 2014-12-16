//
//  itemModel.h
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 12/15/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface itemModel : NSObject

@property (nonatomic, strong) NSString	*Category;
@property (nonatomic, strong) NSString	*Title;
@property (nonatomic, strong) NSString	*Description;
@property (nonatomic, strong) NSString	*Price;
@property (nonatomic, strong) NSString	*Quantity;
@property (nonatomic, strong) UIImage   *Image;


@end
