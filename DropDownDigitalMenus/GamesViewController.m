//
//  SecondViewController.m
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 10/22/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import "GamesViewController.h"
#import "GamesViewController.h"
#import "UIColor+ColorWithHexString.h"
@interface GamesViewController ()
{
    NSArray *games;
}
-(void)initGamesData;
-(void)initTablesData;
@end

@implementation GamesViewController


-(void) initTablesData{
    
    NSString *message = @"";
    @try {
        
        if (!self.tableView){
            self.tableView = [[UITableView alloc] init];
        }
        
        [self.tableView setDataSource:self];
        [self.tableView setDelegate:self];
        [self.tableView setBackgroundColor:[UIColor colorWithHexString:@"800000"]];
        
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
    
}

-(void) initGamesData{
    NSString *message = @"";
    @try {
        
        games = [[NSArray alloc] initWithObjects:@"Bingo.gif",@"Curve.gif",@"Dodge.gif",@"Mini-Putt.gif",
                                                 @"Hexxagon.gif", @"Air-Hockey.gif",@"Memory.gif", @"Pacman.gif",
                                                 @"Simon.gif", @"Tetris.gif", @"Tic-Tac-Toe.gif",nil];
        
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
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initGamesData];
    [self initTablesData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - TableView Events

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Games and Applications";
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
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
        
        
        cellId = @"cbGamesCell";
        
        cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        
        if (! cell){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:cellId];
            
        }
        
        imageName = [games objectAtIndex:indexPath.row];
        title = [imageName stringByReplacingOccurrencesOfString:@".gif" withString:@""];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        [cell setBackgroundColor:self.tableView.backgroundColor];
        [cell.textLabel setTextColor:[UIColor orangeColor]];
        
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

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger rows = 0;
    
    rows = games.count;
    
    return rows;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger sections = 1;
    
    
    
    return sections;
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
}

#pragma mark - Navigation


-(BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    BOOL result = YES;
  /*  NSString *segName = identifier;
    
    if (! [segName length] > 0){
        result = NO;
    }*/
    
    return result;
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    NSIndexPath *selectedIP = [self.tableView indexPathForSelectedRow];
    
    GamesViewController *destVC = (GamesViewController*) [segue destinationViewController];
    
    
}

@end
