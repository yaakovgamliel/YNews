
#import "News.h"

@implementation News

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.autor = [dictionary objectForKey:@"user"];
        self.title = [dictionary objectForKey:@"title"];
        self.url = [dictionary objectForKey:@"url"];
        self.time = [dictionary objectForKey:@"time_ago"];
    }
    
    return self;
}


@end
