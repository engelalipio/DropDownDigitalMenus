//
//  MeatDetailViewController.m
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 11/10/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//
#import "AppDelegate.h"
#import "MeatDetailViewController.h"
#import "ItemViewController.h"
#import "Constants.h"

@interface MeatDetailViewController()
{
    AppDelegate *appDelegate;
    UIImageView *selectedImageView;
}
-(void) checkOrderCount;
-(void) initTableView;
@end

@implementation MeatDetailViewController


#pragma -mark Cart Animation

- (CGRect)approximateFrameForTabBarItemAtIndex:(NSUInteger)barItemIndex inTabBar:(UITabBar *)tabBar {
    
    CGRect tabBarRect;
    
    NSArray *barItems = nil;
    
    NSString *message = @"";
    
    CGFloat barMidX = 0.0f,
            distanceBetweenBarItems = 0.0f,
            totalBarItemsWidth = 0.0f,
            barItemX = 0.0f;
    
    CGSize  barItemSize;
    
    @try {
        
        barItems = tabBar.items;
        
        barMidX = CGRectGetMidX([tabBar frame]);
        
        barItemSize = CGSizeMake(80.0, 45.0);
        
        distanceBetweenBarItems = 110.0;
        
        barItemX = barItemIndex * distanceBetweenBarItems + barItemSize.width * 0.5;
        
        totalBarItemsWidth = ([barItems count]-1) * distanceBetweenBarItems + barItemSize.width;
        
        barItemX += barMidX - round(totalBarItemsWidth * 0.5);
        
        tabBarRect =  CGRectMake(barItemX, CGRectGetMinY([tabBar frame]), 30.0, barItemSize.height);
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        
        if ([message length] > 0){
            NSLog(@"%@",message);
        }
        message = @"";
        
        barItems = nil;
        
        message = @"";
        
        barMidX = 0.0f;
        distanceBetweenBarItems = 0.0f;
        totalBarItemsWidth = 0.0f;
        barItemX = 0.0f;
    
    }
    
    return tabBarRect;
}


-(void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    NSString *message   = @"",
             *orderItem = @"";
    
    NSInteger orderItems        = 0,
              currentOrderCount = 0,
              itemsCount        = 0;
    
    @try {
        
        itemsCount = kOrderTabItemIndex;
        
        if (! appDelegate){
            appDelegate = [AppDelegate currentDelegate];
        }
        
        currentOrderCount = [appDelegate currentOrderItems];
        if (! currentOrderCount){
            currentOrderCount = 0;
            [appDelegate setCurrentOrderItems:currentOrderCount];
        }
        orderItem = [NSString stringWithFormat:@"%d",currentOrderCount];
        [[[[self.tabBarController tabBar] items] objectAtIndex:itemsCount] setBadgeValue:orderItem];
    
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        message   = @"";
        orderItem = @"";
        
        orderItems = 0;
        itemsCount = 0;
    }
    
}

- (void) initiateAddToCart:(NSInteger) orderItems{
    
    
    static float const curvingIntoCartAnimationDuration = kAnimationSpeed;
    
    CALayer *layerToAnimate = nil;
    
    CAKeyframeAnimation *itemViewCurvingIntoCartAnimation = nil;
    
    CABasicAnimation    *itemViewShrinkingAnimation = nil,
    *itemAlphaFadeAnimation     = nil;
    
    CAAnimationGroup    *shrinkFadeAndCurveAnimation = nil;
    
    NSString *message = @"";
    
    @try {
        
        
        //Obtaining the Image Layer to animate
        
        layerToAnimate = selectedImageView.layer;
        
        itemViewCurvingIntoCartAnimation = [self itemViewCurvingIntoCartAnimation];
        
        
        
        itemViewShrinkingAnimation =  [CABasicAnimation animationWithKeyPath:@"bounds"];
        
        itemViewShrinkingAnimation.toValue = [NSValue valueWithCGRect:
                                              CGRectMake(0.0,0.0, selectedImageView.bounds.size.width/2.5,
                                                         selectedImageView.bounds.size.height/2.5)];
        
        itemAlphaFadeAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        
        itemAlphaFadeAnimation.toValue = [NSNumber numberWithFloat:0.5];
        
        shrinkFadeAndCurveAnimation = [CAAnimationGroup animation];
        
        [shrinkFadeAndCurveAnimation setAnimations:[NSArray arrayWithObjects:
                                                    itemViewCurvingIntoCartAnimation,
                                                    itemViewShrinkingAnimation,
                                                    itemAlphaFadeAnimation,
                                                    nil]];
        
        [shrinkFadeAndCurveAnimation setRepeatCount:orderItems];
        [shrinkFadeAndCurveAnimation setDuration:curvingIntoCartAnimationDuration];
        [shrinkFadeAndCurveAnimation setDelegate:self];
        [shrinkFadeAndCurveAnimation setRemovedOnCompletion:NO];
        [shrinkFadeAndCurveAnimation setValue:@"shrinkAndCurveToAddToOrderAnimation" forKey:@"name"];
        
        [layerToAnimate addAnimation:shrinkFadeAndCurveAnimation forKey:nil];
        
        
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        if ([message length] > 0){
            NSLog(@"%@",message);
        }
        message = @"";
    }
}

