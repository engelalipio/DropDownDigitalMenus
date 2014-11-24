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


@interface HomeViewController ()
{
    NSArray *categorySections,
            *categoryHomeData;
    PageContentViewController *currentContent;
}
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
    //ADBannerView *footer = nil;
    UIImageView *footer = nil;
    UIImage *image = nil;
    NSString *message = @"";
    @try {
        
        footer = [[UIImageView alloc]
                  initWithImage:[UIImage imageNamed:@"your_ad_here_banner.jpg"]];
        
 
        [footer setFrame:CGRectMake(0, 0,  self.tableView.frame.size.width, 60)];
   

        
       /* footer = [[ADBannerView alloc] initWithAdType:ADAdTypeBanner];
        [footer setDelegate:self];
        [footer setFrame:CGRectMake(0.0f, 0.0f, self.tableView.frame.size.width, 60)];
        
        message = [NSString stringWithFormat:@"Sucessfully initialized [initWithAdType:ADAdTypeBanner]"];*/
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
             *cellId    = @"";
    
    UITableViewCell *cell = nil;
    
    @try {
        
        switch (indexPath.row) {
            case 0:
                cellId = @"cbDrinksCell";
                break;
            case 1:
                cellId = @"cbAppsCell";
                break;
            case 2:
                cellId = @"cbSoupsCell";
                break;
            case 3:
                cellId = @"cbSaladsCell";
                break;
            case 4:
                cellId = @"cbEntreesCell";
                break;
            case 5:
                cellId = @"cbDessertsCell";
                break;
        }
        
        cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        
        if (! cell){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                          reuseIdentifier:cellId];
            
        }

        title = [categoryHomeData objectAtIndex:indexPath.row];
        
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
        cell.textLabel.backgroundColor = kTableCellTitleColor;
        [cell.textLabel setFont:[UIFont systemFontOfSize:22.0]];
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
                restaurantImages = [restaurantDetail objectForKey:@"items"];
                
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
    
    if (self.timer == nil){
        
        self.timer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeInterval:3 sinceDate:[NSDate date]]
                                              interval:3 target:self
                                              selector:@selector(timerFireMethod:)
                                              userInfo:nil
                                               repeats:YES];
        
        self.loop = [NSRunLoop currentRunLoop];
        [self.loop addTimer:self.timer forMode:NSDefaultRunLoopMode];
    }
    
}

-(void)stopTimer{
    if (self.timer != nil){
        [self.timer invalidate];
    }
    NSLog(@"Stopped timer");
    self.timer = nil;
}


- (void)timerFireMethod:(NSTimer *)t{
    
    NSUInteger nextIndex = -1;
    NSArray *viewControllers= nil;
    PageContentViewController *pageContent = nil;
    NSString *message= @"",
             *imageName = @"";
    @try {
        
        
        nextIndex = [self currentPageIndex];
        
        nextIndex++;
        
        if (nextIndex >= [self.pageTitles count]){
            nextIndex = 0;
        }
        
        pageContent = [self viewControllerAtIndex:nextIndex];
        
        viewControllers = [[NSArray alloc] initWithObjects:pageContent, nil];
        
 
        
       /* [self setViewControllers:viewControllers
                       direction:UIPageViewControllerNavigationDirectionForward
                        animated:NO
                      completion:nil];*/
        
        _currentPageIndex = nextIndex;
        
        currentContent = pageContent;
        
        if (currentContent){
            
            imageName = [self.pageTitles objectAtIndex:self.currentPageIndex];
            
            
            if (self.imageView){
                [self.imageView setImage:[UIImage imageNamed:imageName]];
            }
        }
        
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        
        if ([message length] > 0){
            NSLog(@"%@",message);
        }
        viewControllers = nil;
        
    }
    
}

-(void) initCategorySections{
    
    NSString *message = @"";
    
    @try{
        
        
        categoryHomeData = [[NSArray alloc] initWithObjects:@"Beverages",@"Appetizers",@"Soups",@"Salads",@"Entrees",@"Desserts", nil];
        
        self.pageTitles  = [[NSArray alloc] initWithObjects:@"RestaurantBack_8.jpg", nil];
        
        categorySections = @[ @{ @"description": @"Casa D'Angelo",
                                 @"items": @[ @{ @"image": @"RestaurantBack_7.jpg" },
                                              @{ @"image": @"RestaurantBack_8.jpg" }
                                              ]
                                 }/*@{ @"description": @"Drinks",
                         @"items": @[ @{ @"title": @"Article A1" },
                                         @{ @"title": @"Article A2" },
                                         @{ @"title": @"Article A3" },
                                         @{ @"title": @"Article A4" },
                                         @{ @"title": @"Article A5" }
                                         ]
                         },
                      @{ @"description": @"Appetizers",
                         @"items": @[ @{ @"title": @"Article B1" },
                                         @{ @"title": @"Article B2" },
                                         @{ @"title": @"Article B3" },
                                         @{ @"title": @"Article B4" },
                                         @{ @"title": @"Article B5" }
                                         ]
                         },
                      @{ @"description": @"Meats",
                         @"items": @[ @{ @"title": @"Article C1" },
                                         @{ @"title": @"Article C2" },
                                         @{ @"title": @"Article C3" },
                                         @{ @"title": @"Article C4" },
                                         @{ @"title": @"Article C5" }
                                         ]
                         },
                      @{ @"description": @"Desserts",
                         @"items": @[ @{ @"title": @"Article D1" },
                                         @{ @"title": @"Article D2" },
                                         @{ @"title": @"Article D3" },
                                         @{ @"title": @"Article D4" },
                                         @{ @"title": @"Article D5" }
                                         ]
                         }*/
                      ];
        
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
        
        
        /*[self.tableView registerClass:[ContainerTableCellTableViewCell class]
               forCellReuseIdentifier:@"ContainerTableCell"];*/
        
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


-(void) viewDidAppear:(BOOL)animated{
    NSString *message = @"";
    NSIndexPath *indexPath = nil;
    @try {
            [self startTimer];
        
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
    [self roundCorner];
    [self initCategorySections];
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
