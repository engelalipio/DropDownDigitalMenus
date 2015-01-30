//
//  OrderViewController.m
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 11/10/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import "OrderViewController.h"
#import "Constants.h"
#import "itemModel.h"
#import "AppDelegate.h"
#import "HeaderImageCell.h"
#import "NumberFormatter.h"

@interface OrderViewController(){
    AppDelegate         *appDelegate;
    NSMutableArray      *categories;
    NSMutableDictionary *orderItems;
    float               orderPrice;
    NumberFormatter *formatter ;
    NSNumber *numberPrice ;
}

@end

@implementation OrderViewController

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (! appDelegate){
        appDelegate = [AppDelegate currentDelegate];
    }
    [self compileOrderItems];
    [self.tableView reloadData];
}

-(void) viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.lblTotal setText:@"0.00"];
    orderItems = nil;
    appDelegate = nil;
    formatter = nil;
    orderPrice = 0.0f;
    numberPrice = nil;
}

-(void) viewDidLoad{
    [super viewDidLoad];
    
    [self initTableView];
    
}

-(void)updateOrderCount{
    
    NSString *message   = @"",
             *orderItem = @"";
    
    NSInteger currentOrderCount = 0,
              itemsCount        = 0;
    
    @try {
        
        itemsCount = kOrderTabItemIndex;

        currentOrderCount = [appDelegate currentOrderItems];
        if (! currentOrderCount){
            currentOrderCount = 0;
        }
        
       [[[[self.tabBarController tabBar] items] objectAtIndex:itemsCount]
                setBadgeValue:[NSString stringWithFormat:@"%d",currentOrderCount]];
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        message   = @"";
        orderItem = @"";
        

        itemsCount = 0;
    }
    
}



-(void) compileOrderItems{

    NSString *message = @"",
             *keyName = @"";
    
    itemModel *drinks   = nil,
              *apps     = nil,
              *soups    = nil,
              *salads   = nil,
              *entrees  = nil,
              *desserts = nil;
 
    
    @try{
        
        if (! appDelegate.isSent){
            [self.changeOrder setEnabled:YES];
            [self.changeOrder setAlpha:1.0f];
        }
        if (! appDelegate.isSent && ! appDelegate.isPaid){
            [self.orderButton setTitle:@"Send to Kitchen" forState:UIControlStateNormal];
            [self.orderButton setEnabled:YES];
            [self.orderButton setAlpha:1.0f];
            
        }
        
            categories = [[NSMutableArray alloc] init];
       
            orderItems = [[NSMutableDictionary alloc] init];
        
        for (int iKey = 0; iKey < 7 ; iKey++) {
            
        
            switch (iKey) {
                case 0:
                    keyName = @"Header";
                    [categories addObject:keyName];
                    
                    break;
                case 1:
                    keyName = @"Beverages";
                
                    drinks = [appDelegate.drinkItems objectForKey:keyName];
                    if (drinks){
                        [categories addObject:keyName];
                        [orderItems setObject:drinks forKey:keyName];
                    }
                break;
                case 2:
                    keyName = @"Appetizers";
                    apps = [appDelegate.appItems objectForKey:keyName];
                    if (apps){
                        [categories addObject:keyName];
                        [orderItems setObject:apps forKey:keyName];
                    }
                break;
                case 3:
                    keyName = @"Soups";
                    soups = [appDelegate.soupItems objectForKey:keyName];
                    if (soups){
                        [categories addObject:keyName];
                        [orderItems setObject:soups forKey:keyName];
                    }
                break;
                case 4:
                    keyName = @"Salads";
                    salads = [appDelegate.saladItems objectForKey:keyName];
                    if (salads){
                        [categories addObject:keyName];
                        [orderItems setObject:salads forKey:keyName];
                    }
                break;

                case 5:
                    keyName = @"Entrees";
                    entrees = [appDelegate.entreeItems objectForKey:keyName];
                    if (entrees){
                        [categories addObject:keyName];
                        [orderItems setObject:entrees forKey:keyName];
                    }
                break;
                case 6:
                    keyName = @"Desserts";
                    desserts = [appDelegate.dessertItems objectForKey:keyName];
                    if (desserts){
                        [categories addObject:keyName];
                        [orderItems setObject:desserts forKey:keyName];
                    }
                break;
            }
            
        }
        

        
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

-(void) initTableView{
    
    NSString *message = @"";
    
    @try{
        
        self.view.backgroundColor =  kVerticalTableBackgroundColor;
        
        if (! self.tableView){
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, kTableYStart, kTabletWidth, kTableHeight)];
        }
        
        self.tableView.backgroundColor =  kVerticalTableBackgroundColor;
        
        [self.tableView sizeToFit];
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

-(UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *label  =nil;
    
    NSString *headerText = @"";
    
    switch (section) {
        case 0:
            
            headerText = @"Please Review Your Current Order";
            if (appDelegate.isSent){
              headerText = @"Please Use The 'Call Waiter' Button Below For Additional Changes";
            }
            
            label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, tableView.frame.size.width, 44.0f)];
            [label setTextAlignment:NSTextAlignmentCenter];
            [label setBackgroundColor:[UIColor colorWithHexString:@"800000"]];
            [label setFont:[UIFont systemFontOfSize:25.0f]];
            [label setTextColor:[UIColor orangeColor]];
            [label setText:headerText];
            
            break;
        default:
            
            headerText = [categories objectAtIndex:section];
            
            if ([[headerText uppercaseString]  isEqual: @"FOOTER"]){
                label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, tableView.frame.size.width, 44.0f)];
                [label setBackgroundColor:[UIColor colorWithHexString:@"800000"]];
                [label setFont:[UIFont systemFontOfSize:25.0f]];
                [label setTextColor:[UIColor orangeColor]];
                [label setTextAlignment:NSTextAlignmentCenter];
                headerText = @"Click 'Send To Kitchen' if your order is correct";
            }else{
                label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, tableView.frame.size.width, 22.0f)];
                [label setTextColor:[UIColor whiteColor]];
                [label setBackgroundColor:[UIColor colorWithHexString:@"804000"]];
                [label setFont:[UIFont systemFontOfSize:22.0f]];
                 headerText = [NSString stringWithFormat:@"  %@",headerText];
            }


            [label setText:headerText];
            
            break;
    }
    
 
    
