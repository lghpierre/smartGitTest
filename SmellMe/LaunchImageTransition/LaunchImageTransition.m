//
//  LaunchImageTransition.m
//  Created by http://github.com/iosdeveloper
//

#import "LaunchImageTransition.h"

@implementation LaunchImageTransition

- (id)initWithViewController:(UIViewController *)controller animation:(UIModalTransitionStyle)transition{
    return [self initWithViewController:controller animation:transition delay:0.0 launchImage:nil];
}

- (id)initWithViewController:(UIViewController *)controller animation:(UIModalTransitionStyle)transition delay:(NSTimeInterval)seconds launchImage:(UIImage *)launchImage{
	self = [super init];
	if (self) {
        //调用status bar函数
                
		NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];

		NSString *launchImageFile = [infoDictionary objectForKey:@"UILaunchImageFile"];

		NSString *launchImageFileiPhone = [infoDictionary objectForKey:@"UILaunchImageFile~iphone"];
		
        //自定义登录图片文件名
        NSString *customLaunchName = [[NSUserDefaults standardUserDefaults] objectForKey:@"customLaunchImage"];
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        [imgView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight ];
        [imgView setContentMode:UIViewContentModeRedraw];
        
        if (customLaunchName != nil && ![customLaunchName isEqualToString:@""]) {
            NSLog(@"自定义登录图片");
            [imgView setImage:[UIImage imageNamed:@"边牧"]];
            imgView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:imgView];
        }else{
            if ([UIImage imageNamed:launchImageFile] != nil) {
                NSLog(@"系统登录图片1");
                [imgView setImage:[UIImage imageNamed:launchImageFile]];
                [self.view addSubview:imgView];
                NSLog(@"登录1图片%@",[UIImage imageNamed:launchImageFile]);
            }else if ([UIImage imageNamed:launchImageFileiPhone] != nil){
                NSLog(@"系统登录图片2");
                [imgView setImage:[UIImage imageNamed:launchImageFileiPhone]];
                [self.view addSubview:imgView];
            }
        }
    
		[controller setModalTransitionStyle:transition];
		
		[NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector(timerFireMethod:) userInfo:controller repeats:NO];
	}
	
	return self;
}

- (void)timerFireMethod:(NSTimer *)theTimer {
    //推出导航控制器
    [self presentViewController:[theTimer userInfo] animated:YES completion:^{}];
    [UIApplication sharedApplication].statusBarHidden = NO;
}

-(void)viewWillAppear:(BOOL)animated{
    [UIApplication sharedApplication].statusBarHidden = YES;
}
@end