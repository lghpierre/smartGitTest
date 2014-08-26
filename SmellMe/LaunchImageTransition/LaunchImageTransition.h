//
//  LaunchImageTransition.h
//  Created by http://github.com/iosdeveloper
//

#import <UIKit/UIKit.h>

@interface LaunchImageTransition : UIViewController {
	UINavigationController *nav;
    BOOL isBringNavigationCtl;
}

- (id)initWithViewController:(UIViewController *)controller animation:(UIModalTransitionStyle)transition;
- (id)initWithViewController:(UIViewController *)controller animation:(UIModalTransitionStyle)transition delay:(NSTimeInterval)seconds launchImage:(UIImage *)launchImage;

@end