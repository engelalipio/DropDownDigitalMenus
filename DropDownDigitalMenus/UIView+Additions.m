//
//  UIView+_Additions.m
//
//  Created by Engel Alipio on 4/8/14.
//  Copyright (c) 2014 MainFrame. All rights reserved.
//

#import "UIView+Additions.h"

@implementation UIView (Additions)

+ (id)instanceFromNib
{
	NSString *className = [NSString stringWithFormat:@"%@", [self class]];
    
	return [self instanceFromNibWithName:className];
}

+ (id)instanceFromNibWithName:(NSString *)nibName
{
	return [[[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil] objectAtIndex:0];
}

- (CGFloat)left
{
	return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x
{
	CGRect frame = self.frame;
    
	frame.origin.x	= x;
	self.frame		= frame;
}

- (CGFloat)top
{
	return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y
{
	CGRect frame = self.frame;
    
	frame.origin.y	= y;
	self.frame		= frame;
}

- (CGFloat)right
{
	return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right
{
	CGRect frame = self.frame;
    
	frame.origin.x	= right - frame.size.width;
	self.frame		= frame;
}

- (CGFloat)bottom
{
	return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom
{
	CGRect frame = self.frame;
    
	frame.origin.y	= bottom - frame.size.height;
	self.frame		= frame;
}

- (CGFloat)width
{
	return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
	CGRect frame = self.frame;
    
	frame.size.width	= width;
	self.frame			= CGRectIntegral(frame);
}

- (CGFloat)height
{
	return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
	CGRect frame = self.frame;
    
	frame.size.height	= height;
	self.frame			= CGRectIntegral(frame);
}

- (CGPoint)origin
{
	return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin
{
	CGRect frame = self.frame;
    
	frame.origin	= origin;
	self.frame		= CGRectIntegral(frame);
}

- (CGSize)size
{
	return self.frame.size;
}

- (void)setSize:(CGSize)size
{
	CGRect frame = self.frame;
    
	frame.size	= size;
	self.frame	= CGRectIntegral(frame);
}

- (UIView *)findFirstResponder
{
	if (self.isFirstResponder) {
		return self;
	}
    
	for (UIView *subView in self.subviews) {
		UIView *firstResponder = [subView findFirstResponder];
        
		if (firstResponder != nil) {
			return firstResponder;
		}
	}
    
	return nil;
}
@end
