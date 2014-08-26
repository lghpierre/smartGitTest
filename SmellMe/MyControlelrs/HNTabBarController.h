//
//  HNTabBarController.h
//  PetPet
//
//  Created by frostyhot on 14-1-10.
//  Copyright (c) 2014年 frostyhot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HNTabBarController : UITabBarController

//四个可以修改的视图
@property (strong, nonatomic) UIView *customNavigationBarVisibleView;

@property (strong, nonatomic) UIView *customNavigationBarRightLine1;
@property (strong, nonatomic) UIView *customNavigationBarRightLine2;

@end
