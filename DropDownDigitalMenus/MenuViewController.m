//
//  MenuViewController.m
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 10/29/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import "MenuViewController.h"
#import "UIColor+ColorWithHexString.h"
#import "PageContentViewController.h"
#import "HorizontalTableViewCell.h"
#import "Constants.h"

@interface MenuViewController ()
{
    NSMutableArray *menuTitles,
                   *drinkTitles,
                   *drinkImages,
                   *appTitles,
                   *appImages,
                   *meatTitles,
                   *meatImages,
                   *dessertTitles,
                   *dessertImages;
    
    NSMutableDictionary *drinksMenuData,
                        *appsMenuData,
                        *meatsMenuData,
                        *dessertsMenuData;
   
}
-(void) initMenuCategories;
-(void) initTableView;

@end

@implementation MenuViewController
@synthesize pageControl = _pageControl;
@synthesize indexPath = _indexPath;
@synthesize timer = _timer;
@synthesize loop  = _loop;

#pragma -mark Utility Methods


-(void) initMenuCategories{
    
    NSString *message = @"",
             *drinkFormat   = @"BarBack_%d.jpg",
             *appFormat     = @"SaladBar_%d.jpg",
             *meatFormat    = @"MeatBack_%d.jpg",
             *dessertFormat = @"DessertBack_%d.jpg";
    
    int drinkCount = 8,
        appCount   = 8,
        meatCount  = 11,
        dessertCount = 7;
    
    @try{
        
        
        if (! menuTitles){
            menuTitles = [[NSMutableArray alloc] initWithObjects: @"Drinks",@"Salads and Sides", @"Meats", @"Desserts", nil];
            
        }
        
        if (! drinksMenuData){
            
            
            drinkImages = [[NSMutableArray alloc] initWithCapacity:drinkCount];
            drinkTitles = [[NSMutableArray alloc] initWithCapacity:drinkCount];
            
            for(int iDrinks = 0; iDrinks < drinkCount; iDrinks++ ){
                NSString *drinkImageName = [NSString stringWithFormat:drinkFormat,iDrinks],
                         *drinkTitle  = drinkImageName;
                
                switch (iDrinks) {
                    case 0:
                        drinkTitle = @"Custom Drinks";
                        break;
                    case 1:
                        drinkTitle = @"Champaigne";
                        break;
                    case 2:
                        drinkTitle = @"Guarana";
                        break;
                    case 3:
                        drinkTitle = @"Strawberries";
                        break;
                    case 4:
                        drinkTitle = @"Caipirinhas";
                        break;
                    case 5:
                        drinkTitle = @"Other Drinks";
                        break;
                    case 6:
                        drinkTitle = @"Soft Drinks";
                        break;
                    case 7:
                        drinkTitle = @"Various Wines";
                        break;
                 }
                
                [drinkImages addObject:drinkImageName];
                [drinkTitles addObject:drinkTitle];
            }
            
           drinksMenuData = [[NSMutableDictionary alloc ]initWithObjects:drinkImages forKeys:drinkTitles];
           
        }
        
        if (! appsMenuData){
            appImages = [[NSMutableArray alloc] initWithCapacity:appCount];
            appTitles = [[NSMutableArray alloc] initWithCapacity:appCount];
            for(int iApps = 0; iApps < drinkCount; iApps++ ){
                NSString *appImageName = [NSString stringWithFormat:appFormat,iApps],
                         *appTitle  = appImageName;
                
                switch (iApps) {
                    case 0:
                        appTitle = @"Fresh Asparagus";
                        break;
                    case 1:
                        appTitle = @"Carrots";
                        break;
                    case 2:
                        appTitle = @"Various Lettuces";
                        break;
                    case 3:
                        appTitle = @"Peppers";
                        break;
                    case 4:
                        appTitle = @"Vinagrete";
                        break;
                    case 5:
                        appTitle = @"Potato and Pasta Salads";
                        break;
                    case 6:
                        appTitle = @"Cucumbers";
                        break;
                    case 7:
                        appTitle = @"Cocktail Shrimp";
                        break;
    
                    
                }
                
                [appImages addObject:appImageName];
                [appTitles addObject:appTitle];
            }
            
              appsMenuData = [[NSMutableDictionary alloc ]initWithObjects:appImages forKeys:appTitles];
        }
        
        if (! meatsMenuData){
            meatImages = [[NSMutableArray alloc] initWithCapacity:meatCount];
            meatTitles = [[NSMutableArray alloc] initWithCapacity:meatCount];
            for(int iMeats = 0; iMeats < meatCount; iMeats++ ){
                NSString *meatImageName = [NSString stringWithFormat:meatFormat,iMeats],
                         *meatTitle  = meatImageName;
                
                switch (iMeats) {
                    case 0:
                        meatTitle = @"Bacon Wrapped Filet Mignon";
                        break;
                    case 1:
                        meatTitle = @"Garlic Alcantra";
                        break;
                    case 2:
                        meatTitle = @"Pork Loion";
                        break;
                    case 3:
                        meatTitle = @"Garlic Picanha";
                        break;
                    case 4:
                        meatTitle = @"Traditional Picanha";
                        break;
                    case 5:
                        meatTitle = @"Brazilian Sausage";
                        break;
                    case 6:
                        meatTitle = @"Lamb";
                        break;
                    case 7:
                        meatTitle = @"Beef";
                        break;
                    case 8:
                        meatTitle = @"Parmisan Pork";
                        break;
                    case 9:
                        meatTitle = @"Beef Roast";
                        break;
                    case 10:
                        meatTitle = @"Bacon Wrapped Pork";
                        break;
                }
                
                [meatImages addObject:meatImageName];
                [meatTitles addObject:meatTitle];
            }
              meatsMenuData = [[NSMutableDictionary alloc ]initWithObjects:meatImages forKeys:meatTitles];
        }
        
        if (! dessertsMenuData){
        
            dessertImages = [[NSMutableArray alloc] initWithCapacity:dessertCount];
            dessertTitles = [[NSMutableArray alloc] initWithCapacity:dessertCount];
            
            for(int iDessert = 0; iDessert < dessertCount; iDessert++ ){
                NSString *dessertImageName = [NSString stringWithFormat:dessertFormat,iDessert],
                         *dessertTitle  = dessertImageName;
                
                switch (iDessert) {
                    case 0:
                        dessertTitle = @"Custom Drinks";
                        break;
                    case 1:
                        dessertTitle = @"Champaigne";
                        break;
                    case 2:
                        dessertTitle = @"Guarana";
                        break;
                    case 3:
                        dessertTitle = @"Strawberries";
                        break;
                    case 4:
                        dessertTitle = @"Caipirinhas";
                        break;
                    case 5:
                        dessertTitle = @"Other Drinks";
                        break;
                    case 6:
                        dessertTitle = @"Soft Drinks";
                        break;
                    case 7:
                        dessertTitle = @"Various Wines";
                        break;
                }
                
                [dessertImages addObject:dessertImageName];
                [dessertTitles addObject:dessertTitle];
            }
            
              dessertsMenuData = [[NSMutableDictionary alloc ]initWithObjects:dessertImages forKeys:dessertTitles];
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
    @try {
        
        if (! self.tableView){
            self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 20.0f, 768, kCellHeight)];
        }
        
        [self.tableView registerClass:[HorizontalTableViewCell class] forCellReuseIdentifier:@"HorizontalCell"];
        
        [self.tableView setBackgroundColor:[UIColor colorWithHexString:@"800000"]];
        
        [self.tableView setDelegate:self];
        [self.tableView setDataSource:self];

        
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

#pragma -mark Table View Events



-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *message   = @"",
            *title      = @"",
            *menuKey    = @"",
            *imageName  = @"",
            *cellId     = @"";
    
    HorizontalTableViewCell *cell = nil;
    
    NSMutableDictionary *items = nil;
    
    NSInteger index = -1;
    
    @try {
        
        
        cellId = @"HorizontalCell";
        
        
        if (! cell){
            cell = [[HorizontalTableViewCell alloc] initWithFrame:CGRectMake(0.0f, 0.0f,kCellWidth, kCellHeight)];
            
        }
        
        index = [indexPath row];
        
        // @"Drinks",@"Salads and Sides", @"Meats", @"Desserts"
        switch ([indexPath section]) {
            case 0:
                menuKey   = [NSString stringWithFormat:@"BarBack_%ld.jpg",(long)index];
                imageName = [drinkImages objectAtIndex:[indexPath row]];
                title     = [drinkTitles objectAtIndex:[indexPath row]];
                items = drinksMenuData;
              
                break;
            case 1:
                menuKey   = [NSString stringWithFormat:@"SaladBar_%ld.jpg",(long) index];
                imageName = [appImages objectAtIndex:[indexPath row]];
                title     = [appTitles objectAtIndex:[indexPath row]];
                items = appsMenuData;
                break;
            case 2:
                menuKey   = [NSString stringWithFormat:@"MeatBack_%ld.jpg",(long) index];
                imageName = [meatImages objectAtIndex:[indexPath row]];
                title     = [meatTitles objectAtIndex:[indexPath row]];
                items = meatsMenuData;
                break;
            case 3:
                menuKey   = [NSString stringWithFormat:@"DessertBack_%ld.jpg",(long) index];
                imageName = [dessertImages objectAtIndex:[indexPath row]];
                title     = [dessertTitles objectAtIndex:[indexPath row]];
                items = dessertsMenuData;
                break;
        }

        [cell setItems:items];
        [cell setBackgroundColor:[UIColor colorWithHexString:@"800000"]];
        /*[cell.textLabel setTextColor:[UIColor whiteColor]];
        [cell.textLabel setFont:[UIFont systemFontOfSize:17.0]];
        [cell.textLabel setText:title];
        [cell.imageView setImage:[UIImage imageNamed:imageName]];*/
        
        
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

-(UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 768, 22)];
    
    NSString *sectionTitle = @"";
              sectionTitle = [menuTitles objectAtIndex:section];
    
    [titleLabel setBackgroundColor:[UIColor blackColor]];
    [titleLabel setTextColor:[UIColor orangeColor]];
    [titleLabel setFont:[UIFont systemFontOfSize:15.0f]];
    [titleLabel setText:sectionTitle];

    
    return titleLabel;
}


/*
-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *sectionTitle = @"";
              sectionTitle = [menuTitles objectAtIndex:section];
    return sectionTitle;
}*/

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger sectionCount = 4;
    // @"Drinks",@"Salads and Sides", @"Meats", @"Desserts"
    return sectionCount;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger rowCount = 1;
    // @"Drinks",@"Salads and Sides", @"Meats", @"Desserts"
    /*switch (section) {
        case 0:
            rowCount = [drinkImages count];
            break;
        case 1:
            rowCount = [appImages count];
            break;
        case 2:
            rowCount = [meatTitles count];
            break;
        case 3:
            rowCount = [dessertImages count];
            break;
    }*/
    return rowCount;
}

- (void)awakeFromNib{
    [self.tableView setBackgroundColor:kVerticalTableBackgroundColor];
     self.tableView.rowHeight = kCellHeight + (kRowVerticalPadding * 0.5) + ((kRowVerticalPadding * 0.5) * 0.5);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initMenuCategories];
    [self initTableView];
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
