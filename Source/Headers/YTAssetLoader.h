#import <UIKit/UIKit.h>

@interface YTAssetLoader : NSObject
- (instancetype)initWithBundle:(NSBundle *)bundle;
- (UIImage *)imageNamed:(NSString *)image;
- (UIImage *)tintImage:(UIImage *)image color:(UIColor *)color;
@end
