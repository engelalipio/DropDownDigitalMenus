//
//  MenuDetailViewController.m
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 11/5/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import "BeveragesViewController.h"
#import "Constants.h"
#import "ItemViewController.h"
#import "AppDelegate.h"

@interface BeveragesViewController ()
{
    NSMutableArray *menuTitles;
    AppDelegate *appDelegate;
}
-(void) checkOrderCount;
@end

@implementation BeveragesViewController


-(void)checkOrderCount{
    
    NSString *message   = @"",
             *orderItem = @"";
    
    NSInteger orderItems      = 0,
    currentOrderCount         = 0,
    itemsCount                = 0;
    
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
                orderItems = currentOrderCount;
                orderItem = [NSString stringWithFormat:@"%d",orderItems];
                [[[[self.tabBarController tabBar] items] objectAtIndex:itemsCount] setBadgeValue:orderItem];
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
    
    [self setModalPresentationStyle:UIModalPresentationCustom];
    
    [self presentViewController:item animated:YES completion:^(void) {
        
        CGRect imageRect = CGRectMake(0.0f, 60.0f, 600,600);
        
        [item.imageView setFrame:imageRect];
        
        if (! image){
            [item.imageView setImage:[UIImage imageNamed:@"wine_glass-512.png"]];
        }else{
        
            [item.imageView setImage:image];
        }
        
        [item.labelTitle setText:title];
        [item.labelPrice setText:[NSString stringWithFormat:@"$%@",price]];
        [item.labelDescription setText:desc];
        [item.labelQuantity setText:@"1"];
        
        
    }];
    
    
}


-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger sectionCount = 3  ;
    // @"Drinks",@"Salads and Sides", @"Meats", @"Desserts"
    return sectionCount;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger rowCount = 1;
    // @"Drinks",@"Salads and Sides", @"Meats", @"Desserts"
    switch (section) {
     case 0:
            rowCount = 2;
     break;
     case 1:
            rowCount = 4;
     break;
     case 2:
            rowCount = 2;
     break;
    
     }
    return rowCount;
}


-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self checkOrderCount];
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    // Do any additional setup after loading the view.
    //[self roundLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end