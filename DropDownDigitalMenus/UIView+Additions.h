//
//  UIView+_Additions.h
//
//  Created by Engel Alipio on 4/8/14.
//  Copyright (c) 2014 MainFrame. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Additions)
@property (nonatomic) CGFloat	left;
@property (nonatomic) CGFloat	top;
@property (nonatomic) CGFloat	right;
@property (nonatomic) CGFloat	bottom;
@property (nonatomic) CGFloat	width;
@property (nonatomic) CGFloat	height;

@property (nonatomic) CGPoint	origin;
@property (nonatomic) CGSize	size;

+ (id)instanceFromNib;
+ (id)instanceFromNibWithName:(NSString *)nibName;

- (UIView *)findFirstResponder;
@end
