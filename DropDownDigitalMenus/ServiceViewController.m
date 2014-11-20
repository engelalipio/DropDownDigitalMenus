//
//  FirstViewController.m
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 10/22/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import "ServiceViewController.h"
#import "ContainerTableCellTableViewCell.h"

@interface ServiceViewController ()
{
    NSArray *categorySections;
    NSMutableDictionary *categoryData;
}
@end

@implementation ServiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger rows = 1;
    
    return rows;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger sections = 2;
    
    if (categorySections){
        // sections = [categorySections count];
    }
    
    return sections;
}

- (IBAction)pageServer:(UIButton *)sender {
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Page Server Confirmation" message:@"Are you sure you want to page your server?" delegate:self
                                          cancelButtonTitle:@"Ok" otherButtonTitles:@"Cancel", nil];
    
    [alert show];
}
@end
