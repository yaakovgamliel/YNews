
#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"


@interface YNewsClient : AFHTTPClient

+ (id)sharedInstance;
- (void)getNewsForTableView:(UITableView *)table ForDataSource:(NSMutableArray *)data;


@end
