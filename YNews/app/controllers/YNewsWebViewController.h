
#import <UIKit/UIKit.h>

@interface YNewsWebViewController : UIViewController
@property (strong,nonatomic) NSURLRequest *requestPage;
- (id)initWithRequestURL:(NSURLRequest *)request;
@end
