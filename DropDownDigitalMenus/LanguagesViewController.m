//
//  LanguagesViewController.m
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 12/12/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import "LanguagesViewController.h"
#import "Constants.h"

@interface LanguagesViewController(){
    NSArray *languages;
}
-(void) initLanguages;
-(void) initTableView;

@end

@implementation LanguagesViewController



-(void) viewDidLoad{
    [super viewDidLoad];
    [self initLanguages];
    [self initTableView];
}


-(void) initLanguages{
    
    NSString *message = @"";
    
    @try{
        
        
        if (! languages){
            languages = [[NSArray alloc] initWithObjects:@"English", @"Spanish", @"Italian",
                         @"Japanese", @"Hindi", @"Swedish", @"Korean", @"Chinese", @"Tagalog", nil];
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
        
        
        //self.tableView.backgroundColor =  kVerticalTableBackgroundColor;
        
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


-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *message   = @"",
             *title     = @"",
             *imageName = @"",
             *cellId    = @"";
    
    UITableViewCell *cell = nil;
    
    @try {
        
        
        cellId = @"cbLanguageCell";
        
        cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        
        if (! cell){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:cellId];
            
        }
        
        title = [languages objectAtIndex:indexPath.row];
        imageName = [NSString stringWithFormat:@"%@.png",title];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        //[cell setBackgroundColor:self.tableView.backgroundColor];
        [cell.textLabel setTextColor: [UIColor blackColor]];
        
        [cell.textLabel setFont:[UIFont systemFontOfSize:25.0]];
        [cell.textLabel setText:title];
        [cell.imageView setImage:[UIImage imageNamed:imageName]];
        
        
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



-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *message   = @"";
    @try {
        
        if (cell){
            //This will set the background of all of the views within the tablecell
           // cell.contentView.superview.backgroundColor = kVerticalTableBackgroundColor;
        }
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        message = @"";
    }
    
}



-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger sectionCount = 1  ;
    return sectionCount;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger rowCount = 1;
    
    switch (section) {
        case 0:
            rowCount = languages.count;
            break;
            
    }
    return rowCount;
}


-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
 
}


@end
