//
//  GameViewController.m
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 10/29/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import "GameViewController.h"
 

@interface GameViewController ()
{
    NSString *gameHTML,
             *gameSWF,
             *gameCodeBase,
             *plugInPage,
             *baseURL,
             *embedHTML;
}
-(void) prepareWebView ;
@end

@implementation GameViewController

@synthesize gameURL = _gameURL;

#pragma -mark Web View Methods

-(void)webViewDidStartLoad:(UIWebView *)webView{
    
    NSString *errMessage = @"";
    BOOL     isHidden = NO;
    
    @try{
        
        isHidden = [self.webView isHidden];
        
        [self.gameImage setAlpha:0.30f] ;
    }
    @catch(NSException *exception){
        errMessage = [exception description];
    }
    @finally{
        if ([errMessage length] > 0){
            NSLog(@"%@",errMessage);
        }
        errMessage = @"";
        isHidden = NO;
    }
}

-(BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    BOOL result   = NO,
        isHidden = NO;
    
    NSString *message= @"";
    
    @try {
        if (request != nil){
            isHidden = [self.webView isHidden];
 
            result = YES;
            message = [NSString stringWithFormat:@"shouldStartLoadWithRequest for %@",request.URL.description];
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
        isHidden = NO;
    }
    return  result;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    NSString *errMessage = @"";
    
    @try{
         [self.gameImage setAlpha:0.0f] ;
    }
    @catch(NSException *exception){
        errMessage = [exception description];
    }
    @finally{
        if ([errMessage length] > 0){
            NSLog(@"%@",errMessage);
        }
        errMessage = @"";
        
    }
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSString *errMessage = @"";
    NSURLRequest *urlRequest = nil;
    @try{
        if (error){
            
            errMessage = [NSString stringWithFormat:@"Error Loading %@ in WebView with the following %@, trying again...",
                          [webView.request.URL description] ,
                          [error description]];
            
            urlRequest = [[NSURLRequest alloc] initWithURL:webView.request.URL];
            
            [self webView:webView shouldStartLoadWithRequest:urlRequest navigationType:UIWebViewNavigationTypeReload];
            
        }
    }
    @catch(NSException *exception){
        errMessage = [error description];
    }
    @finally{
        if ([errMessage length] > 0){
            NSLog(@"%@",errMessage);
        }
        errMessage = @"";
        urlRequest = nil;
    }
    
}



#pragma -mark Utility Methods

-(void) prepareWebView{
    
    NSString *vUrl = [NSString stringWithFormat:@"http://%@", self.gameURL] ;
    
    NSURLRequest *request = nil;
    
    NSURL *url = [NSURL URLWithString:vUrl];
    
    request = [[NSURLRequest alloc] initWithURL:url];
    
    if ([vUrl length] > 0){
        
        url  = [NSURL URLWithString:vUrl];
        [self.webView setDelegate:self];
        
        [self.webView loadRequest:request];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self prepareWebView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)backAction:(UIButton *)sender {
    self.gameURL = @"";
    [self dismissViewControllerAnimated:NO completion:nil];
}
- (IBAction)closeAction:(UIBarButtonItem *)sender {
    [self backAction:nil];
}
@end
