//
//  MFPageContentViewController.m
//  AirBordan
//
//  Created by Engel Alipio on 9/7/14.
//  Copyright (c) 2014 MainFrame. All rights reserved.
//

#import "PageContentViewController.h"
#import "HomeViewController.h"

@interface PageContentViewController ()
-(void) prepareContent;

@end


@implementation PageContentViewController

@synthesize pageIndex = _pageIndex;
@synthesize imageFile = _imageFile;
@synthesize titleText = _titleText;
@synthesize frameRect = _frameRect;

-(void) prepareContent{
    
    if (self.titleLabel == nil){
        self.titleLabel = [[UILabel alloc] init];
    }
    
    if (self.backgroundImageView == nil){
        _backgroundImageView = [[UIImageView alloc]init];
    }
    
     [self.titleLabel setText:self.titleText];
    
    UIImage *image = [UIImage imageNamed:self.imageFile];
    //[self.backgroundImageView setContentMode: UIViewContentModeScaleAspectFit];
    [self.backgroundImageView setContentMode: UIViewContentModeScaleToFill];
    [self.backgroundImageView setImage:image];
    
    [self.view setFrame:self.frameRect];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self prepareContent];
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)exploreAction:(UIButton *)sender {
    
     NSString *message = @"";
    HomeViewController *parentViewController = nil;
    @try {
        
        message = @"Stopping Timer";
       
        parentViewController = (HomeViewController*) [self parentViewController];
        
        if (parentViewController){
            [parentViewController stopTimer];
        }
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        if ([message length]> 0){
            NSLog(@"%@",message);
        }
        message= @"";
    }
}

- (IBAction)signInAction:(UIButton *)sender {
}

- (IBAction)SignUpAction:(UIButton *)sender {
}
@end
