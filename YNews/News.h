//
//  News.h
//  YNews
//
//  Created by yaakov gamliel on 7/23/13.
//  Copyright (c) 2013 yaakov gamliel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject


@property (nonatomic, copy) NSString *autor;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *time;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
