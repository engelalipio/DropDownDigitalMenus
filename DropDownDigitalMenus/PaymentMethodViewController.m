//
//  PaymentMethodViewController.m
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 2/10/15.
//  Copyright (c) 2015 Digital World International. All rights reserved.
//

#import "PaymentMethodViewController.h"
#import "AppDelegate.h"
#import "UIColor+ColorWithHexString.h"

@interface PaymentMethodViewController ()
{
    AppDelegate *appDelegate;
    int totalRows ;
    NSArray *months,
            *years;
    bool bCC,
         bGC;
    
    int selectedMonth,
        selectedYear;
}
@end

@implementation PaymentMethodViewController

@synthesize totalAmount = _totalAmount;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (! appDelegate){
        appDelegate = [AppDelegate currentDelegate];
    }
    if (![appDelegate isPaid]){
        totalRows = 6;
    }
   
    [self.addGiftCard.layer setCornerRadius:4.0f];
    [self.btnAddCard.layer setCornerRadius:4.0f];
    
    bCC = NO;
    bGC = NO;
    
   
    [self.txtCardName setDelegate:self];
    [self.txtCardSet1 setDelegate:self];
    [self.txtCardSet2 setDelegate:self];
    [self.txtCardSet3 setDelegate:self];
    [self.txtCardSet4 setDelegate:self];
    [self.txtGiftCard setDelegate:self];
    [self.pckDate setDelegate:self];
    [self.pckDate setDataSource:self];
    [self loadMonths];
}


-(void) loadMonths{
    if (! months){
        months = [[NSArray alloc] initWithObjects:@"January", @"February", @"March", @"April", @"May", @"June", @"July",
                                                  @"August",  @"September",@"October",@"November", @"December",nil];
    }
    
    if(! years){
        years = [[NSArray alloc] initWithObjects:@"2015",@"2016",@"2017", @"2018", @"2019", @"2020", nil];
    }
}

-(void) viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat h = 80.0f;
    
  switch (indexPath.row) {
      case 1:
          if (! bCC){
              h = 80.f;
          }else{
              h = 0;
          }
          break;
        case 2:
            if (! bCC){
                h = 0;
            }else{
                h = 150;
                
            }
          break;
      case 3:
          if (! bGC){
              h = 80.f;
          }else{
              h = 0;
          }
          break;
        case 4:
            if (! bGC){
                h = 0;
            }else{
                h = 100;
            }
            break;
        default:
            h = 80.0f;
            break;
    }
    
 
    return h;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger rows = totalRows;
    
       return rows;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger sections = 1;
 
    return sections;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *fCell = [tableView cellForRowAtIndexPath:indexPath],
                    *tCell = nil,
                    *iCell = nil,
                    *jCell = nil;
    
    if (fCell){
       
        if (fCell.accessoryType == UITableViewCellAccessoryCheckmark){
            
            NSString *strMessage  = [NSString stringWithFormat:@"Press OK to pay %@ using %@",self.totalAmount, fCell.textLabel.text];
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Payment Order Confirmation"
                                                            message:strMessage
                                                           delegate:self
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:@"Cancel", nil];
            [alert show];
            
            
        }
        
        if (fCell.accessoryType != UITableViewCellAccessoryNone){
            return;
        }
    }
    
    NSIndexPath *fPath = nil,
                *tPath = nil,
                *iPath = nil,
                *jPath = nil;
    
    NSArray *aPath = nil;
 
 
    if (indexPath.row == 1){
        bCC = YES;
 
 
        fPath = indexPath;
        tPath = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:indexPath.section];
        
        iPath = [NSIndexPath indexPathForRow:indexPath.row + 2 inSection:indexPath.section];
        jPath = [NSIndexPath indexPathForRow:indexPath.row + 3 inSection:indexPath.section];
        
        aPath = [[NSArray alloc] initWithObjects:fPath,tPath, nil];
        tCell = [tableView cellForRowAtIndexPath:tPath];
        iCell = [tableView cellForRowAtIndexPath:iPath];
        jCell = [tableView cellForRowAtIndexPath:jPath];
    }
 
    if (indexPath.row == 3){
        bGC = YES;
 
        fPath = indexPath;
        
        iPath = [NSIndexPath indexPathForRow:indexPath.row - 1 inSection:indexPath.section];
        jPath = [NSIndexPath indexPathForRow:indexPath.row - 2 inSection:indexPath.section];
  
        tPath = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:indexPath.section];
        aPath = [[NSArray alloc] initWithObjects:fPath,tPath, nil];
        
        tCell = [tableView cellForRowAtIndexPath:tPath];
        iCell = [tableView cellForRowAtIndexPath:iPath];
        jCell = [tableView cellForRowAtIndexPath:jPath];
    }
 
    [self.tableView beginUpdates];
    
    [self.tableView moveRowAtIndexPath:fPath toIndexPath:tPath];
    
    
    [fCell setHidden:YES];
    [tCell setHidden:NO];
    
    /*if (bCC && indexPath.row == 3){
        [self.tableView moveRowAtIndexPath:jPath toIndexPath:iPath];
   
        if (iCell.layer.frame.size.height == 60){
            [iCell setHidden:NO];
        }
        
        if (jCell.layer.frame.size.height > 60){
        [jCell setHidden:YES];
        }
        bCC = NO;
    }
    
    if (bGC && indexPath.row == 1){
        [self.tableView moveRowAtIndexPath:iPath toIndexPath:jPath];
        
        if (iCell.layer.frame.size.height > 60){
            [iCell setHidden:YES];
        }
        
        if (jCell.layer.frame.size.height == 60){
        [jCell setHidden:NO];
         }
        bGC = NO;
        
    }*/

    [self.tableView endUpdates];
    [self.tableView reloadData];
}


