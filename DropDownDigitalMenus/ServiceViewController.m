//
//  FirstViewController.m
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 10/22/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import "ServiceViewController.h"
#import "ContainerTableCellTableViewCell.h"
#import "PaymentMethodViewController.h"
#import "OrderViewController.h"
#import "Constants.h"
#import "AppDelegate.h"

@interface ServiceViewController ()
{
    NSArray *categorySections;
    NSMutableDictionary *categoryData;
    AppDelegate *appDelegate;
}
-(void) initTableView;
-(void) checkSettings;
@end

@implementation ServiceViewController


-(void) checkSettings{
    
    
    NSString *message = @"";
    
    @try{
        
        
        [self.lblBillStatus  setText:@"Bill Status: Not Paid"];
        [self.lblOrderStatus setText:@"Order Status: Not Sent"];
        
        if (appDelegate.isSent){
            [self.lblOrderStatus setText:@"Your order has been sent to the kitchen for preparation."];
        }
        
        if (appDelegate.isPaid){
            [self.lblBillStatus setText:@"Your order has been paid, we appreciate your business."];
            [self.btnRequestBill setEnabled:NO];
            [self.btnRequestBill setAlpha:0.6f];
        }else{
            [self.btnRequestBill setEnabled:YES];
            [self.btnRequestBill setAlpha:1];
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

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self checkSettings];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (! appDelegate){
        appDelegate = [AppDelegate currentDelegate];
    }
    
    [self initTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    NSInteger sections = 1;
    
    if (categorySections){
        // sections = [categorySections count];
    }
    
    return sections;
}


- (IBAction)actionRequestBill:(UIButton *)sender {

    [self.tabBarController setSelectedIndex:kOrderTabItemIndex];

}

- (IBAction)actionCallWaiter:(UIButton *)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Call Waiter Confirmation"
                                                    message:@"Are you sure you want to call your server?"
                                                   delegate:self
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:@"Cancel", nil];
    
    [alert show];
}
@end
