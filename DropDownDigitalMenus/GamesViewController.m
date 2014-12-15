//
//  SecondViewController.m
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 10/22/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import "GamesViewController.h"
#import "GameViewController.h"
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
        
        self.tableView.backgroundColor = [UIColor colorWithHexString:@"004080"];//kVerticalTableBackgroundColor;
        
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
        
        games = [[NSArray alloc] initWithObjects: @"Pop Pop Rush", @"Smarty Bubbles", @"Speed Pool King",@"Mahjong",@"Fit It Quick",@"Cartoon Flight",nil];
        
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

-(void) viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    if (self.tableView.indexPathForSelectedRow){
        [self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow animated:NO];
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
    return @"";
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
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
        
        title = [games objectAtIndex:indexPath.row];
    
        imageName = [title stringByReplacingOccurrencesOfString:@" " withString:@""];
        
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        [cell setBackgroundColor:self.tableView.backgroundColor];
        [cell.textLabel setTextColor: [UIColor whiteColor]];//[UIColor colorWithHexString: @"800000"]];
        
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
    
    GameViewController *destVC = (GameViewController*) [segue destinationViewController];
    
    NSString *gameURL = @"",
             *gameName = [games objectAtIndex:[selectedIP row]];
    
    switch([selectedIP row]){
        case 5:
            gameURL = @"play.famobi.com/cartoon-flight";
            
            break;
        case 0:
            gameURL = @"play.famobi.com/pop-pop-rush";
            break;
        case 1:
            gameURL = @"play.famobi.com/smarty-bubbles";
            break;
        case 2:
            gameURL = @"play.famobi.com/speed-pool-king";
            break;
        case 3:
            gameURL = @"play.famobi.com/mahjong-relax";
            break;
        case 4:
            gameURL = @"play.famobi.com/fit-it-quick";
            break;
    }
    
    if (destVC){
        [destVC setGameURL:gameURL];
        [destVC setGameName:gameName];
    }
    
}

@end
