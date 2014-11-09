//
//  MenuDetailViewController.m
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 11/5/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import "MenuDetailViewController.h"
#import "Constants.h"

@interface MenuDetailViewController ()
{
    NSMutableArray *menuTitles;
}

@end

@implementation MenuDetailViewController


#pragma -mark Table View Events



-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger sectionCount = 3  ;
    // @"Drinks",@"Salads and Sides", @"Meats", @"Desserts"
    return sectionCount;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger rowCount = 1;
    // @"Drinks",@"Salads and Sides", @"Meats", @"Desserts"
    switch (section) {
     case 0:
            rowCount = 3;
     break;
     case 1:
            rowCount = 2;
     break;
     case 2:
            rowCount = 3;
     break;
    
     }
    return rowCount;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self roundLabel];
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

@end
