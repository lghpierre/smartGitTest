//
//  HNGroupsTabBarController.m
//  PetPet
//
//  Created by frostyhot on 14-1-20.
//  Copyright (c) 2014年 frostyhot. All rights reserved.
//

#import "HNGroupsTabBarController.h"
#import "HNTabBarController.h"
@interface HNGroupsTabBarController ()
{
    HNTabBarController *tabbar;
    UIView *groupsNavigationBarCenterBackgroundView;
}
@end

@implementation HNGroupsTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.selectedIndex = 0;
    
}
-(void)customNavigationBar{
    tabbar = (HNTabBarController*)self.tabBarController;
    tabbar.customNavigationBarRightLine1.hidden = YES;
    tabbar.customNavigationBarRightLine2.hidden = YES;
    
    groupsNavigationBarCenterBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(60, 20, 200, 38)];
    [tabbar.customNavigationBarVisibleView addSubview:groupsNavigationBarCenterBackgroundView];
    
    //中部3个button,这个页面没有导航栏的右边按键
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(0, 0, 75, 30);
    btn2.center = CGPointMake(100, 0);
    btn2.tag = 11;
    
    [btn2 addTarget:self action:@selector(groupsNavigationBarCenterBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setImage:[UIImage imageNamed:@"crop_left_unclick.png"] forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:@"crop_left_click"] forState:UIControlStateSelected];
    [groupsNavigationBarCenterBackgroundView addSubview:btn2];
    UILabel *lable2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
    lable2.center = CGPointMake(100, 0);
    lable2.text = @"动态";
    lable2.font = [UIFont systemFontOfSize:13];
    lable2.textAlignment = NSTextAlignmentCenter;
    lable2.textColor = [UIColor whiteColor];
    [groupsNavigationBarCenterBackgroundView addSubview:lable2];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(0, 0, 50, 30);
    btn1.center = CGPointMake(50, 0);
    btn1.tag = 10;
    [btn1 setImage:[UIImage imageNamed:@"crop_left_unclick.png"] forState:UIControlStateNormal];
    [btn1 setImage:[UIImage imageNamed:@"crop_left_click"] forState:UIControlStateSelected];
    [btn1 addTarget:self action:@selector(groupsNavigationBarCenterBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    btn1.selected = YES;
    [groupsNavigationBarCenterBackgroundView addSubview:btn1];
    UILabel *lable1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
    lable1.center = CGPointMake(50, 0);
    lable1.text = @"我的";
    lable1.font = [UIFont systemFontOfSize:13];
    lable1.textAlignment = NSTextAlignmentCenter;
    lable1.textColor = [UIColor whiteColor];
    [groupsNavigationBarCenterBackgroundView addSubview:lable1];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(0, 0, 50, 30);
    btn3.center = CGPointMake(150, 0);
    btn3.tag = 12;
    [btn3 addTarget:self action:@selector(groupsNavigationBarCenterBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [btn3 setImage:[UIImage imageNamed:@"crop_right_unclick.png"] forState:UIControlStateNormal];
    [btn3 setImage:[UIImage imageNamed:@"crop_right_click.png"] forState:UIControlStateSelected];
    [groupsNavigationBarCenterBackgroundView addSubview:btn3];
    UILabel *lable3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
    lable3.center = CGPointMake(150, 0);
    lable3.text = @"全部";
    lable3.font = [UIFont systemFontOfSize:13];
    lable3.textAlignment = NSTextAlignmentCenter;
    lable3.textColor = [UIColor whiteColor];
    [groupsNavigationBarCenterBackgroundView addSubview:lable3];
    
}
-(void)groupsNavigationBarCenterBtnClicked:(UIButton*)btn{
    for (int i = 0; i < 3; i++) {
        UIButton *btnx = (UIButton*)[tabbar.view viewWithTag:i + 10];
        btnx.selected = NO;
    }
    btn.selected = YES;
    self.selectedIndex = btn.tag - 10;
    [tabbar.view bringSubviewToFront:self.view];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [self customNavigationBar];
}
-(void)viewDidDisappear:(BOOL)animated{
    [groupsNavigationBarCenterBackgroundView removeFromSuperview];
}
@end