return label;

}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
                                forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger section = -1,
               orderCount = [appDelegate currentOrderItems];
    
    section = [indexPath section];
    
    NSString *keyName = [categories objectAtIndex:section];
    
    if (editingStyle == UITableViewCellEditingStyleDelete){
        
        
        [self.tableView beginUpdates];
        
        UITableViewCell *c =  [self.tableView cellForRowAtIndexPath:indexPath];
        if (c){
            [c.textLabel setText:@""];
            [c.detailTextLabel setText:@""];
            [c setAccessoryType:UITableViewCellAccessoryNone];
            [c setAccessoryView:nil];
        }
        
        orderCount--;
        
        [appDelegate setCurrentOrderItems:orderCount];
        
        
        if ([keyName isEqualToString:@"Beverages"]){
            [appDelegate setDrinkItems:nil];

        }
        if ([keyName isEqualToString:@"Appetizers"]){
            [appDelegate setAppItems:nil];
            
        }
        if ([keyName isEqualToString:@"Soups"]){
            [appDelegate setSoupItems:nil];
            
        }
        if ([keyName isEqualToString:@"Salads"]){
            [appDelegate setSaladItems:nil];
            
        }
        if ([keyName isEqualToString:@"Entrees"]){
            [appDelegate setEntreeItems:nil];
            
        }
        if ([keyName isEqualToString:@"Desserts"]){
            [appDelegate setDessertItems:nil];
            
        }
        
        itemModel *model = [orderItems objectForKey:keyName];
        
        orderPrice = orderPrice - [[model.Price stringByReplacingOccurrencesOfString:@"$" withString:@""] floatValue];
        
        [orderItems removeObjectForKey:keyName];
        [categories removeObject:keyName];
        
        [self compileOrderItems];
        
        NSLog(@"Sucessfully deleted %@", keyName);
        
        NSIndexSet *set = [[NSIndexSet alloc] initWithIndex:indexPath.section];
        
        NSArray   *rows = [[NSArray alloc] initWithObjects:indexPath, nil];
        
        numberPrice = [[NSNumber alloc] initWithFloat:orderPrice];
        
        [self.lblTotal setText:[formatter stringFromValue:numberPrice]];
        
        [self.tableView deleteRowsAtIndexPaths:rows withRowAnimation:UITableViewRowAnimationAutomatic];
        
        [self.tableView deleteSections:set withRowAnimation:UITableViewRowAnimationAutomatic];
        
        [self.tableView endUpdates];
        
        [self updateOrderCount];
        
        [self.tableView setEditing:NO animated:YES];
        
        [self.changeOrder setTitle:@"Edit Order" forState:UIControlStateNormal];
        
 
    }
    
}


-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CGFloat h =  25;
    if (section == 0 || [[categories objectAtIndex:section] isEqualToString:@"Footer"]){
        h = 44;
    }
    return h;
}


