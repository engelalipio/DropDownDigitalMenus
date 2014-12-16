//
//  OrderViewController.m
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 11/10/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import "OrderViewController.h"
#import "Constants.h"
#import "AppDelegate.h"
#import "itemModel.h"

@interface OrderViewController(){
    AppDelegate *appDelegate;
    NSMutableArray *orderCategories;
    NSMutableDictionary *orderItems;
}
-(void) initOrders;
-(void) initTableView;
@end

@implementation OrderViewController


-(void) viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    appDelegate = nil;
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if (! appDelegate){
        appDelegate = [AppDelegate currentDelegate];
    }

    
    [self initOrders];
    [self initTableView];
    
}

-(void) viewDidLoad{
    [super viewDidLoad];
    


}

-(void) initOrders{
    
 
    NSString *keyName = @"";
    
    itemModel *item = nil;
    
    
    if (! orderCategories){
        orderCategories = [[NSMutableArray alloc] initWithObjects:@"Beverages", @"Appetizers", @"Soups",
                                                                  @"Salads", @"Entrees",@"Desserts", nil];
    }
    
    
    if (!orderItems){
        orderItems = [[NSMutableDictionary alloc] initWithCapacity:orderCategories.count];
    
    }
    
    for (int kIndex  = 0; kIndex < orderCategories.count; kIndex++) {
       
        keyName = [orderCategories objectAtIndex:kIndex];
        switch (kIndex) {
            case 0:
                item = [appDelegate.drinkItems objectForKey:keyName];
                break;
                
            case 1:
                item = [appDelegate.appItems objectForKey:keyName];
                break;
            case 2:
                item = [appDelegate.soupItems objectForKey:keyName];
                break;
            case 3:
                item = [appDelegate.saladItems objectForKey:keyName];
                break;
            case 4:
                item = [appDelegate.entreeItems objectForKey:keyName];
                break;
            case 5:
                item = [appDelegate.dessertItems objectForKey:keyName];
                break;
        }

        
        if (! item){
           item = [[itemModel alloc] init];
            [item setImage:[UIImage imageNamed:@"Icon-120.png"]];
            [item setTitle:@""];
            [item setDescription:@""];
            [item setPrice:@""];
            [item setQuantity:@""];
        }
        
        [orderItems setValue:item forKey:keyName];
    }
    [self.tableView reloadData];
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


-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat h = CGFLOAT_MIN;
    
    NSString *keyName = [orderCategories objectAtIndex:[indexPath section]];
    
    itemModel *item = [orderItems objectForKey:keyName];
    
    if (item){
        if (item.Title.length > 0){
            h = 100;
        }
    }
    return h;
}
 

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *title = [orderCategories objectAtIndex:section];
    return [title uppercaseString];
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

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    
    NSInteger section = indexPath.section,
              row     = indexPath.row;
    
    NSString *keyName = [orderCategories objectAtIndex:section],
             *title   = @"",
             *desc    = @"",
             *quantity = @"";
    
    NSString  *price = nil;
    UIImage *image = nil;
    
    itemModel *item = [orderItems objectForKey:keyName];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"orderCell"];
    
    if (item){
        
       //@"Title",@"Description", @"Price", @"Quantity", @"Image"
        
        if ([item.Title length] > 0){
            
            title = item.Title;
            
            [cell.textLabel setTextColor:[UIColor colorWithHexString:@"804000"]];
            [cell.textLabel setText:title];
            
            if (item.Image != nil){
                image = item.Image;
            }
            
            if (image){
                [cell.imageView setImage:image];
            }
        }


        if ([item.Description length] > 0){
            desc = item.Description;
        }
        
        if ([item.Price length] > 0){
            price = item.Price;
        }
        
        if ([item.Quantity length] > 0){
            quantity = item.Quantity;
        }
        
        if (price.length > 0 && quantity.length > 0){
            [cell.detailTextLabel setTextColor:[UIColor colorWithHexString:@"800000"]];
            [cell.detailTextLabel setText:[NSString stringWithFormat:@"Unit Price: %@, Quantity: %@",price,quantity]];
        }
        


    }
    
    return cell;
    
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger rows = 0;

    NSString *keyName = [orderCategories objectAtIndex:section];
    
    NSMutableDictionary *dict = [orderItems objectForKey:keyName];
    
    if (dict){
        rows = 1;
    }
   return rows;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger sections = orderCategories.count;

    return sections;
}



 
-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger section = -1;
    
    section = [indexPath section];
    
    NSString *keyName = [orderCategories objectAtIndex:section];
    
    itemModel *item = [orderItems objectForKey:keyName];
    
 
    if (editingStyle == UITableViewCellEditingStyleDelete){
        [self.tableView beginUpdates];
        
        NSArray *rows = [[NSArray alloc] initWithObjects:indexPath, nil];
        
        
        [self.tableView deleteRowsAtIndexPaths:rows withRowAnimation:UITableViewRowAnimationAutomatic];
        
        [orderItems removeObjectForKey:keyName];
        
        [self.tableView endUpdates];
        
        [self.tableView setEditing:NO animated:YES];
        
        [self.tableView reloadData];
    }
    
}
- (IBAction)editOrder:(UIBarButtonItem *)sender {
    
    /*UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Change Order Confirmation" message:@"This will change your order" delegate:self
                                          cancelButtonTitle:@"Ok" otherButtonTitles:@"Cancel", nil];
    
    [alert show];*/
    
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
