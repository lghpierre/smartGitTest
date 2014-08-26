//
//  HNFirstViewController.h
//  PetPet
//
//  Created by frostyhot on 14-1-10.
//  Copyright (c) 2014年 frostyhot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HNFirstViewController : UIViewController
{

}
//导航栏部分控件
@property (strong, nonatomic) IBOutlet UIView *customNavigationBarBackground;
@property (strong, nonatomic) IBOutlet UIView *customNavigationBarDecroView1;
@property (strong, nonatomic) IBOutlet UIView *customNavigationBarDecroView2;
@property (strong, nonatomic) IBOutlet UIView *customNavigationBarVisibleView;
@property (strong, nonatomic) IBOutlet UIView *customNavigationBarLeftLine1;
@property (strong, nonatomic) IBOutlet UIView *customNavigationBarLeftLine2;
@property (strong, nonatomic) IBOutlet UIView *customNavigationBarRightLine1;
@property (strong, nonatomic) IBOutlet UIView *customNavigationBarRightLine2;
- (IBAction)leftNavigationBarItemClick:(id)sender;
- (IBAction)rightNavigationBarItemClick:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *middleNavigationBarItemClick;



@end
