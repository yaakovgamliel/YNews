//
//  YNewsClient.h
//  YNews
//
//  Created by yaakov gamliel on 7/22/13.
//  Copyright (c) 2013 yaakov gamliel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"


@interface YNewsClient : AFHTTPClient

+ (id)sharedInstance;
- (void)getNewsForTableView:(UITableView *)table ForDataSource:(NSMutableArray *)data;


@end
