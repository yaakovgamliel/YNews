//
//  TopStatusView.m
//  Recordify
//
//  Created by yaakov gamliel on 7/8/13.
//  Copyright (c) 2013 yaakov gamliel. All rights reserved.
//

#import "TopStatusView.h"
#import "FlatUIKit.h"

#define STATUS_MESSAGE_FRAME CGRectMake(100.0f, 4.0f, 120.0f, 40.0f)

@implementation TopStatusView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _statusLabel = [[UILabel alloc]initWithFrame:STATUS_MESSAGE_FRAME];
        _statusLabel.backgroundColor = [UIColor clearColor];
        _statusLabel.font = [UIFont boldFlatFontOfSize:18.0];
        _statusLabel.textColor = [UIColor whiteColor];
        _statusLabel.adjustsFontSizeToFitWidth = YES;
        
        [self addSubview:_statusLabel];
        
        [self viewSetup];
        
//        UIGestureRecognizer *gesture = [[UIGestureRecognizer alloc]init];
//        [self addGestureRecognizer:gesture];
//        
//        [gesture addTarget:self action:@selector(testGesture)];
        
    }
    return self;
}

-(void)viewSetup {
    
    CGSize offset;
    offset.height = 0.3;
    offset.width = 0.3;
    
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = 0.6;
    self.layer.shadowRadius = 5.0;
    self.layer.shadowOffset = offset;

    
}

#pragma mark - Message Setup
- (void)setupStatusWithMessage:(NSString *)mg andColor:(UIColor *)color {
    
    self.backgroundColor = color;
    _statusLabel.text  = mg;

}

#pragma mark - Animations

- (void)performAnimation {
    [self performSelector:@selector(testAnimation) withObject:self afterDelay:1.0];
}

- (void)testAnimation {
    [UIView animateWithDuration:0.4 animations:^{
        self.frame = CGRectMake(0.0f, 0.0f, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
        [self performSelector:@selector(rollBack) withObject:self afterDelay:4.0];
    }];
}

- (void)rollBack {
    
    [UIView animateWithDuration:0.2 animations:^{
        self.frame = CGRectMake(0.0f, -50.0f, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
        NSLog(@"done animating");
    }];
    
}

@end