- (CAKeyframeAnimation *) itemViewCurvingIntoCartAnimation {
    
    NSString *message =@"";
    
    float riseAbovePoint = 300.0f;
    
    CGRect positionOfItemViewInView,
           orderTableItemRect;
    
    CGPoint beginningPointOfQuadCurve,
            endPointOfQuadCurve,
            controlPointOfQuadCurve;
    
    UIBezierPath * quadBezierPathOfAnimation = nil;
    
    CAKeyframeAnimation * itemViewCurvingIntoCartAnimation ;
    
    UITabBarItem *orderTabItem = nil;
    
    @try {
        
        //Originating Image
        positionOfItemViewInView = selectedImageView.frame;
        
        orderTabItem = (UITabBarItem*)  [[[self.tabBarController tabBar] items] objectAtIndex:kOrderTabItemIndex];
        
        orderTableItemRect = [self approximateFrameForTabBarItemAtIndex:kOrderTabItemIndex inTabBar:self.tabBarController.tabBar];
        
        UIImageView *orderImage = [[UIImageView alloc ] initWithFrame:orderTableItemRect];
        
        if (orderImage){
            [orderImage setImage:orderTabItem.image];
        }
        
        beginningPointOfQuadCurve = positionOfItemViewInView.origin;
        
        endPointOfQuadCurve = CGPointMake(orderImage.frame.origin.x + orderImage.frame.size.width/2,
                                          orderImage.frame.origin.y + orderImage.frame.size.height/2) ;
        
        controlPointOfQuadCurve = CGPointMake((beginningPointOfQuadCurve.x + endPointOfQuadCurve.x *2)/2,
                                              beginningPointOfQuadCurve.y -riseAbovePoint);
        
        quadBezierPathOfAnimation = [UIBezierPath bezierPath];
        
        [quadBezierPathOfAnimation moveToPoint:beginningPointOfQuadCurve];
        
        [quadBezierPathOfAnimation addQuadCurveToPoint:endPointOfQuadCurve controlPoint:controlPointOfQuadCurve];
        
        itemViewCurvingIntoCartAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        
        itemViewCurvingIntoCartAnimation.path = quadBezierPathOfAnimation.CGPath;
        
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        message = @"";
    }
    
    
    return itemViewCurvingIntoCartAnimation;
}


-(void)checkOrderCount{
    
    NSString *message   = @"",
             *orderItem = @"";
    
    NSInteger orderItems        = 0,
              currentOrderCount = 0,
              entCount          = 0,
              itemsCount        = 0;
    
    @try {
        
        itemsCount = kOrderTabItemIndex;
        
        if (! appDelegate){
            appDelegate = [AppDelegate currentDelegate];
        }
        
        currentOrderCount = [appDelegate currentOrderItems];
        if (! currentOrderCount){
            currentOrderCount = 0;
            [appDelegate setCurrentOrderItems:currentOrderCount];
        }
        
        orderItem =  [[[[self.tabBarController tabBar] items] objectAtIndex:itemsCount] badgeValue];
        
        if (! orderItem){
            orderItem = @"0";
        }
        if (orderItem){
        
            orderItems = [orderItem intValue];
            if (orderItems < currentOrderCount){
                
                if (selectedImageView != nil){
                    
                    if (appDelegate.entreeItems){
                        
                        entCount = [[appDelegate.entreeItems objectForKey:@"Quantity"] integerValue];
                        
                        [self initiateAddToCart:entCount];

                    }
                }


            }

        }
        

        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        message   = @"";
        orderItem = @"";
        
        orderItems = 0;
        itemsCount = 0;
    }
    
}

