//
//  OrderViewController.m
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 11/10/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import "OrderViewController.h"
#import "Constants.h"

@implementation OrderViewController

-(void) viewDidLoad{
    [super viewDidLoad];
    [self initTableView];
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
    
    return rows;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger sections = 5;
 
    
    return sections;
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
 
    
    [tableView setEditing:NO animated:YES];
}

-(void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

 
-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (IBAction)changeOrder:(UIButton *)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Change Order Confirmation" message:@"This will change your order" delegate:self
                                          cancelButtonTitle:@"Ok" otherButtonTitles:@"Cancel", nil];
    
    [alert show];
    
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
