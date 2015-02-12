//
//  HomeViewController.m
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 10/24/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import "HomeViewController.h"
#import "Constants.h"
#import "ContainerTableCellTableViewCell.h"
#import "PageContentViewController.h"
#import "UIColor+ColorWithHexString.h"
#import "MenuViewController.h"
#import "AppDelegate.h"


@interface HomeViewController ()
{
    NSArray *categorySections,
            *categoryHomeData,
            *drinks,
            *apps,
            *soups,
            *salads,
            *entrees,
            *desserts;
    
    PageContentViewController *currentContent;
    
    AppDelegate *appDelegate;
}
-(void) initPreferredLanguage;
-(void) initMenuSettings;
-(void) initTableView;
-(void) initCategorySections;
-(void) roundCorner;

@end

@implementation HomeViewController

@synthesize pageTitles = _pageTitles;
@synthesize pageImages = _pageImages;
@synthesize currentPageIndex = _currentPageIndex;

#pragma mark - TableView Events

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
   // return CGFLOAT_MIN;
    return 60;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}

-(UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *customTitleView = [ [UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 60)];
    
    UILabel *titleLabel = [ [UILabel alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 60)];
    
    titleLabel.text = @"The Most Incredible Dining Experience";
    
    //titleLabel.textColor = [UIColor orangeColor];
    titleLabel.textColor = kVerticalTableBackgroundColor;
    titleLabel.font = [UIFont systemFontOfSize:20];
    
    titleLabel.backgroundColor = [UIColor clearColor];
    
    [customTitleView addSubview:titleLabel];
    
    return customTitleView;
}


-(UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    //ADBannerView *adFooter = nil;
    UIImageView *footer = nil;
    UIImage *image = nil;
    NSString *message = @"";
    @try {
        
        image = [UIImage imageNamed:@"your_ad_here_banner.jpg"];
        footer = [[UIImageView alloc]
                  initWithImage:image];
        
 
        [footer setFrame:CGRectMake(0, 0,  self.tableView.frame.size.width, 60)];
   
        /*if ([appDelegate isDynamic]){
        
        adFooter = [[ADBannerView alloc] initWithAdType:ADAdTypeBanner];
        [adFooter setDelegate:self];
        [footer setFrame:CGRectMake(0.0f, 0.0f, self.tableView.frame.size.width, 60)];
        
         message = [NSString stringWithFormat:@"Sucessfully initialized [initWithAdType:ADAdTypeBanner]"];
            
            return adFooter;
        }*/
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
    return footer;
}

-(void) roundCorner{
//Add border and rounded corners to text view
self.addressLabel.layer.cornerRadius = 10;
self.addressLabel.layer.borderWidth = 1;
self.addressLabel.layer.borderColor = [[UIColor lightGrayColor] CGColor];
}


-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *message   = @"";
    
    
    @try {
        
        if (cell){
            //This will set the background of all of the views within the tablecell
            cell.contentView.superview.backgroundColor = kVerticalTableBackgroundColor;
        }
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        message = @"";
    }

}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *message   = @"",
             *title     = @"",
             *cellId    = @"",
             *imageName = @"";
    
    UITableViewCell *cell = nil;
    
    BOOL isDynamic = appDelegate.isDynamic;
    
    NSArray *images = nil;
    
    @try {
        
        isDynamic = appDelegate.isDynamic;
        
        switch (indexPath.row) {
            case 0:
                cellId = @"cbDrinksCell";
                if (drinks){
                    images = drinks;
                }
                break;
            case 1:
                cellId = @"cbAppsCell";
                if (apps){
                    images = apps;
                }
                break;
            case 2:
                cellId = @"cbSoupsCell";
                if (soups){
                    images = soups;
                }
                break;
            case 3:
                cellId = @"cbSaladsCell";
                if (salads){
                    images = salads;
                }
                break;
            case 4:
                cellId = @"cbEntreesCell";
                if (entrees){
                    images = entrees;
                }
                break;
            case 5:
                cellId = @"cbDessertsCell";
                if (desserts){
                    images = desserts;
                }
                break;
        }
        
        cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        
        if (! cell){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                          reuseIdentifier:cellId];
            
        }

        title = [categoryHomeData objectAtIndex:indexPath.row];
        
        if (isDynamic){
            imageName = [images objectAtIndex:arc4random_uniform(images.count)];
            
            [cell.imageView setImage:[UIImage imageNamed:imageName]];
        }else{
            [cell.imageView setImage:nil];
        }
        
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
        [cell.textLabel setFont:[UIFont systemFontOfSize:22.0]];
        [cell.textLabel setTextColor:kTableCellTitleColor];
        [cell.textLabel setText:title];
        
    
        
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
    
    rows = categoryHomeData.count;
    
    return rows;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger sections = 1;
    
    if (categorySections){
        // sections = [categorySections count];
    }
    
    return sections;
}

