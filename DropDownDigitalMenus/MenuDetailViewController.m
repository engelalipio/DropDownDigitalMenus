//
//  MenuDetailViewController.m
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 11/5/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import "MenuDetailViewController.h"
#import "Constants.h"
#import "ItemViewController.h"

@interface MenuDetailViewController ()
{
    NSMutableArray *menuTitles;
}

@end

@implementation MenuDetailViewController


#pragma -mark Table View Events


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    ItemViewController *item = [[ItemViewController alloc] init];
    
    NSString *price = @"$0.00",
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
                        desc = [label.text substringFromIndex:0];
                    
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
        
        [item.imageView setImage:image];
        [item.labelPrice setText:price];
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
            rowCount = 3;
     break;
     case 1:
            rowCount = 2;
     break;
     case 2:
            rowCount = 3;
     break;
    
     }
    return rowCount;
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
