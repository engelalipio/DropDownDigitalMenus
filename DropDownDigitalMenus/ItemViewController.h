//
//  ItemViewController.h
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 11/9/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

typedef enum {
   Beverage  = 0,
   Appetizer = 1,
   Soups     = 2,
   Salads    = 3,
   Entrees   = 4,
   Desserts  = 5
} FoodType;

typedef enum {
    Beef = 0,
    Chicken = 1,
    Seafood = 2,
    Pasta   = 3
} EntreeType;

@interface ItemViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) IBOutlet UILabel *labelDescription;
@property (strong, nonatomic) IBOutlet UILabel *labelPrice;
@property (strong, nonatomic) IBOutlet UILabel *labelQuantity;
@property (strong, nonatomic) IBOutlet UIStepper *itemStepper;
@property (strong, nonatomic) IBOutlet UIButton *addToOrderButton;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UILabel *labelTitle;
@property (assign, nonatomic) FoodType foodType;
@property (assign, nonatomic) EntreeType entreeType;
@property (strong, nonatomic) IBOutlet UISegmentedControl *steakSeg;

@property (strong, nonatomic) IBOutlet UISegmentedControl *pastaSeg;

@property (strong, nonatomic) IBOutlet UISegmentedControl *sauceTypeSeg;
@property (strong, nonatomic) IBOutlet UISegmentedControl *sidesSeg;
@property (strong, nonatomic) IBOutlet UISegmentedControl *sweetSeg;
@property (strong, nonatomic) IBOutlet UISegmentedControl *dressingTypeSeg;
@property (strong, nonatomic) IBOutlet UISegmentedControl *cheeseTypeSeg;

@property (strong, nonatomic) IBOutlet UISegmentedControl *glutenSeg;

- (IBAction)cancelOrder:(UIButton *)sender;

- (IBAction)addToOrderAction:(UIButton *)sender;

- (IBAction)stepperAction:(UIStepper *)sender;

-(void) configureSegs;

@end
