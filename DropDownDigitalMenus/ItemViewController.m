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
#import "itemModel.h"

@interface ItemViewController ()
{
    float originalPrice;
    NSString *originalDesc;
    AppDelegate *appDelegate;
}
-(void) configureView;

@end

@implementation ItemViewController

@synthesize foodType = _foodType;
@synthesize entreeType = _entreeType;

-(void) configureView{
    
    CGRect imageRect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
    [self.imageView setFrame:imageRect];

}

-(void) setDrinkOptionsVisible:(BOOL) display{
    
    NSString *title = self.labelTitle.text;
    NSRange  range;
    BOOL hide = YES;
    
    [self.iceSeg setHidden:hide];
    [self.sweetSeg setHidden:hide];
    
    hide = (display ? NO : YES);
    
    [self.iceSeg setHidden:hide];
    
    if (! hide){
        range = [title rangeOfString:@"TEA"];
        if (range.location != NSNotFound){
         [self.sweetSeg setHidden:hide];
        }
    }

}

-(void)addCalories{
    NSString *cal  =  @"%d calories";
    
    NSInteger calories =  arc4random_uniform(450);
    
    cal = [NSString stringWithFormat:cal,calories];
    [self.labelCalories setTextColor:[UIColor whiteColor]];
    [self.labelCalories setText:cal];
    
}

-(void)setAppsVisible:(BOOL) display{
    [self.glutenSeg setHidden:! display];
    //[self.sauceTypeSeg setHidden:! display];
}

-(void)setSoupsVisible:(BOOL) display{
    [self.glutenSeg setHidden:! display];
    [self.cheeseTypeSeg setHidden:! display];
}

-(void)setSaladsVisible:(BOOL) display{
    [self.dressingTypeSeg setHidden:! display];
    [self.cheeseTypeSeg setHidden:! display];
    [self.glutenSeg setHidden:! display];
}

-(void) setMeatsVisible:(BOOL) display{
    [self.steakSeg setHidden:! display];
    [self.cheeseTypeSeg setHidden:! display];
    [self.sidesSeg setHidden:! display];
}

-(void)setChickensVisible:(BOOL) display{
    [self.sauceTypeSeg setHidden:! display];
    [self.sidesSeg setHidden:! display];
}

-(void)setSeaFoodsVisible:(BOOL) display{
    [self.sauceTypeSeg setHidden:! display];
    [self.sidesSeg setHidden:! display];
}

-(void) setPastasVisible:(BOOL) display{
    [self.pastaSeg setHidden:! display];
    [self.glutenSeg setHidden:! display];
    [self.sauceTypeSeg setHidden:! display];
    [self.sidesSeg setHidden:! display];
    [self.cheeseTypeSeg setHidden:! display];
}

-(void) setDesserts:(BOOL) display{
    [self.glutenSeg setHidden:! display];
}

-(void) configureSegs{
    
    [self setDrinkOptionsVisible:NO];
    [self setAppsVisible:NO];
    [self setSoupsVisible:NO];
    [self setSaladsVisible:NO];
    [self setMeatsVisible:NO];
    [self setChickensVisible:NO];
    [self setSeaFoodsVisible:NO];
    [self setDesserts:NO];

    switch (self.foodType) {
        case Beverage:
            [self setDrinkOptionsVisible:YES];
            break;
        case Appetizer:
            [self setAppsVisible:YES];
            break;
        case Soups:
            [self setSoupsVisible:YES];
            break;
        case Salads:
            [self setSaladsVisible:YES];
            break;
        case Entrees:
            
            switch (self.entreeType) {
                case Beef:
                    [self setMeatsVisible:YES];
                    break;
                case Chicken:
                    [self setChickensVisible:YES];
                    break;
                case Seafood:
                    [self setSeaFoodsVisible:YES];
                    break;
                case Pasta:
                    [self setPastasVisible:YES];
                    break;
            }
            
            break;
        case Desserts:
            [self setDesserts:YES];
            break;
    }
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
    [self configureSegs];
    [self extractOriginalPrice];
    [self addCalories];
}

-(void) viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    [self setDrinkOptionsVisible:NO];
    [self setAppsVisible:NO];
    [self setSoupsVisible:NO];
    [self setSaladsVisible:NO];
    [self setMeatsVisible:NO];
    [self setChickensVisible:NO];
    [self setSeaFoodsVisible:NO];
    [self setDesserts:NO];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   
}


- (IBAction)cancelOrder:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)addToOrderAction:(UIButton *)sender {
    
    NSString *message   = @"";
    
    NSInteger orderItems = 0,
              quantity   = 0;
    
    NSMutableDictionary *items = nil;
    
    itemModel *currentItem = nil;
    
    @try {
        
        orderItems = [appDelegate currentOrderItems];
        
        quantity   =  [self.labelQuantity.text integerValue];
        if (! orderItems){
            orderItems =  quantity;
        }else{
            orderItems = orderItems + quantity ;
        }
        message = [NSString stringWithFormat:@"%d order item(s)", orderItems];
    
        currentItem = [[itemModel alloc] init];
        
        [currentItem setTitle:self.labelTitle.text];
        [currentItem setDescription:self.labelDescription.text];
        [currentItem setPrice:self.labelPrice.text];
        [currentItem setQuantity:self.labelQuantity.text];
        [currentItem setImage:self.imageView.image];
        
        items = [[NSMutableDictionary alloc] init];
        
        switch (self.foodType) {
            case Beverage:
                [currentItem setCategory:@"Beverages"];
                [items  setValue:currentItem forKey:currentItem.Category];
                [appDelegate setDrinkItems:items];
                break;
            case Appetizer:
                [currentItem setCategory:@"Appetizers"];
                [items  setValue:currentItem forKey:currentItem.Category];
                [appDelegate setAppItems:items];
                break;
            case Soups:
                [currentItem setCategory:@"Soups"];
                [items  setValue:currentItem forKey:currentItem.Category];
                [appDelegate setSoupItems:items];
                break;
            case Salads:
                [currentItem setCategory:@"Salads"];
                 [items  setValue:currentItem forKey:currentItem.Category];
                [appDelegate setSaladItems:items];
                break;
            case Entrees:
                [currentItem setCategory:@"Entrees"];
                [items  setValue:currentItem forKey:currentItem.Category];
                [appDelegate setEntreeItems:items];
                break;
            case Desserts:
                [currentItem setCategory:@"Desserts"];
                
                [items  setValue:currentItem forKey:currentItem.Category];
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
        originalDesc  = self.labelDescription.text;
        
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
