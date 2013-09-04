
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface TopStatusView : UIView
@property (nonatomic,strong) UILabel *statusLabel;
- (void)setupStatusWithMessage:(NSString *)mg andColor:(UIColor *)color;
- (void)performAnimation;
@end
