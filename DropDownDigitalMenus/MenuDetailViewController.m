//
//  MenuDetailViewController.m
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 11/5/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import "MenuDetailViewController.h"
#import "Constants.h"

@interface MenuDetailViewController ()
{
    NSMutableArray *menuTitles;
}
-(void) roundLabel;
@end

@implementation MenuDetailViewController
@synthesize menuDetailData = _menuDetailData;

#pragma -mark Table View Events

-(void)roundLabel{
    //Add border and rounded corners to text view
    [self.drinksTextLabel.layer setCornerRadius:10];
    [self.drinksTextLabel.layer setBorderWidth:1];
    [self.wineTextLabel.layer setCornerRadius:10];
    [self.wineTextLabel.layer setBorderWidth:1];
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *message    = @"",
             *title      = @"",
             *menuKey    = @"",
             *imageName  = @"",
             *cellId     = @"";
    
    UITableViewCell *cell = nil;
    
    NSInteger index = -1;
    
    CGRect frameRect,
    labelRect;
    
    UIImage *image = nil;
    
    UIImageView *imageView = nil;
    
    UILabel *labelView = nil;
    
    @try {
        
        frameRect =  CGRectMake(kRowHorizontalPadding * 0.5,kRowVerticalPadding * 0.5,
                                kTableLength - kRowHorizontalPadding,kCellHeight - kRowVerticalPadding);
        
        labelRect =  CGRectMake(kRowHorizontalPadding * 0.5,kCellHeight - kArticleTitleLabelPadding,
                                kTableLength -4 ,kArticleTitleLabelPadding - kRowVerticalPadding);
        
        cellId = @"HorizontalCell";
        
        cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        
        if (! cell){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
            
        }
        
        // @"Drinks",@"Salads and Sides", @"Meats", @"Desserts"
        
        /*switch ([indexPath section]) {
            case 0:
                menuKey   = [NSString stringWithFormat:@"BarBack_%ld.jpg",(long)index];
                
                index     = arc4random_uniform([drinkImages count]);
                
                imageName = [drinkImages objectAtIndex:index];
                title     = [drinkTitles objectAtIndex:index];
                
                break;
            case 1:
                menuKey   = [NSString stringWithFormat:@"SaladBarBack_%ld.jpg",(long) index];
                
                index     = arc4random_uniform([appImages count]);
                
                imageName = [appImages objectAtIndex:index];
                title     = [appTitles objectAtIndex:index];
                
                break;
            case 2:
                menuKey   = [NSString stringWithFormat:@"MeatBack_%ld.jpg",(long) index];
                
                index     = arc4random_uniform([meatImages count]);
                
                imageName = [meatImages objectAtIndex:index];
                title     = [meatTitles objectAtIndex:index];
                
                break;
            case 3:
                menuKey   = [NSString stringWithFormat:@"DessertBack_%ld.jpg",(long) index];
                
                index     = arc4random_uniform([dessertImages count]);
                
                imageName = [dessertImages objectAtIndex:index];
                title     = [dessertTitles objectAtIndex:index];
                
                break;
        }*/
        
        image = [UIImage imageNamed:imageName];
        
        imageView = [[UIImageView alloc] initWithFrame:frameRect];
        
        [imageView setImage:image];
        
        cell.backgroundColor =  kHorizontalTableSelectedBackgroundColor;
        
        labelView = [[UILabel alloc] initWithFrame:labelRect];
        
        [labelView setBackgroundColor:[UIColor blackColor]];
        
        [labelView setAlpha:0.7];
        
        [labelView setTextColor:[UIColor whiteColor]];
        
        [labelView setFont:[UIFont systemFontOfSize:17.0]];
        
        [labelView setText:title];
        
        [imageView addSubview:labelView];
        
        [cell.contentView addSubview:imageView];
        
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
        [imageView sizeThatFits:frameRect.size];
        [labelView sizeThatFits:labelRect.size];
        
        
        
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
    
    return cell;
    
}




-(UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    float x,
    y,
    w,
    h;
    
    x =  kRowVerticalPadding * 0.5;
    y =  kRowVerticalPadding * 0.5;
    w =  kTableLength - kRowHorizontalPadding;
    h =  kTableYStart;
    
    
    CGRect frameRect =  CGRectMake(x,y,w,h);
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:frameRect];
    
    NSString *sectionTitle = @"";
             sectionTitle = [menuTitles objectAtIndex:section];
    
    [titleLabel setBackgroundColor:kVerticalTableBackgroundColor];
    titleLabel.TextColor = kHorizontalTableSelectedBackgroundColor;
    [titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
    [titleLabel setText:sectionTitle];
    
    return titleLabel;
}


/*
 -(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
 NSString *sectionTitle = @"";
 sectionTitle = [menuTitles objectAtIndex:section];
 return sectionTitle;
 }
 */
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
