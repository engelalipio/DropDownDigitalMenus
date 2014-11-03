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
-(void) initWebView;
@end

@implementation GameViewController

#pragma -mark Web View Methods

-(void)webViewDidStartLoad:(UIWebView *)webView{
    
    NSString *errMessage = @"";
    BOOL     isHidden = NO;
    
    @try{
        
        isHidden = [self.webView isHidden];
        
        if (self.webView.request != nil && ! isHidden){
            [self.webView setHidden:YES];
        }
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
            if (! isHidden){
                [self.webView setHidden:YES];
            }
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
        [self.webView setHidden:NO];
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

-(void) initWebView{
    
    NSString *message = @"",
             *html    = @"";
    
    NSURL    *url     = nil;
    @try {
        
        if (! self.webView){
            _webView = [[UIWebView alloc] init];
            [self.webView setDelegate:self];
        }
        gameSWF = @"neave_tictactoe.swf";
        gameCodeBase = @"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0";
        plugInPage = @"http://www.macromedia.com/go/getflashplayer";
        baseURL    = @"http://neave.com/tic-tac-toe/";
        
        embedHTML = @"\
        <html><head>\
        <style type=\"text/css\">\
        body {\
        background-color: transparent;\
        color: white;\
        }\
        </style>\
        </head><body style=\"margin:0\">\
        <div align=\"center\">\
        <object classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" codebase=\"%@\" width=\"642\" height=\"839\">\
        <param name=\"movie\" value=\"%@\">\
        <param name=\"quality\" value=\"high\">\
        <embed src=\"%@\" quality=\"high\" pluginspage=\"%@\" type=\"application/x-shockwave-flash\" width=\"642\" height=\"839\"></embed>\
        </object>\
        </div>\
        </html>";
        
        html = [NSString stringWithFormat:embedHTML, gameCodeBase, gameSWF, gameSWF,plugInPage];
        url  = [[NSURL alloc] initWithString:baseURL];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        [self.webView loadRequest:request];
        //[self.webView loadHTMLString:html baseURL:url];
       

        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        if ([message length] >0){
            NSLog(@"%@",message);
        }
        message = @"";
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initWebView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


 




@end
