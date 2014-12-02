//
//  ItemViewController.m
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 11/9/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//
#import "Constants.h"
#import "ItemViewController.h"
#import "NumberFormatter.h"
#import "AppDelegate.h"
#import "AppetizersViewController.h"
#import "MeatDetailViewController.h"

@interface ItemViewController ()
{
    float originalPrice;
    AppDelegate *appDelegate;
}
-(void) configureView;
@end

@implementation ItemViewController

@synthesize foodType = _foodType;

-(void) configureView{
    
    CGRect imageRect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
    
    //[self.imageView setImage:[UIImage imageNamed:@"wine_glass-512.png"]];
    [self.imageView setFrame:imageRect];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    originalPrice = 0.0f;
    [self.itemStepper setValue:1];
    
    if (! appDelegate){
        appDelegate = [AppDelegate currentDelegate];
    }
    
    // Do any additional setup after loading the view from its nib.
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self extractOriginalPrice];
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


- (IBAction)cancelOrder:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)addToOrderAction:(UIButton *)sender {
    
    NSString *message   = @"";
    
    NSInteger orderItems = 0,
              quantity   = 0;
    
    NSMutableDictionary *items = nil;
    
    NSArray *keys = nil,
            *values = nil;
    
    @try {
        
        orderItems = [appDelegate currentOrderItems];
        
        quantity =  [self.labelQuantity.text integerValue];
        if (! orderItems){
            orderItems =  quantity;
        }else{
            orderItems = orderItems + quantity ;
        }
        message = [NSString stringWithFormat:@"%d order item(s)", orderItems];
        
        keys = [[NSArray alloc] initWithObjects:@"Title",@"Description", @"Price", @"Quantity", @"Image", nil];
        
        values = [[NSArray alloc] initWithObjects:self.labelTitle.text,self.labelDescription.text,
                  self.labelPrice.text,self.labelQuantity.text, self.imageView.image, nil];
        
        items = [[NSMutableDictionary alloc] initWithObjects:values forKeys:keys];
        
        
        switch (self.foodType) {
            case Beverage:
                [appDelegate setDrinkItems:items];
                break;
            case Appetizer:
                [appDelegate setAppItems:items];
                break;
            case Soups:
                [appDelegate setSoupItems:items];
                break;
            case Salads:
                [appDelegate setSaladItems:items];
                break;
            case Entrees:
                [appDelegate setEntreeItems:items];
                break;
            case Desserts:
                [appDelegate setDessertItems:items];
                break;
        }
        
        
        [appDelegate setCurrentOrderItems:orderItems];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        
        orderItems = 0;
        if ([message length] > 0){
            NSLog(@"%@",message);
        }
        message = @"";
    }
    
}

-(void) extractOriginalPrice{
    
    NSString *message  = @"";
    
    float    price     = 0.0f;
    
    NSRange range ;
    @try {
        
    
        range = [self.labelPrice.text rangeOfString:@"$"];
        
        if ( range.location != NSNotFound){
            price = [[self.labelPrice.text substringFromIndex:1] floatValue];
        }
        
        originalPrice = price;
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        message = @"";
        price   = 0.0f;
    }
    
}

- (IBAction)stepperAction:(UIStepper *)sender {
    
    NSString *message    = @"";
    
    int   quantity       = 1;
    
    float price          = 0;
    
    NSRange range ;
    
    NumberFormatter *formatter = nil;
    
    NSNumber *numberPrice = nil;
    
    @try {
        
        if (originalPrice == 0.0f){
            [self extractOriginalPrice];
        }
    
        
        quantity = self.itemStepper.value;
    
        range = [self.labelPrice.text rangeOfString:@"$"];
        
        if ( range.location != NSNotFound){
            price = [[self.labelPrice.text substringFromIndex:1] floatValue];
            
        }
        
        if (quantity <= 0){
            quantity = 1;
        }
        
        price = originalPrice * quantity;
        
        [self.labelQuantity setText:[NSString stringWithFormat:@"%d",quantity]];
        
        formatter = [NumberFormatter currencyFormatterWithDecimalDigitsCount:2];
        
        numberPrice =  [[NSNumber alloc] initWithFloat:price];
        
        [self.labelPrice setText:[formatter stringFromValue:numberPrice]];
        
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        
    }
    
}
@end
