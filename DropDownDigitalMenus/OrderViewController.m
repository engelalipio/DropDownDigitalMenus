//
//  OrderViewController.m
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 11/10/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import "OrderViewController.h"

@implementation OrderViewController


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