#pragma mark - iAdBanner Events

-(void) bannerViewDidLoadAd:(ADBannerView *)banner{
    NSString *message = @"";
    @try {
        
            message = @"bannerViewDidLoadAd:(ADBannerView *)banner";
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        if ([message length]> 0){
            NSLog(@"%@",message);
        }
        message = @"";
    }
}

-(void) bannerViewActionDidFinish:(ADBannerView *)banner{
    NSString *message = @"";
    @try {
        
        message = @"bannerViewActionDidFinish:(ADBannerView *)banner";
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        if ([message length]> 0){
            NSLog(@"%@",message);
        }
        message = @"";
    }
}

-(void) bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
    NSString *message = @"";
    @try {
        
        if (error){
            message = [error description];
        }
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        if ([message length]> 0){
            NSLog(@"%@",message);
        }
        message = @"";
    }
}

#pragma mark - Utility Methods

-(void) preparePageViewData{
    NSString *message = @"",
             *desc    = @"";
    
    PageContentViewController *initialContent = nil;
    NSArray *viewControllers  = nil,
            *restaurantImages = nil;
    
    UIPageControl *currentPageControl = nil;
    
    @try {
        
        if (! self.pageImages && ! self.pageTitles){
            _pageTitles  = [[NSArray alloc] initWithObjects:@"", @"",@"", @"",@"",@"",@"",@"", nil];
            
            NSMutableDictionary *restaurantDetail =  [categorySections firstObject];
            
            if (restaurantDetail){
                desc = [restaurantDetail objectForKey:@"description"];
                
                if (appDelegate.isDynamic){
                    restaurantImages = [[NSArray alloc] initWithObjects:@"HomeNew.jpg", @"RestaurantBack_1.jpg",
                                        @"RestaurantBack_3.jpg",@"RestaurantBack_8.jpg",@"RestaurantBack_9.jpg",@"HomeNewToo.jpg" ,nil];
                }else{
                    restaurantImages = [restaurantDetail objectForKey:@"items"];
                }
                
                if (restaurantImages){
                    NSMutableDictionary *finalImages = [[NSMutableDictionary alloc] initWithCapacity:restaurantImages.count];
                    for (int imgIndex = 0; imgIndex < restaurantImages.count; imgIndex++) {
                        
                        NSDictionary *imageRawName = [restaurantImages objectAtIndex:imgIndex];
                        
                        NSString     *imageKey     = [NSString stringWithFormat:@"%d",imgIndex];
                      
                        
                        if (imageRawName){
                            NSString *imageShortName = [imageRawName objectForKey:@"image"];
                           
                            [finalImages setValue:imageShortName forKey:imageKey];
                        }
                        
                    }
                    restaurantImages = [finalImages allValues];
                }
            }
        

            _pageImages  = [[NSArray alloc] initWithArray:restaurantImages];
            
            _currentPageIndex = 0;
            
            if (! self.pageControl){
                
                currentPageControl = [UIPageControl appearance];
                [currentPageControl setPageIndicatorTintColor:[UIColor grayColor] ];
                [currentPageControl setCurrentPageIndicatorTintColor:[UIColor lightGrayColor]];
                [currentPageControl setBackgroundColor:[UIColor clearColor]];
                [currentPageControl setNumberOfPages:_pageImages.count];
                
                _pageControl = currentPageControl;
            }
        }
        
        currentPageControl = self.pageControl;
        
        
      //  [self setDataSource:self];
        
        initialContent = [self viewControllerAtIndex:self.currentPageIndex];
        
 
        viewControllers = [[NSArray alloc] initWithObjects:initialContent, nil];
    
        
        /*[self setViewControllers:viewControllers
                       direction:UIPageViewControllerNavigationDirectionForward
                        animated:YES
                      completion:nil];*/
        
        
        [currentPageControl setCurrentPage:_currentPageIndex];
        
        currentContent = initialContent;
        
        // Change the size of page view controller
        
       /* [self.view addSubview:initialContent.view];
        [self.view setFrame: CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y,
                                        self.view.frame.size.width, self.view.frame.size.height )];*/
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        if ([message length] > 0){
            NSLog(@"%@",message);
        }
        message = @"";
        initialContent = nil;
        viewControllers = nil;
        currentPageControl = nil;
    }
}


