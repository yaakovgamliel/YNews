//
//  YNewsCell.h
//  YNews
//
//  Created by yaakov gamliel on 7/22/13.
//  Copyright (c) 2013 yaakov gamliel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YNewsCell : UITableViewCell
@property (strong,nonatomic) IBOutlet UILabel *titleLable;
@property (strong,nonatomic) IBOutlet UILabel *autorLable;
@property (strong,nonatomic) IBOutlet UILabel *time;

@end
