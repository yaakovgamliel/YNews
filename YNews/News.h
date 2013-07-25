
#import <Foundation/Foundation.h>

@interface News : NSObject


@property (nonatomic, copy) NSString *autor;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *time;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
