//
//  HNTabBarController.m
//  PetPet
//
//  Created by frostyhot on 14-1-10.
//  Copyright (c) 2014年 frostyhot. All rights reserved.
//

#import "HNTabBarController.h"

@interface HNTabBarController ()

@end

@implementation HNTabBarController

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
    
    [self customNavigationBar];

    [self customTabBar];
    
    
    // Do any additional setup after loading the view from its nib.
}

-(void)customTabBar{
    //自定义tabbar背景
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, self.tabBar.viewForBaselineLayout.frame.size.height)];
    bgView.clipsToBounds = YES;
    bgView.layer.borderWidth = 0.5;
    bgView.layer.borderColor = [UIColor colorWithRed:156/255.0 green:84/255.0 blue:91/255.0 alpha:1.0].CGColor;
    //背景图片拉伸
    UIImageView *bgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(-320, 0, 640, 48)];
    UIImage *bgImage = [UIImage imageNamed:@"camera_logo"];
    bgImgView.image = bgImage;
    [bgImgView setImage:[bgImage stretchableImageWithLeftCapWidth:220 topCapHeight:20]];
    [bgView addSubview:bgImgView];
    
    [self.tabBar addSubview:bgView];
    
    //5个button
    for (int i = 0; i < 5; i++) {
        //view
        static int viewWidth = 0;
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(viewWidth, 1, 64, bgView.frame.size.height - 1)];
        [view setBackgroundColor:[UIColor clearColor]];
        [bgView addSubview:view];
        //btn
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = 100 + i;
        btn.backgroundColor = [UIColor clearColor];
        [btn setImage:[UIImage imageNamed:@"titlebar_press"] forState:UIControlStateSelected];
        btn.frame = CGRectMake(0, 0, 64, view.frame.size.height);
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
        //imgView
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 2, 44, 44)];
        [view addSubview:imgView];
        imgView.backgroundColor = [UIColor clearColor];
        //label
        //        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 35, 24, 10)];
        //        label.textAlignment = NSTextAlignmentCenter;
        //        label.font = [UIFont systemFontOfSize:10];
        //        [view addSubview:label];
        switch (i) {
            case 0:
                [imgView setImage:[UIImage imageNamed:@"star_pet_normal"]];
                break;
            case 1:
                [imgView setImage:[UIImage imageNamed:@"group_unclick"]];
                break;
            case 2:
                [imgView setImage:[UIImage imageNamed:@"pet_around_normal"]];
                break;
            case 3:
                [imgView setImage:[UIImage imageNamed:@"pet_star_normal"]];
                break;
            case 4:
                [imgView setImage:[UIImage imageNamed:@"pet_all_normal"]];
                break;
            default:
                break;
        }
        viewWidth += 64;
    }
}


#pragma mark --
#pragma mark --自定义主功能函数,渐变图层
//添加渐变色图层函数
-(void)gradientLayerWithUIView:(UIView*)view colors:(NSArray*)colorsArray layerSize:(CGSize)layersize{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = CGRectMake(0, 0, layersize.width, layersize.height);
    gradient.colors = colorsArray;
    [view.layer insertSublayer:gradient atIndex:0];
}

