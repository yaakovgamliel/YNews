//
//  YNewsWebViewController.m
//  YNews
//
//  Created by yaakov gamliel on 7/22/13.
//  Copyright (c) 2013 yaakov gamliel. All rights reserved.
//

#import "YNewsWebViewController.h"
#import "SVProgressHUD.h"
#import "PocketAPI.h"
#import "TopStatusView.h"
#import "FlatUIKit.h"
#import "AFNetworkActivityIndicatorManager.h"

@interface YNewsWebViewController ()

@property (strong,nonatomic) UIWebView *webPage;

@end

@implementation YNewsWebViewController


- (id)initWithRequestURL:(NSURLRequest *)request {
    self = [super init];
    if (self) {
        _webPage = [[UIWebView alloc]initWithFrame:self.view.bounds];
        _webPage.scalesPageToFit = YES;
        [self.view addSubview:_webPage];
        self.requestPage = request;
        [_webPage loadRequest:_requestPage];
    }
    
    return self;
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

    UIBarButtonItem *barButton = [UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil];
    
    [barButton setBackgroundImage:[[UIImage imageNamed:@"nav-button"] stretchableImageWithLeftCapWidth:6 topCapHeight:0] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
	[barButton setBackgroundImage:[[UIImage imageNamed:@"nav-button-highlighted"] stretchableImageWithLeftCapWidth:6 topCapHeight:0] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
	
	// Navigation back button
	[barButton setBackButtonTitlePositionAdjustment:UIOffsetMake(2.0f, -2.0f) forBarMetrics:UIBarMetricsDefault];
	[barButton setBackButtonBackgroundImage:[[UIImage imageNamed:@"nav-back"] stretchableImageWithLeftCapWidth:13 topCapHeight:0] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
	[barButton setBackButtonBackgroundImage:[[UIImage imageNamed:@"nav-back-highlighted"] stretchableImageWithLeftCapWidth:13 topCapHeight:0] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
	
    
    UIBarButtonItem *pocketbutton  = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addToPocket)];
    
    self.navigationItem.rightBarButtonItem = pocketbutton;

    
    
}

- (void)addToPocket{
       
    if ([[PocketAPI sharedAPI]username]) {
        
        NSURLRequest *req = _webPage.request;
        NSURL *url = req.URL;
        
        [[PocketAPI sharedAPI] saveURL:url handler: ^(PocketAPI *API, NSURL *URL,
                                                      NSError *error){
            if(error){
                // there was an issue connecting to Pocket
                // present some UI to notify if necessary
                
                TopStatusView *statusMsg = [[TopStatusView alloc]initWithFrame:CGRectMake(0.0f, -50.0f, self.view.frame.size.width, 50.0f)];
                [self.view addSubview:statusMsg];
                
                [statusMsg setupStatusWithMessage:@"Error!" andColor:[UIColor alizarinColor]];
                [statusMsg performAnimation];
                

            }else{
                // the URL was saved successfully
                TopStatusView *statusMsg = [[TopStatusView alloc]initWithFrame:CGRectMake(0.0f, -50.0f, self.view.frame.size.width, 50.0f)];
                [self.view addSubview:statusMsg];
                
                [statusMsg setupStatusWithMessage:@"Its in Pocket!" andColor:[UIColor sunflowerColor]];
                [statusMsg performAnimation];

            }
        }];
        
    }
    
    else {
        [[PocketAPI sharedAPI] loginWithHandler: ^(PocketAPI *API, NSError *error){
            if (error != nil)
            {
                // There was an error when authorizing the user.
                // The most common error is that the user denied access to your application.
                // The error object will contain a human readable error message that you
                // should display to the user. Ex: Show an UIAlertView with the message
                // from error.localizedDescription
            }
            else
            {
                // The user logged in successfully, your app can now make requests.
                // [API username] will return the logged-in user’s username
                // and API.loggedIn will == YES
            }
        }];

    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