-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat h = 120;
    
    itemModel *item =   [orderItems objectForKey: [categories objectAtIndex:indexPath.section]];
    
    if (item.Title.length == 0){
        h = 0.0f;
    }
    
    return  h;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    
    NSString *message   = @"",
             *cellOrder = @"",
             *keyName   = @"",
             *options   = @"";
    
    itemModel *item = nil;

    
    NSArray *op = nil;
    @try {
        
        formatter = [NumberFormatter currencyFormatterWithDecimalDigitsCount:2];
        
        keyName = [categories objectAtIndex:indexPath.section];
        
        cell = [self.tableView dequeueReusableCellWithIdentifier:cellOrder];
        
        
        if (! cell){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                          reuseIdentifier:cellOrder];
        }
        
        [cell setAccessoryType:UITableViewCellAccessoryDetailButton];
        
        item = [orderItems objectForKey:keyName];
        
        if (item){
            if (item.Title.length > 0){
                [cell.textLabel setNumberOfLines:2];
                [cell.textLabel setTextColor:[UIColor blackColor]];
                
                [cell.detailTextLabel setFont:[UIFont systemFontOfSize:22.0]];
                
                [cell.textLabel setText:[NSString stringWithFormat:@"%@: %@, Price:%@",item.Quantity,item.Title,item.Price]];
            
                if (item.Image){
                    [cell.imageView setImage:item.Image];
                }
            
                if (item.Price && item.Quantity){
                    
                    orderPrice += [[item.Price stringByReplacingOccurrencesOfString:@"$" withString:@"" ] floatValue];
                    
                    numberPrice = [[NSNumber alloc] initWithFloat:orderPrice];
                    [cell.detailTextLabel setNumberOfLines:4];
                    [cell.detailTextLabel setTextColor:[UIColor colorWithHexString:@"800000"]];
                    [cell.detailTextLabel setFont:[UIFont systemFontOfSize:18.0]];
                    
                    if (item.options){
                        op = item.options;
                        options = [op componentsJoinedByString:@","];
                        
                    }
                    
                    [cell.detailTextLabel setText:[NSString stringWithFormat:@"%@",options]];
                    
                    [self.lblTotal setText:[formatter stringFromValue:numberPrice]];
                    
                }
            }
        }
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        if (message.length > 0){
            NSLog(@"%@",message);
        }
    }
    
    return cell;
}


-(void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    NSString *keyName  = [categories objectAtIndex:indexPath.section];
    
    itemModel *model = [orderItems objectForKey:keyName];
    
    UIAlertView *view = nil;
    NSArray  *op = nil;
    NSString *options;
    
    if (model){
        
        op = model.options;
        
        options = [op componentsJoinedByString:@","];
        
        view = [[UIAlertView alloc]
                    initWithTitle:model.Calories
                          message:options
                         delegate:nil
                cancelButtonTitle:@"Ok"
                otherButtonTitles:nil, nil];
        
        if (view){
            [view show];
        }
    }
    
    
}

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *keyName = [[categories objectAtIndex:section] uppercaseString];
    
    itemModel *item =   [orderItems objectForKey: [categories objectAtIndex:section]];
    
    if (item.Title.length == 0){
        keyName  =@"";
    }
    
    return keyName;
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

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger rows = 1;
    return    rows;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger sections = categories.count;
    return    sections;
}

 
- (IBAction)editOrder:(UIBarButtonItem *)sender {
    
    NSString *title = self.changeOrder.titleLabel.text;
    
    if ([title isEqualToString:@"Cancel Edit"]){
      [self.tableView setEditing:NO animated:YES];
      [self.changeOrder setTitle:@"Edit Order" forState:UIControlStateNormal];

        
    }else{
      [self.tableView setEditing:YES animated:YES];
     [self.changeOrder setTitle:@"Cancel Edit" forState:UIControlStateNormal];

    }
    
    
}

-(IBAction)changeOrder:(UIButton *)sender{
    [self editOrder:nil];
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if ([self.orderButton.titleLabel.text isEqualToString:@"Pay Bill"]){
     if (buttonIndex == 0){
         [appDelegate setIsPaid:YES];
         [self.orderButton setEnabled:NO];
         [self.orderButton setAlpha:0.6f];
     }
    }
    else{
    if (buttonIndex == 0){
        [appDelegate setIsSent:YES];
        [self.changeOrder setEnabled:NO];
        [self.changeOrder setAlpha:0.6f];
        [self.orderButton setTitle:@"Pay Bill" forState:UIControlStateNormal];
        NSIndexSet *set = [[NSIndexSet alloc] initWithIndex:0];
        [self.tableView reloadSections:set withRowAnimation:UITableViewRowAnimationAutomatic];
        
    }
    }
    
}

- (IBAction)placeOrder:(UIButton *)sender {
    
    UIAlertView *alert  = nil;
    if ([sender.titleLabel.text isEqualToString:@"Pay Bill"]){
        alert = [[UIAlertView alloc] initWithTitle:@"Pay Bill Confirmation"
                                           message:@"By clicking 'Ok' you will be paying for your order here"
                                          delegate:self
                                              cancelButtonTitle:@"Ok"
                                 otherButtonTitles:@"Cancel", nil];
    }else{
    
     alert = [[UIAlertView alloc] initWithTitle:@"Correct Order Confirmation"
                                                    message:@"By clicking 'Ok' your order will be sent to the kitchen for preparation"
                                                   delegate:self
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:@"Cancel", nil];
    }
    
    [alert show];
    
}


@end
