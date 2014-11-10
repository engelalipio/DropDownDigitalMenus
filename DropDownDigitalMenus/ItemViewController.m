//
//  ItemViewController.m
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 11/9/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import "ItemViewController.h"

@interface ItemViewController ()
-(void) configureView;
@end

@implementation ItemViewController

-(void) configureView{
    
    CGRect imageRect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
    
    [self.imageView setFrame:imageRect];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
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

- (IBAction)addToOrderAction:(UIButton *)sender {
    
    NSString *message  = @"";
    
    @try {
    
        [self dismissViewControllerAnimated:YES completion:nil];
    
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        
    }
    
}

- (IBAction)stepperAction:(UIStepper *)sender {
    
    NSString *message  = @"";
    int quantity    = 0;
    @try {
        
        
        quantity = self.itemStepper.value;
        
        
        if (quantity <= 0){
            quantity = 0;
        }
        
        [self.labelQuantity setText:[NSString stringWithFormat:@"%d",quantity]];
        
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        
    }
    
}
@end
