//
//  SoupsViewController.m
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 11/20/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import "SoupsViewController.h"
#import "Constants.h"

@implementation SoupsViewController



-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger sectionCount = 1  ;
    return sectionCount;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger rowCount = 1;
    
    switch (section) {
        case 0:
            rowCount = 2;
            break;
            
    }
    return rowCount;
}

@end
