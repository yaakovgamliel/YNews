#import "YNewsClient.h"
#import "News.h"
#import "AFJSONRequestOperation.h"
#import "SVProgressHUD.h"

#define BeersAPIBaseURLString @"http://aqueous-oasis-1132.herokuapp.com"

@implementation YNewsClient

+ (id)sharedInstance {
    static YNewsClient *__sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[YNewsClient alloc] initWithBaseURL:[NSURL URLWithString:BeersAPIBaseURLString]];
    });
    
    return __sharedInstance;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        //custom settings
        
        
        //[self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    }
    
    return self;
}

- (void)getNewsForTableView:(UITableView *)table ForDataSource:(NSMutableArray *)data{
    NSURL *url = [NSURL URLWithString:@"http://node-hnapi.herokuapp.com/news"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [SVProgressHUD show];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
       //NSMutableArray *weGotThis = [[NSMutableArray alloc]init];
        for (id stuff in JSON) {
            News *news = [[News alloc]initWithDictionary:stuff];
            [data addObject:news];
            // NSLog(@"%@",JSON);
        }
        
        [SVProgressHUD dismiss];
        [table reloadData];
    }failure:nil];
    
    [operation start];
}

@end
