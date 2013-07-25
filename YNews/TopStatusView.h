//
//  TopStatusView.h
//  Recordify
//
//  Created by yaakov gamliel on 7/8/13.
//  Copyright (c) 2013 yaakov gamliel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface TopStatusView : UIView
@property (nonatomic,strong) UILabel *statusLabel;
- (void)setupStatusWithMessage:(NSString *)mg andColor:(UIColor *)color;
- (void)performAnimation;
@end
