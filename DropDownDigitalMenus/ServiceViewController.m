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



#pragma mark - TableView Events

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *sectionData = [categorySections objectAtIndex:section];
    NSString *header = [sectionData objectForKey:@"description"];
    return header;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20.0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200.0;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *message   = @"",
             *imageName = @"";
    
    ContainerTableCellTableViewCell *cell = nil;
    
    @try {
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"ContainerTableCell"];
        
        NSDictionary *cellData = [categorySections objectAtIndex:[indexPath section]];  // Note we're using section, not row here
        NSArray *articleData = [cellData objectForKey:@"items"];
        
        /*imageName = [articleData objectAtIndex:0];
         
         [cell.imageView setImage:[UIImage imageNamed:imageName]];*/
        
        [cell setCollectionData:articleData];
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        if ([message length] > 0){
            NSLog(@"%@",message);
        }
        message = @"";
    }
    
    return cell;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger rows = 1;
    
    return rows;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger sections = 1;
    
    if (categorySections){
        // sections = [categorySections count];
    }
    
    return sections;
}

@end
