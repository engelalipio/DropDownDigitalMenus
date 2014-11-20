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
#import "MenuDetailViewController.h"
#import "SaladDetailViewController.h"

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
    
    NSInteger currentInterval;
   
}
-(void) initMenuCategories;
-(void) initTableView;

@end

@implementation MenuViewController

@synthesize pageControl   = _pageControl;
@synthesize indexPath     = _indexPath;
@synthesize drinksTimer   = _drinksTimer;
@synthesize appsTimer     = _appsTimer;
@synthesize meatsTimer    = _meatsTimer;
@synthesize dessertsTimer = _dessertsTimer;
@synthesize loop          = _loop;

#pragma -mark Utility Methods

- (void)drinksTimerFireMethod:(NSTimer *)t{
    
    NSString *message       = @"";
    NSIndexSet *indexSet    = nil; 
    NSInteger randomAnimation = 0;
    @try {
        randomAnimation = arc4random_uniform(5);
        indexSet = [[NSIndexSet alloc] initWithIndex:0];
        [self.tableView beginUpdates];
        [self.tableView reloadSections:indexSet withRowAnimation:randomAnimation];
        [self.tableView endUpdates];
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        
        if ([message length] > 0){
            NSLog(@"%@",message);
        }
    }
}


- (void)appsTimerFireMethod:(NSTimer *)t{
    
    NSString *message       = @"";
    NSIndexSet *indexSet    = nil;
    NSInteger randomAnimation = 0;
    @try {
        randomAnimation = arc4random_uniform(5);
        indexSet = [[NSIndexSet alloc] initWithIndex:1];
        [self.tableView beginUpdates];
        [self.tableView reloadSections:indexSet withRowAnimation:randomAnimation];
        [self.tableView endUpdates];
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        
        if ([message length] > 0){
            NSLog(@"%@",message);
        }
    }
}

- (void)meatsTimerFireMethod:(NSTimer *)t{
    
    NSString *message       = @"";
    NSIndexSet *indexSet    = nil;
    NSInteger randomAnimation = 0;
    @try {
        randomAnimation = arc4random_uniform(5);
        indexSet = [[NSIndexSet alloc] initWithIndex:2];
        [self.tableView beginUpdates];
        [self.tableView reloadSections:indexSet withRowAnimation:randomAnimation];
        [self.tableView endUpdates];
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        
        if ([message length] > 0){
            NSLog(@"%@",message);
        }
    }
}

- (void)dessertsTimerFireMethod:(NSTimer *)t{
    
    NSString *message       = @"";
    NSIndexSet *indexSet    = nil;
    NSInteger randomAnimation = 0;
    @try {
        randomAnimation = arc4random_uniform(5);
        indexSet = [[NSIndexSet alloc] initWithIndex:3];
        [self.tableView beginUpdates];
        [self.tableView reloadSections:indexSet withRowAnimation:randomAnimation];
        [self.tableView endUpdates];
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        
        if ([message length] > 0){
            NSLog(@"%@",message);
        }
    }
}

-(void) startTimers{
    
    NSInteger interval = 0;
    
    if (self.drinksTimer == nil){
        
        while (interval < 4 ) {
           interval = arc4random_uniform(10);
        }
       
    
        self.drinksTimer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeInterval:interval sinceDate:[NSDate date]]
                                              interval:interval
                                                target:self
                                              selector:@selector(drinksTimerFireMethod:)
                                              userInfo:nil
                                               repeats:YES];
        
        self.loop = [NSRunLoop currentRunLoop];
        
       [self.loop addTimer:self.drinksTimer forMode:NSDefaultRunLoopMode];
    }
    
    if (self.appsTimer == nil){
        
        while (interval < 4 ) {
            interval = arc4random_uniform(10);
        }
        
        self.appsTimer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeInterval:interval sinceDate:[NSDate date]]
                                                      interval:interval
                                                        target:self
                                                      selector:@selector(appsTimerFireMethod:)
                                                      userInfo:nil
                                                       repeats:YES];
        
        self.loop = [NSRunLoop currentRunLoop];
        
        [self.loop addTimer:self.appsTimer forMode:NSDefaultRunLoopMode];
    }
    
    if (self.meatsTimer == nil){
        
        while (interval < 4 ) {
            interval = arc4random_uniform(10);
        }
        
        self.meatsTimer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeInterval:interval sinceDate:[NSDate date]]
                                                  interval:interval
                                                    target:self
                                                  selector:@selector(meatsTimerFireMethod:)
                                                  userInfo:nil
                                                   repeats:YES];
        
        self.loop = [NSRunLoop currentRunLoop];
        
        [self.loop addTimer:self.meatsTimer forMode:NSDefaultRunLoopMode];
    }
    
    if (self.dessertsTimer == nil){
        
        
        while (interval < 4 ) {
            interval = arc4random_uniform(10);
        }
        
        self.dessertsTimer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeInterval:interval sinceDate:[NSDate date]]
                                                   interval:interval
                                                     target:self
                                                   selector:@selector(dessertsTimerFireMethod:)
                                                   userInfo:nil
                                                    repeats:YES];
        
        self.loop = [NSRunLoop currentRunLoop];
        
        [self.loop addTimer:self.dessertsTimer forMode:NSDefaultRunLoopMode];
    }
    
}