#pragma mark --
#pragma mark --自定义主功能函数,自定义导航栏
//只需要hidden右边的线
-(void)customNavigationBar{
    //以下自定义导航栏,首先是放各种view的baseView
    UIView *customNavigationBarBackground = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 320, 40)];
    customNavigationBarBackground.layer.borderColor = [UIColor colorWithRed:166/255.0 green:107/255.0 blue:111/255.0 alpha:0.5].CGColor;
    customNavigationBarBackground.layer.borderWidth = 0.5;
    customNavigationBarBackground.layer.cornerRadius = 5.0;
    [self.view addSubview:customNavigationBarBackground];

    //上面的线添加渐变色
    UIView *customNavigationBarDecroView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 3)];
    [self gradientLayerWithUIView:customNavigationBarDecroView1 colors:[NSArray arrayWithObjects:(id)[UIColor colorWithRed:249/255.0 green:163/255.0 blue:167/255.0 alpha:1.0].CGColor,(id)[UIColor navigationBarColorEnd].CGColor,nil] layerSize:customNavigationBarDecroView1.frame.size];
    [customNavigationBarBackground addSubview:customNavigationBarDecroView1];
    
    //中间View添加渐变色
    self.customNavigationBarVisibleView = [[UIView alloc] initWithFrame:CGRectMake(0, 3, 320, 38)];
    [self gradientLayerWithUIView:self.customNavigationBarVisibleView colors:[NSArray arrayWithObjects:(id)[UIColor navigationBarColorBegin].CGColor,(id)[UIColor navigationBarColorEnd].CGColor,nil] layerSize:self.customNavigationBarVisibleView.frame.size];
    [customNavigationBarBackground addSubview:self.customNavigationBarVisibleView];
    
    //下面的线添加渐变色
    UIView *customNavigationBarDecroView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 41, 320, 3)];
    [self gradientLayerWithUIView:customNavigationBarDecroView2 colors:[NSArray arrayWithObjects:(id)[UIColor navigationBarColorEnd].CGColor,(id)[UIColor colorWithRed:249/255.0 green:163/255.0 blue:167/255.0 alpha:1.0].CGColor,nil] layerSize:customNavigationBarDecroView2.frame.size];
    [customNavigationBarBackground addSubview:customNavigationBarDecroView2];
    
    //下面是导航栏上面的分割线
    UIView *customNavigationBarLeftLine1 = [[UIView alloc] initWithFrame:CGRectMake(50, 0, 1, 44)];
    [self gradientLayerWithUIView:customNavigationBarLeftLine1 colors:[NSArray arrayWithObjects:(id)[UIColor colorWithRed:240/255.0 green:120/255.0 blue:126/255.0 alpha:1.0].CGColor,(id)[UIColor colorWithRed:183/255.0 green:81/255.0 blue:85/255.0 alpha:1.0].CGColor,nil] layerSize:customNavigationBarLeftLine1.frame.size];
    [customNavigationBarBackground addSubview:customNavigationBarLeftLine1];
    
    UIView *customNavigationBarLeftLine2 = [[UIView alloc] initWithFrame:CGRectMake(51, 0, 1, 44)];
    [self gradientLayerWithUIView:customNavigationBarLeftLine2 colors:[NSArray arrayWithObjects:(id)[UIColor colorWithRed:231/255.0 green:122/255.0 blue:127/255.0 alpha:1.0].CGColor,(id)[UIColor colorWithRed:236/255.0 green:122/255.0 blue:131/255.0 alpha:1.0].CGColor,nil] layerSize:customNavigationBarLeftLine2.frame.size];
    [customNavigationBarBackground addSubview:customNavigationBarLeftLine2];
    
    //右边可隐藏的两条线
    self.customNavigationBarRightLine1 = [[UIView alloc] initWithFrame:CGRectMake(269, 0, 1, 44)];
    [customNavigationBarBackground addSubview:self.customNavigationBarRightLine1];
    [self gradientLayerWithUIView:self.customNavigationBarRightLine1 colors:[NSArray arrayWithObjects:(id)[UIColor colorWithRed:240/255.0 green:120/255.0 blue:126/255.0 alpha:1.0].CGColor,(id)[UIColor colorWithRed:183/255.0 green:81/255.0 blue:85/255.0 alpha:1.0].CGColor,nil] layerSize:self.customNavigationBarRightLine1.frame.size];
    
    self.customNavigationBarRightLine2 = [[UIView alloc] initWithFrame:CGRectMake(270, 0, 1, 44)];
    [customNavigationBarBackground addSubview:self.customNavigationBarRightLine2];
    [self gradientLayerWithUIView:self.customNavigationBarRightLine2 colors:[NSArray arrayWithObjects:(id)[UIColor colorWithRed:231/255.0 green:122/255.0 blue:127/255.0 alpha:1.0].CGColor,(id)[UIColor colorWithRed:236/255.0 green:122/255.0 blue:131/255.0 alpha:1.0].CGColor,nil] layerSize:self.customNavigationBarRightLine2.frame.size];
    
    
    //导航栏左边的button,一个Button一个UIImageView添加在一个UIView上面
    UIView *leftBtnView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 48, 38)];
    [self.customNavigationBarVisibleView addSubview:leftBtnView];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(3, 0, 43, 38);
    [leftBtn addTarget:self action:@selector(leftNavigationBarItemClick) forControlEvents:UIControlEventTouchUpInside];
    leftBtn.backgroundColor = [UIColor clearColor];

    [leftBtnView addSubview:leftBtn];
    
    UIImageView *leftImgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 4, 30, 30)];
    [leftImgView setImage:[UIImage imageNamed:@"menu_open_bg"]];
    [leftBtnView addSubview:leftImgView];
    
}


#pragma mark -- TabbarItemBtnClicked
-(void)btnClick:(UIButton*)btn{
    for (int i = 0; i < 5; i++) {
        UIButton *tempBtn = (UIButton*)[self.view viewWithTag:100 + i];
        tempBtn.selected = NO;
    }
    btn.selected = YES;
    switch (btn.tag) {
        case 100:
            self.selectedIndex = 0;
            break;
        case 101:
            self.selectedIndex = 1;
            break;
        case 102:
            self.selectedIndex = 2;
            break;
        case 103:
            self.selectedIndex = 3;
            break;
        case 104:
            self.selectedIndex = 4;
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)leftNavigationBarItemClick{
    NSLog(@"leftNavigationBarItemClick");
}
@end
