//
//  YNewsWebViewController.h
//  YNews
//
//  Created by yaakov gamliel on 7/22/13.
//  Copyright (c) 2013 yaakov gamliel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YNewsWebViewController : UIViewController
@property (strong,nonatomic) NSURLRequest *requestPage;
- (id)initWithRequestURL:(NSURLRequest *)request;
@end