-(void) startTimer{
    
    [self preparePageViewData];
    
    double interval = [appDelegate interval];
    
  
        
        self.timer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeInterval:interval sinceDate:[NSDate date]]
                                              interval:interval target:self
                                              selector:@selector(timerFireMethod:)
                                              userInfo:nil
                                               repeats:YES];
        
        self.loop = [NSRunLoop currentRunLoop];
        [self.loop addTimer:self.timer forMode:NSDefaultRunLoopMode];
 
    
}

-(void)stopTimer{
    if (self.timer != nil){
        [self.timer invalidate];
    }
    NSLog(@"Stopped timer");
    self.timer = nil;
}

- (IBAction)actionLight:(UIButton *)sender {
    
   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Lighting Setting"
                                       message:@"Users will be able to adjust the lighting settings" delegate:self
                             cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    if (alert){
        [alert show];
    }
    
}


- (void)timerFireMethod:(NSTimer *)t{
    
    NSString *message         = @"";
    NSArray  *images          = nil;
    UIImage  *image           = nil;
    NSIndexSet *indexSet      = nil;
    NSIndexPath *indexPath    = nil;
    NSInteger randomAnimation = 0,
              randomSection   = 0;
    @try {
        
        
        self.currentPageIndex = arc4random_uniform(self.pageTitles.count);
        
        image = [UIImage imageNamed:[self.pageTitles objectAtIndex:self.currentPageIndex]];
        
        [self.imageView setImage:image];
    
        
        randomAnimation = arc4random_uniform(5);
        randomSection   = arc4random_uniform(6);
        
        indexPath = [NSIndexPath indexPathForRow:randomSection inSection:0];
        
        indexSet = [[NSIndexSet alloc] initWithIndex:randomSection];
        
        [self.tableView beginUpdates];
        

        images = [[NSArray alloc] initWithObjects:indexPath, nil];
        
        [self.tableView reloadRowsAtIndexPaths:images withRowAnimation:randomAnimation];
    
        
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

-(void) initCategorySections{
    
    NSString *message = @"";
    
    @try{
        
        [self.navigationItem setTitle:appDelegate.restaurantTable];
       // [self setTitle:appDelegate.restaurantTable];
        
        categoryHomeData = [[NSArray alloc] initWithObjects:@"Beverages",@"Appetizers",@"Soups",@"Salads",@"Entrees",@"Desserts", nil];
        
        if (appDelegate.isDynamic){
            self.pageTitles  = [[NSArray alloc] initWithObjects:@"HomeNew.jpg", @"RestaurantBack_1.jpg",
                                @"RestaurantBack_3.jpg",@"RestaurantBack_8.jpg",@"RestaurantBack_9.jpg",@"HomeNewToo.jpg" ,nil];
            
            categorySections = @[ @{ @"description": appDelegate.restaurantName,
                                     @"items": @[ @{ @"image": @"HomeNew.jpg" }]
                                     } ];
            
            drinks = [[NSArray alloc] initWithObjects:@"ACQUA_PENNA.jpg", @"PELLEGRINO_WATER.jpg", @"STRAWBERRY_SMOOTHIE.jpg",
                                    @"PEACHMANGO_SMOOTHIE.jpg", @"FRUIT_JUICES.jpg", @"RASPBERRY_LEMONADE.jpg",
                                    @"STRABERRY_PASSIONFRUIT_LIMONADA.jpg", @"BELLINI_PEACH_RASPBERRY_TEA.jpg",nil];
            
            apps = [[NSArray alloc] initWithObjects:@"SAMPLER.jpg", @"EXTRA_BREADSTICKS.jpg", @"LASAGNA_FRITA.jpg",
                      @"BRUSCHETTE_PAOLO.png", @"CALAMARI.png", @"COZZE_IN_BIANCO.png",
                      @"SHRIMP_DIAVOLO.png", @"TOMATOES_CAPRESE.png",@"ZUCCHINI_FRITTE.png",nil];
            
            soups = [[NSArray alloc] initWithObjects:@"CORN_CHOWDER.jpg",@"LENTIL_SOUP.jpg",@"TOMATO_BASIL_SOUP.jpg",
                                                     @"TUSCAN_SAUSAGE.jpg", @"ZUPPA_TOSCANA.jpg", @"FAGIOLI.jpg",nil];
            
            salads = [[NSArray alloc] initWithObjects:@"HEART_PALMS_SALAD.jpg", @"TAYS_WEDGE_SALAD.jpg", @"CHICKEN_CAESAR.jpg",
                                                      @"COBB_SALAD.jpg",@"SANTA_FE.jpg", @"GRILLED_CHICKEN_SALAD.jpg",
                                                      @"HOUSE_SALAD.jpg",@"CAESAR.jpg",@"JOHNNY_ROCCO_SALAD.png",
                                                      @"PARMESAN_CRUSTED_CHICKEN_SALAD.png",nil];
            
            entrees  = [[NSArray alloc] initWithObjects:@"CHICKEN_BRYAN.png", @"CHICKEN_MARSALA.png",
                                                       @"POLLO_LA_SCALA.png", @"POLLO_SORRENTO.png", @"WOOD-GRILLED_CHICKEN.png",
                                                       @"FETTUCCINE_CARRABBA.png",@"LOBSTER_RAVIOLI.png",@"FETTUCCINE_WEESIE.png",
                                                       @"WOOD_GRILLED_SALMON.png",@"MAHI_WULFE.png",@"SHRIMP_RISOTTO.png",nil];
            
            desserts = [[NSArray alloc] initWithObjects:@"WHITE_CHOCOLATE_RASPBERRY_CHEESECAKE.jpg",@"BLACK_TIE_MOUSSE_CAKE.jpg",
                                                        @"ZEPPOLE.jpg",@"DESSERT_ROSA.png",@"JOHN_COLE.png",@"MINI_CANNOLI.png",
                                                        @"PANNA_COTTA.png",@"SOGNO_DI_CIOCCOLATA.png",@"TIRAMISÚ.png",nil];
            
            
        }else{
        
            categorySections = @[ @{ @"description": appDelegate.restaurantName,
                                     @"items": @[ @{ @"image": @"HomeNew.jpg" }]
                                     } ];
            
            self.pageTitles  = [[NSArray alloc] initWithObjects:@"HomeNew.jpg", nil];
            
            drinks  = nil;
            apps    = nil;
            entrees = nil;
            soups   = nil;
            salads  = nil;
            desserts = nil;
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
        
        self.tableView.backgroundColor =  kTableCellTitleColor;
        
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

#pragma -mark - PageContent Events


-(NSInteger) presentationCountForPageViewController:(UIPageViewController *)pageViewController{
    return [self.pageTitles count];
}

-(NSInteger) presentationIndexForPageViewController:(UIPageViewController *)pageViewController{
    return self.currentPageIndex;
}

-(PageContentViewController*) viewControllerAtIndex:(NSUInteger) anyIndex{
    NSString *message = @"",
             *imageTitle = @"",
             *imageName  = @"";
    
    PageContentViewController *pageContentViewController = nil;
    
    @try {
        
        if (([self.pageTitles count] == 0) || (anyIndex >= [self.pageTitles count])) {
            return nil;
        }
        
        // Create a new view controller and pass suitable data.
        pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"sbPageContent"];
        
        imageTitle = [self.pageTitles objectAtIndex:anyIndex];
        imageName  = [self.pageImages objectAtIndex:anyIndex];
        
        if (pageContentViewController){
            [pageContentViewController setFrameRect:CGRectMake(0.0, 21.0, 768.0, 368.0)];
            [pageContentViewController setImageFile:imageName];
            [pageContentViewController setTitleText:imageTitle];
            [pageContentViewController setPageIndex:anyIndex];
            
           // message = [NSString stringWithFormat: @"Loading Page Content for %@", pageContentViewController.titleText];
        }
        
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
    return pageContentViewController;
}

-(UIViewController*) pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSString *message = @"";
    NSUInteger index = -1;
    PageContentViewController *contentController = nil;
    @try {
        
        contentController = (PageContentViewController*) viewController;
        
        index =  contentController.pageIndex;
        
        if ((index == 0) || (index == NSNotFound)) {
            return nil;
        }
        
        index--;
        
        contentController = [self viewControllerAtIndex:index];
    
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        if ([message length] > 0){
            NSLog(@"%@",message);
        }
        message = @"";
        index = -1;
    }
    return contentController;
}

-(UIViewController*) pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSString *message = @"";
    NSUInteger index = -1;
    PageContentViewController *contentController = nil;
    @try {
        
        
        contentController = (PageContentViewController*) viewController;
        
        index = contentController.pageIndex;
        
        if (index == NSNotFound) {
            return nil;
        }
        
        index++;
        
        if (index >= [self.pageTitles count]){
            return nil;
        }
        
        contentController = [self viewControllerAtIndex:index];
        
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        if ([message length] > 0){
            NSLog(@"%@",message);
        }
        message = @"";
        index = -1;
    }
    return contentController;
}


-(void) pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished
   previousViewControllers:(NSArray *)previousViewControllers
       transitionCompleted:(BOOL)completed{
    NSString *message = @"";
    @try {
        message = @"Invoked[pageViewController->didFinishAnimating]";
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

-(void) pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers{
    
    NSString *message = @"";
    @try {
        message = @"Invoked[pageViewController->willTransitionToViewControllers]";
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

-(void) initPreferredLanguage{
    
    NSString *language = @"";
    
    language = [appDelegate language];
    
    [self.imageLanguage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[language uppercaseString]]]];
    
}

-(void) initMenuSettings{
    
    BOOL isDynamic = NO;
    
    NSString *welcomeMessage = @"Welcome to %@ \n %@, %@, %@ %@";
    
    isDynamic = [appDelegate isDynamic];
    
    [self initCategorySections];
    [self.tableView reloadData];
    if (isDynamic){
      [self startTimer];
    }
    
    welcomeMessage = [NSString stringWithFormat:welcomeMessage, appDelegate.restaurantName,
                      appDelegate.restaurantAddress, appDelegate.restaurantCity,appDelegate.restaurantState,
                      appDelegate.restaurantZip];
    
    [self.addressLabel setNumberOfLines:2];
    [self.addressLabel setText:welcomeMessage];
    
}


-(void) viewDidAppear:(BOOL)animated{
    NSString *message = @"";
    NSIndexPath *indexPath = nil;
    @try {
        
        [self initPreferredLanguage];
        [self initMenuSettings];
        
        indexPath = [self.tableView indexPathForSelectedRow];
        
        if (indexPath){
            [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
        }
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        if ([message length] > 0){
            NSLog(@"%@",message);
        }
        message = @"";
        indexPath = nil;
    }
    
   
}

-(void) viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self stopTimer];
    NSLog(@"Home View Timer stopped");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (! appDelegate){
        appDelegate = [AppDelegate currentDelegate];
    }
    [self initCategorySections];
    [self roundCorner];
    [self initTableView];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

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
    
    NSIndexPath *selectedIP = [self.tableView indexPathForSelectedRow];
    
    MenuViewController *destVC = (MenuViewController*) [segue destinationViewController];
    
    NSString *message = @"";
    
    @try {
        message = [NSString stringWithFormat:@"%@",destVC.description];
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