-(void)stopTimers{
    if (self.drinksTimer != nil){
        [self.drinksTimer invalidate];
    }
    NSLog(@"Stopped Drinks timer");
    self.drinksTimer = nil;
    
    if (self.appsTimer != nil){
        [self.appsTimer invalidate];
    }
    NSLog(@"Stopped Apps timer");
    self.appsTimer = nil;
    
    if (self.meatsTimer != nil){
        [self.meatsTimer invalidate];
    }
    NSLog(@"Stopped Meats timer");
    self.meatsTimer = nil;
    
    if (self.dessertsTimer != nil){
        [self.dessertsTimer invalidate];
    }
    NSLog(@"Stopped Desserts timer");
    self.dessertsTimer = nil;
}


-(void) initMenuCategories{
    
    NSString *message       = @"",
             *drinkFormat   = @"BarBack_%d.jpg",
             *appFormat     = @"SaladBarBack_%d.jpg",
             *meatFormat    = @"MeatBack_%d.jpg",
             *dessertFormat = @"DessertBack_%d.jpg";
    
    int drinkCount   = 8,
        appCount     = 9,
        meatCount    = 11,
        dessertCount = 7;
    
    @try{
        
        
        if (! menuTitles){
            menuTitles = [[NSMutableArray alloc] initWithObjects: @"Drinks",
                                                                  @"Salads and Sides",
                                                                  @"Meats",
                                                                  @"Desserts", nil];
            
        }
        
        if (! drinksMenuData){
            
            
            drinkImages = [[NSMutableArray alloc] initWithCapacity:drinkCount];
            drinkTitles = [[NSMutableArray alloc] initWithCapacity:drinkCount];
            
            for(int iDrinks = 0; iDrinks < drinkCount; iDrinks++ ){
                NSString *drinkImageName = [NSString stringWithFormat:drinkFormat,iDrinks],
                         *drinkTitle  = drinkImageName;
                
                switch (iDrinks) {
                    case 0:
                        drinkTitle = @"Wide-array of premium liquors, fine cognacs and specialty martinis";
                        break;
                    case 1:
                        drinkTitle = @"Traditional Brazilian Creations";
                        break;
                    case 2:
                        drinkTitle = @"Cocktails";
                        break;
                    case 3:
                        drinkTitle = @"Tropical Daiquiris";
                        break;
                    case 4:
                        drinkTitle = @"Caipirinha";
                        break;
                    case 5:
                        drinkTitle = @"Specialty Martinis";
                        break;
                    case 6:
                        drinkTitle = @"Exotic Mojitos";
                        break;
                    case 7:
                        drinkTitle = @"Non-Alcoholic Beverages";
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
                        appTitle = @"Salad bar area";
                        break;
                    case 1:
                        appTitle = @"Fresh buffalo mozzarella, fresh tomatoes";
                        break;
                    case 2:
                        appTitle = @"Fruit salad";
                        break;
                    case 3:
                        appTitle = @"Sample four freshly made in-house salad dressings";
                        break;
                    case 4:
                        appTitle = @"Greek olives, shrimp salad, imported Italian salamis, spicy surimi sushi";
                        break;
                    case 5:
                        appTitle = @"Steamed asparagus with strawberry sauce, Brazilian hearts of palm, grilled Portobello mushrooms";
                        break;
                    case 6:
                        appTitle = @"Jasmine rice, soup du jour";
                        break;
                    case 7:
                        appTitle = @"Gourmet artisan breads,imported Italian salamis, sautéed mushrooms";
                        break;
                    case 8:
                        appTitle = @"Greek olives, fresh salmon,herbed sweet onions";
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
                        meatTitle = @"Chicken Breast wrapped in Bacon";
                        break;
                    case 1:
                        meatTitle = @"Filet Mignon";
                        break;
                    case 2:
                        meatTitle = @"Herb-Marinated Pork Loin";
                        break;
                    case 3:
                        meatTitle = @"Garlic Picanha";
                        break;
                    case 4:
                        meatTitle = @"Brazilian Picanha";
                        break;
                    case 5:
                        meatTitle = @"Brazilian Sausage";
                        break;
                    case 6:
                        meatTitle = @"Leg of Lamb";
                        break;
                    case 7:
                        meatTitle = @"Brazilian Alcatra";
                        break;
                    case 8:
                        meatTitle = @"Parmesan-Crusted Pork Loin";
                        break;
                    case 9:
                        meatTitle = @"Flank Steak";
                        break;
                    case 10:
                        meatTitle = @"Filet Mignon wrapped in Bacon";
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
                        dessertTitle = @"Chocolate Mousse Cake";
                        break;
                    case 1:
                        dessertTitle = @"Key Lime Pie";
                        break;
                    case 2:
                        dessertTitle = @"Brazilian Flan";
                        break;
                    case 3:
                        dessertTitle = @"Coconut Chess Pie";
                        break;
                    case 4:
                        dessertTitle = @"Crème Brûlée";
                        break;
                    case 5:
                        dessertTitle = @"Brazilian Papaya Cream";
                        break;
                    case 6:
                        dessertTitle = @"Pecan Pie";
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
    CGRect tableRect ;
   
    @try {
        
        
        tableRect = CGRectMake(0.0f, kTableYStart, kTabletWidth, kTableHeight);
        
        if (! self.tableView){
            self.tableView = [[UITableView alloc] initWithFrame:tableRect];
        }
        
        [self.tableView registerClass:[HorizontalTableViewCell class] forCellReuseIdentifier:@"HorizontalCell"];
        
        self.tableView.backgroundColor = kVerticalTableBackgroundColor;
        [self.tableView.tableHeaderView setBackgroundColor:[UIColor blackColor]];
       
        
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
    
    NSString *message    = @"",
             *title      = @"",
             *menuKey    = @"",
             *imageName  = @"",
             *cellId     = @"";
    
    UITableViewCell *cell = nil;
 
    NSInteger index = -1;
    
    CGRect frameRect,
           labelRect;
    
    UIImage *image = nil;
    
    UIImageView *imageView = nil;
    
    UILabel *labelView = nil;
    
    @try {
        
        frameRect =  CGRectMake(kRowHorizontalPadding * 0.5,kRowVerticalPadding * 0.5,
                                kTableLength - kRowHorizontalPadding,kCellHeight - kRowVerticalPadding);
      
        labelRect =  CGRectMake(kRowHorizontalPadding * 0.5,kCellHeight - kArticleTitleLabelPadding,
                                kTableLength -4 ,kArticleTitleLabelPadding - kRowVerticalPadding);
        
        
        
        switch ([indexPath section]) {
            case 0:
                cellId = @"cbDrinks";
                break;
                
            case 1:
                cellId = @"cbSalads";
                break;
            case 2:
                cellId = @"cbMeats";
                break;
            case 3:
                cellId = @"cbDesserts";
                break;
        }

    
        
        cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        
        if (! cell){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
            
        }
    
        // @"Drinks",@"Salads and Sides", @"Meats", @"Desserts"
        
        switch ([indexPath section]) {
            case 0:
                menuKey   = [NSString stringWithFormat:@"BarBack_%ld.jpg",(long)index];
                
                index     = arc4random_uniform([drinkImages count]);
                
                imageName = [drinkImages objectAtIndex:index];
                title     = [drinkTitles objectAtIndex:index];
                
                break;
            case 1:
                menuKey   = [NSString stringWithFormat:@"SaladBarBack_%ld.jpg",(long) index];
                
                index     = arc4random_uniform([appImages count]);
                
                imageName = [appImages objectAtIndex:index];
                title     = [appTitles objectAtIndex:index];
            
                break;
            case 2:
                menuKey   = [NSString stringWithFormat:@"MeatBack_%ld.jpg",(long) index];

                index     = arc4random_uniform([meatImages count]);
                
                imageName = [meatImages objectAtIndex:index];
                title     = [meatTitles objectAtIndex:index];
                
                break;
            case 3:
                menuKey   = [NSString stringWithFormat:@"DessertBack_%ld.jpg",(long) index];

                index     = arc4random_uniform([dessertImages count]);
                
                imageName = [dessertImages objectAtIndex:index];
                title     = [dessertTitles objectAtIndex:index];
               
                break;
        }
        
        image = [UIImage imageNamed:imageName];
        
        imageView = [[UIImageView alloc] initWithFrame:frameRect];
        
        [imageView setImage:image];
        
        cell.backgroundColor =  kHorizontalTableSelectedBackgroundColor;
        
        labelView = [[UILabel alloc] initWithFrame:labelRect];
        
        [labelView setBackgroundColor:[UIColor blackColor]];
        
        [labelView setAlpha:0.7];
        
        [labelView setTextColor:[UIColor whiteColor]];
        
        [labelView setFont:[UIFont systemFontOfSize:17.0]];
        
        [labelView setText:title];
        
        [imageView addSubview:labelView];
        
        [cell.contentView addSubview:imageView];
        
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
        [imageView sizeThatFits:frameRect.size];
        [labelView sizeThatFits:labelRect.size];
        
        

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


/* TODO: Uncomment to use horizontal table functionality
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

}*/


-(UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    float x,
          y,
          w,
          h;
    
    x =  kRowVerticalPadding * 0.5;
    y =  kRowVerticalPadding * 0.5;
    w =  kTableLength - kRowHorizontalPadding;
    h =  kTableYStart;
    
    
    CGRect frameRect =  CGRectMake(x,y,w,h);
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:frameRect];
    
    NSString *sectionTitle = @"";
              sectionTitle = [menuTitles objectAtIndex:section];
    
    [titleLabel setBackgroundColor:kVerticalTableBackgroundColor];
    titleLabel.TextColor = kHorizontalTableSelectedBackgroundColor;
    [titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
    [titleLabel setText:sectionTitle];

    return titleLabel;
}


/*
-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *sectionTitle = @"";
              sectionTitle = [menuTitles objectAtIndex:section];
    return sectionTitle;
}
*/
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

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self startTimers];
    [self initTableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem.backBarButtonItem setTintColor:[UIColor whiteColor]];
    [self initMenuCategories];
}

-(void) viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self stopTimers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

-(void) performSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    UIStoryboardSegue *seg = nil;
    MenuDetailViewController *drinksVC = nil;
    SaladDetailViewController *saladsVC = nil;
    
    UIViewController *vc = nil;
    
    NSIndexPath *indexPath = nil;
    
    //Executing Members
    if ([identifier length] > 0){
        
        NSLog(@"%@",identifier);
    }
    
   /* if (sender){
        indexPath = (NSIndexPath *) sender;
        
        switch ([indexPath section]) {
            case 0:
                drinksVC =  [[MenuDetailViewController alloc] init];
                vc = drinksVC;
                break;
                
            case 1:
                saladsVC  = [[SaladDetailViewController alloc] init];
                vc = saladsVC;
                break;
            case 2:
                
                break;
            case 3:
                
                break;
        }
        
        
        seg = [[UIStoryboardSegue alloc] initWithIdentifier:identifier source:self destination:vc];
        
        
        [self presentViewController:vc animated:YES completion:nil];
 
        
    }*/
    
    

    
}


-(BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    BOOL result = YES;
    NSString *segName = identifier;
    
    if (! [segName length] > 0){
        result = NO;
    }
    
    return result;
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    

    UIViewController *destVC = nil;
    
    NSString *message = @"";

    
    @try {
        
        
        destVC =   [segue destinationViewController];

        

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


@end