-(UIView*) pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel *lblPicker = nil;
    
    NSString *title = @"";
    
    switch (component) {
        case 0:
            lblPicker = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 200.0f, 30.0f)];
            title = [months objectAtIndex:row];
            break;
            
        case 1:
            lblPicker = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 50.0f, 30.0f)];
            title = [years objectAtIndex:row];
            break;
    }
    [lblPicker setTextAlignment:NSTextAlignmentCenter];
    [lblPicker setText:title];
    return lblPicker;
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSInteger rows = 0;
    switch (component) {
        case 0:
            rows = [months count];
            break;
            
        case 1:
            rows = [years count];
            break;
    }
    return rows;
}

-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
 
    switch (component) {
        case 0:
            
            selectedMonth = row++;
            
            
            break;
            
        case 1:
            
            selectedYear = [[years objectAtIndex:row] intValue];
            
            break;
    }
    
}

-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    NSInteger sections = 2;
    
    return sections;
}

-(CGFloat) pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 25;
}

-(CGFloat) pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    int w = 0;
    
    switch (component) {
        case 0:
            w = 200;
            break;
            
        case 1:
            w = 50;
            
            break;
    }
    return w;
}


-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    BOOL result = NO;
    

    NSInteger nextTag = textField.tag + 1;
    // Try to find next responder
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        // Found next responder, so set it.
        [nextResponder becomeFirstResponder];
    } else {
        // Not found, so remove keyboard.
        [textField resignFirstResponder];
    }
        
    
    
    result =   [textField resignFirstResponder];
    
    return result;
}



- (IBAction)actionCancel:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)actionAddCard:(UIButton *)sender {
    
    
    NSIndexPath *iPath = [NSIndexPath indexPathForRow:1 inSection:0],
                *fPath = nil,
                *tPath = nil;
    
    NSArray *aPath = nil;
    
    UITableViewCell *fCell = nil,
                    *tCell = nil;
    
    
    if (self.txtCardName.text.length == 0 ||
       (self.txtCardSet1.text.length == 0 || self.txtCardSet2.text.length == 0 || self.txtCardSet3.text.length == 0 || self.txtCardSet4.text.length == 0))
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Credit Card Information" message:@"Missing Credit Card Information" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
 
    if (iPath){
        fPath = iPath;
        tPath = [NSIndexPath indexPathForRow:iPath.row + 1 inSection:iPath.section];
        aPath = [[NSArray alloc] initWithObjects:fPath,tPath, nil];
        fCell = [self.tableView cellForRowAtIndexPath:fPath];
        tCell = [self.tableView cellForRowAtIndexPath:tPath];
    }
    
    [self.tableView beginUpdates];
    [self.tableView moveRowAtIndexPath:fPath toIndexPath:tPath];
    
    [fCell.textLabel setText:[NSString stringWithFormat:@"%@ XXXX-%@", self.txtCardName.text.uppercaseString,self.txtCardSet4.text ]];
    [fCell.detailTextLabel setText:@"Select to pay your order with this credit card"];
    [fCell setAccessoryType:UITableViewCellAccessoryCheckmark];
    [fCell setHidden:NO];
    
    [tCell setHidden:YES];
     bCC = NO;
  
    [self.tableView endUpdates];
    [self.tableView reloadData];

    
}

- (IBAction)actionAddGiftCard:(UIButton *)sender {
    
    NSIndexPath *iPath = [NSIndexPath indexPathForRow:3 inSection:0],
                *fPath = nil,
                *tPath = nil;
    
    NSArray *aPath = nil;
    
    UITableViewCell *fCell = nil,
                    *tCell = nil;
    
    
    if (self.txtGiftCard.text.length == 0 )
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Gift Card Information"
                                                        message:@"Missing Gift Card Information"
                                                       delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    
    if (iPath){
        fPath = iPath;
        tPath = [NSIndexPath indexPathForRow:iPath.row + 1 inSection:iPath.section];
        aPath = [[NSArray alloc] initWithObjects:fPath,tPath, nil];
        fCell = [self.tableView cellForRowAtIndexPath:fPath];
        tCell = [self.tableView cellForRowAtIndexPath:tPath];
    }
    
    [self.tableView beginUpdates];
    [self.tableView moveRowAtIndexPath:fPath toIndexPath:tPath];
    
    [fCell.textLabel setText:[NSString stringWithFormat:@"%@", self.txtGiftCard.text.uppercaseString]];
    [fCell.detailTextLabel setText:@"Select to pay your order with this gift card"];
    [fCell setAccessoryType:UITableViewCellAccessoryCheckmark];
    [fCell setHidden:NO];
    
    [tCell setHidden:YES];
    bGC = NO;
    
    [self.tableView endUpdates];
    [self.tableView reloadData];

    
}


-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
 
        if (buttonIndex == 0){
            [appDelegate setIsPaid:YES];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    
}



@end
