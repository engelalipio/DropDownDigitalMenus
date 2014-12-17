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

@interface OrderViewController(){
    AppDelegate         *appDelegate;
    NSMutableArray      *categories;
    NSMutableDictionary *orderItems;
}

@end

@implementation OrderViewController

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self compileOrderItems];
    [self.tableView reloadData];
}

-(void) viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

-(void) viewDidLoad{
    [super viewDidLoad];
    if (! appDelegate){
        appDelegate = [AppDelegate currentDelegate];
    }
    [self initTableView];
    //[self compileOrderItems];
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
    
    NSArray *items    = nil;
    
    @try{
        
        
            categories = [[NSMutableArray alloc] init];
       
            orderItems = [[NSMutableDictionary alloc] init];
        
        for (int iKey = 0; iKey < 6 ; iKey++) {
            
        
            switch (iKey) {
                case 0:
                    keyName = @"Beverages";
                
                    drinks = [appDelegate.drinkItems objectForKey:keyName];
                    if (drinks){
                        [categories addObject:keyName];
                        [orderItems setObject:drinks forKey:keyName];
                    }
                break;
                case 1:
                    keyName = @"Appetizers";
                    apps = [appDelegate.appItems objectForKey:keyName];
                    if (apps){
                        [categories addObject:keyName];
                        [orderItems setObject:apps forKey:keyName];
                    }
                break;
                case 2:
                    keyName = @"Soups";
                    soups = [appDelegate.soupItems objectForKey:keyName];
                    if (soups){
                        [categories addObject:keyName];
                        [orderItems setObject:soups forKey:keyName];
                    }
                break;
                case 3:
                    keyName = @"Salads";
                    salads = [appDelegate.saladItems objectForKey:keyName];
                    if (salads){
                        [categories addObject:keyName];
                        [orderItems setObject:salads forKey:keyName];
                    }
                break;

                case 4:
                    keyName = @"Entrees";
                    entrees = [appDelegate.entreeItems objectForKey:keyName];
                    if (entrees){
                        [categories addObject:keyName];
                        [orderItems setObject:entrees forKey:keyName];
                    }
                break;
                case 5:
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

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger section = -1;
    
    section = [indexPath section];
    
    NSString *keyName = [categories objectAtIndex:section];
    
    if (editingStyle == UITableViewCellEditingStyleDelete){
        [self.tableView beginUpdates];
        
       // NSArray *rows = [[NSArray alloc] initWithObjects:indexPath, nil];
        
        NSIndexSet *set = [[NSIndexSet alloc] initWithIndex:indexPath.section];
        [self.tableView deleteSections:set withRowAnimation:UITableViewRowAnimationAutomatic];
        //[self.tableView deleteRowsAtIndexPaths:rows withRowAnimation:UITableViewRowAnimationAutomatic];
        
        [orderItems removeObjectForKey:keyName];
        
        [self.tableView endUpdates];
        
        [self.tableView setEditing:NO animated:YES];
        
       [self.tableView reloadData];
    }
    
}


-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CGFloat h =  25;
    
    /*itemModel *item =   [orderItems objectForKey: [categories objectAtIndex:section]];
    
    if (item.Title.length == 0){
        h = 0.0f;
    }*/
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
             *keyName   = @"";
    
    itemModel *item = nil;
    
    @try {
        
        
        keyName = [categories objectAtIndex:indexPath.section];
        
        item = [orderItems objectForKey:keyName];
        
        cell = [self.tableView dequeueReusableCellWithIdentifier:cellOrder];
        
        if (! cell){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                          reuseIdentifier:cellOrder];
        }
        
        if (item.Title.length > 0){
            [cell.textLabel setTextColor:[UIColor colorWithHexString:@"804000"]];
            [cell.textLabel setText:item.Title];
            
            if (item.Image){
                [cell.imageView setImage:item.Image];
            }
            
            if (item.Price && item.Quantity){
                [cell.detailTextLabel setTextColor:[UIColor colorWithHexString:@"800000"]];
                [cell.detailTextLabel setText:[NSString stringWithFormat:@"Quantity: %@, Price: %@",item.Price,item.Quantity]];
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
    
    [self.tableView setEditing:YES animated:YES];
    
}

- (IBAction)placeOrder:(UIButton *)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Send Order Confirmation" message:@"This will send your order for preparation" delegate:self
                                          cancelButtonTitle:@"Ok" otherButtonTitles:@"Cancel", nil];
    
    [alert show];
    
}

- (IBAction)payOrder:(UIButton *)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Pay Order Confirmation" message:@"This will place and pay for your meal" delegate:self
                                          cancelButtonTitle:@"Ok" otherButtonTitles:@"Cancel", nil];
    
    [alert show];
    
}
@end