#pragma -mark Table View Events



-(void) initTableView{
    
    NSString *message = @"";
    
    @try{
        
        if (! self.tableView){
            self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, kTableYStart, kTabletWidth, kTableHeight)];
        }
        
        
        self.tableView.backgroundColor =  kVerticalTableBackgroundColor;
        
        [self.tableView setDelegate:self];
        [self.tableView setDataSource:self];
        
        
    }
    @catch(NSException *error){
        message = [error description];
    }
    @finally{
        if ([message length] > 0){
            NSLog(@"%@",message);
        }
    }
    
}


-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *message   = @"";
    @try {
        
        if (cell){
            //This will set the background of all of the views within the tablecell
            cell.contentView.superview.backgroundColor = kVerticalTableBackgroundColor;
        }
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        message = @"";
    }
    
}



-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    ItemViewController *item = [[ItemViewController alloc] init];
    
    NSString *price = @"$0.00",
             *title = @"",
             *data  = @"",
             *desc  = @"";
    
    UIImage *image = nil;
    
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (selectedCell){
        UIView *contentView = selectedCell.contentView;
        
        if (contentView){
            NSArray *subViews =  [contentView subviews];
            
            for (int viewCounter = 0; viewCounter < subViews.count; viewCounter++) {
                
                UIView *subView = [subViews objectAtIndex:viewCounter];
                
                if ([subView isKindOfClass:[UILabel class]]){
                    
                    UILabel *label = (UILabel*) subView;
                    
                    NSRange range = [label.text rangeOfString:@"$"];
                    
                    if ( range.location != NSNotFound){
                        price = [label.text substringFromIndex:1];
                        
                    }else{
                        
                        data = label.text;
                        
                        if ([title length] == 0){
                            title  = data;
                        }else{
                            
                            desc = data;
                            
                            if ([title length] > [data length]){
                                desc = title;
                                title = data;
                            }
                        }
                        
                    }
                    
                }
                
                if ([subView isKindOfClass:[UIImageView class]]){
                    
                    UIImageView *imageV = (UIImageView*) subView;
                    
                    image = [imageV image];
                    
                }
                
            }
            
        }
    }
    

    if ( selectedCell.imageView){
        selectedImageView =  selectedCell.imageView;
    }
    
    
    [self setModalPresentationStyle:UIModalPresentationCustom];
    
    [self presentViewController:item animated:YES completion:^(void) {
        
        CGRect imageRect = CGRectMake(0.0f, 60.0f, 600,600);
        
        [item.imageView setFrame:imageRect];
        [item.imageView setImage:image];
        [item setFoodType:Entrees];
        
        switch (indexPath.section) {
            /*case 0:
                [item setEntreeType:Beef];
                break;*/
            case 0:
                [item setEntreeType:Chicken];
                break;
            case 1:
                [item setEntreeType:Seafood];
                break;
            case 2:
                [item setEntreeType:Pasta];
                break;
        }
        
        [item configureSegs];

        [item.labelTitle setText:title];
        [item.labelPrice setText:[NSString stringWithFormat:@"$%@",price]];
        [item.labelDescription setText:desc];
        [item.labelQuantity setText:@"1"];
        
        
    }];
    
    
}


-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger sectionCount = 3;//4 /*Make 4 to include beef*/
    return sectionCount;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger rowCount = 1;
    
    switch (section) {
        case 2:
            rowCount = 9;
            break;
        case 0:
            rowCount = 5;
            break;
        case 1:
            rowCount = 5;
            break;
        /*case 0:
            rowCount = 4;
            break;*/
    }
    return rowCount;
}

-(void) viewDidLoad{
    [super viewDidLoad];
    [self initTableView];
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self checkOrderCount];
}

@end
