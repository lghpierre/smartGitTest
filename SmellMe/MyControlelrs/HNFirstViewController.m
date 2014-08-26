//
//  HNViewController.m
//  PetPet
//
//  Created by frostyhot on 14-1-6.
//  Copyright (c) 2014年 frostyhot. All rights reserved.
//

#import "HNFirstViewController.h"
#import "UIImageView+WebCache.h"
#import "ASIFormDataRequest.h"
#import "ASIHTTPRequest.h"
#import "JSON.h"
#import "MJRefresh.h"
#import <QuartzCore/QuartzCore.h>
#import <MobileCoreServices/UTCoreTypes.h>

#import "PetMainCell.h"
#import "HNFirstViewHeaderModel.h"
#import "HNLocalModel.h"
#import "HNFirstTableViewCellModel.h"
#import "HNTabBarController.h"

static NSString *reusedId = @"reusedId";
//导航栏标题:
NSString *navigationBarLabelText1 = @"最新";
NSString *navigationBarLabelText2 = @"视频";
NSString *navigationBarLabelText3 = @"图片";
NSString *navigationBarLabelTextPull1 = @"全部";
NSString *navigationBarLabelTextPull2 = @"只看视频";
NSString *navigationBarLabelTextPull3 = @"只看图片";

@interface HNFirstViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,MJRefreshBaseViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    NSMutableArray *navigationBarLabelTitles;
    NSMutableArray *navigationBarLabelPullTitles;
    NSMutableArray *scrollViewImages;
    NSTimer *scrollTimer;
    
    NSMutableArray *tableViewCellModels;
    
    UIView *navigationBarMiddleView;
    UILabel *navigationBarLabel;
//    UIImageView *navigationBarMiddleImgView;
//    UIButton *navigationBarMiddleBtn;
    
    UIView *pullView;
    UIView *photoBackgroundView;
    UIView *photoView;
    
    UIView *rightBackgroundView;
//    UIButton *rightBtn;
    
    MJRefreshHeaderView *mjHeader;
    MJRefreshFooterView *mjFooter;
}
//tableView部分
@property (strong, nonatomic) IBOutlet UITableView *newsTableView;
@property (strong, nonatomic) IBOutlet UIView *headView;
@property (strong, nonatomic) IBOutlet UIScrollView *headScrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageCtl;


@end

@implementation HNFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(NSString *)getDocumentFilePath:(NSString *)fileName {
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    return [documentPath stringByAppendingPathComponent:fileName];
}

#pragma mark --
#pragma mark --自定义主功能函数,这是数据初始化
//初始化数据的函数
-(void)loadScrollViewData{
    scrollViewImages = [NSMutableArray array];
    
    NSURL *url = [NSURL URLWithString:GETBANNERPICLIST];
#if 0
{//系统post方法
    //根据url初始化request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:10];
    
    //分界线的标识符
    NSString *TWITTERFON_FORM_BOUNDARY = @"Boundary+0xAbCdEfGbOuNdArY";
    //分界线 --Boundary+0xAbCdEfGbOuNdArY
    NSString *MPboundary=[[NSString alloc]initWithFormat:@"--%@",TWITTERFON_FORM_BOUNDARY];
    //结束符 Boundary+0xAbCdEfGbOuNdArY--
    NSString *endMPboundary=[[NSString alloc]initWithFormat:@"%@--",MPboundary];
    //http body的字符串
    NSMutableString *body = [[NSMutableString alloc] init];
    
//开始拼凑
    ////添加分界线，换行
    [body appendFormat:@"%@\r\n",MPboundary];
    //添加字段名称，换2行
    [body appendFormat:@"%@",@"Content-Disposition: form-data; name=\"cparam\"\r\n\r\n"];
    //添加字段的值
    [body appendFormat:@"%@\r\n",@"a85ee74d85a28a7a74787a746fb0c6b3c2b56581846e6e86826784b5beb3ccb5b2bcc7a2c2b573747aa9bab0c0b2c6c7b8c5cdbbb4c2c0b4b4c3a67e8a7d67807da2ccb5b9bfcdb5b8b0bca2887e6cb3d3a9b2c2bfb4c5c9a6c1bb686b76aebab49587a5ad97b4c2c0b3b4c3a6827a7967757aa2ccb56fa585746e75b0b8b4c3a680866f677eaebab47e987d867567b0bca27a7e6cb3d3a9b4c2c0b4c6c7b8c5bbb7a27c7378838b67899078a2c8beb0b4876f79bbc1a2c1c0b4c6c7a6c1bb767173aebab4b5b4b37c7268b0c6a2b4c3a686867268b0c6b8cdc4b8c498"];
    ////添加分界线，换行
    [body appendFormat:@"%@\r\n",MPboundary];
    //添加字段
    [body appendFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",@"bparam"];
    //添加字段的值
    [body appendFormat:@"%@\r\n",@"39a0af9485a28a806d7887a9bab0beb4c694b5c59fb9b891c8b1ca99b8c2d5c386c38db498ce8797d4bdb1c28db6b4c3a689947b67b0c6a2c5b5b4b3919268b0c6a2c3c5b7c8d0a97f"];
    ////添加分界线，换行
    [body appendFormat:@"%@",endMPboundary];
    
    //声明myRequestData，用来放入http body
    NSMutableData *myRequestData=[NSMutableData data];
    //将body字符串转化为UTF8格式的二进制
    [myRequestData appendData:[body dataUsingEncoding:NSUTF8StringEncoding]];
    
    //http method
    [request setHTTPMethod:@"POST"];
    //设置HTTPHeader中Content-Type的值
    NSString *content=[[NSString alloc]initWithFormat:@"multipart/form-data; boundary=%@",TWITTERFON_FORM_BOUNDARY];
    //设置HTTPHeader
    [request setValue:content forHTTPHeaderField:@"Content-Type"];
    //设置http body
    [request setHTTPBody:myRequestData];
    //设置Content-Length
    [request setValue:[NSString stringWithFormat:@"%d", [myRequestData length]] forHTTPHeaderField:@"Content-Length"];
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    
    //建立连接，设置代理
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSData *finalData = [responseData subdataWithRange:NSMakeRange(20, responseData.length - 20)];
    NSString *jsonString = [[NSString alloc] initWithData:finalData encoding:NSUTF8StringEncoding];
    NSDictionary *dict = [jsonString JSONValue];
    NSLog(@"%@", finalData);
    NSLog(@"%@",dict);
}
#endif
    
//发送一个POST请求,请求已经在公共类中封装
#if 1
    ASIFormDataRequest *postRequest = [ASIFormDataRequest requestWithURL:url];
    __weak ASIFormDataRequest *wPostRequest = postRequest;
    NSString *cparam = @"a85ee74d85a28a7a74787a746fb0c6b3c2b56581846e6e86826784b5beb3ccb5b2bcc7a2c2b573747aa9bab0c0b2c6c7b8c5cdbbb4c2c0b4b4c3a67e8a7d67807da2ccb5b9bfcdb5b8b0bca2887e6cb3d3a9b2c2bfb4c5c9a6c1bb686b76aebab49587a5ad97b4c2c0b3b4c3a6827a7967757aa2ccb56fa585746e75b0b8b4c3a680866f677eaebab47e987d867567b0bca27a7e6cb3d3a9b4c2c0b4c6c7b8c5bbb7a27c7378838b67899078a2c8beb0b4876f79bbc1a2c1c0b4c6c7a6c1bb767173aebab4b5b4b37c7268b0c6a2b4c3a686867268b0c6b8cdc4b8c498";
    NSString *bparam = @"39a0af9485a28a806d7887a9bab0beb4c694b5c59fb9b891c8b1ca99b8c2d5c386c38db498ce8797d4bdb1c28db6b4c3a689947b67b0c6a2c5b5b4b3919268b0c6a2c3c5b7c8d0a97f";
    
    [MyClass sendAPostWithUrl:url request:postRequest cparam:cparam bparam:bparam];
    
    [postRequest setCompletionBlock:^{
        NSData *data = [wPostRequest responseData];
        NSData *finalData = [data subdataWithRange:NSMakeRange(20, data.length - 20)];
        NSString *jsonString = [[NSString alloc] initWithData:finalData encoding:NSUTF8StringEncoding];
        NSDictionary *jsonDict = [jsonString JSONValue];
        NSArray *headPicList = [jsonDict objectForKey:@"list"];
        
        for (int i = 0; i < headPicList.count; i++) {
            NSDictionary *dict = headPicList[i];
            HNFirstViewHeaderModel *headerModel = [[HNFirstViewHeaderModel alloc] init];
            [headerModel refreshWithNSDictionary:dict];
            [scrollViewImages addObject:headerModel];
        }
        //自定义广告条
        [self customheadScrollView];
        NSLog(@"newsScrollViewHeaderFinished");
    }];
#endif
}

-(void)loadTableViewData{
    tableViewCellModels = [NSMutableArray array];
    NSURL *url = [NSURL URLWithString:GETNEWSPICLIST];
    
    ASIFormDataRequest *postRequest = [ASIFormDataRequest requestWithURL:url];
    __weak ASIFormDataRequest *wPostRequest = postRequest;
    NSString *cparam = @"a85ee74d85a28a7a74787a746fb0c6b3c2b56581846e6e86826784b5beb3ccb5b2bcc7a2c2b573747aa9bab0c0b2c6c7b8c5cdbbb4c2c0b4b4c3a67e8a7d67807da2ccb5b9bfcdb5b8b0bca2887e6cb3d3a9b2c2bfb4c5c9a6c1bb686b76aebab49587a5ad97b4c2c0b3b4c3a6827a7967757aa2ccb56fa585746e75b0b8b4c3a680866f677eaebab47e987d867567b0bca27a7e6cb3d3a9b4c2c0b4c6c7b8c5bbb7a27c7378838b67899078a2c8beb0b4876f79bbc1a2c1c0b4c6c7a6c1bb767173aebab4b5b4b37c7268b0c6a2b4c3a686867268b0c6b8cdc4b8c498";
    NSString *bparam = @"aa5bf7c785a28a806d7887a9bab0beb4c694b5c59fb9b891c8b1ca99b8c2d5c386c38db498ce8797d4bdb1c28db6b4c3a67f9076a2c8bfbcc2b56f89807678898067b4cda6858468b0737766c2896f798074a2beae789d7ba6cbbbb8b2c1c3b7b4c3a67c876f678aaebac692";
    
    [MyClass sendAPostWithUrl:url request:postRequest cparam:cparam bparam:bparam];
    
    [postRequest setCompletionBlock:^{
        NSData *data = [wPostRequest responseData];
        NSData *finalData = [data subdataWithRange:NSMakeRange(20, data.length - 20)];
        NSString *jsonString = [[NSString alloc] initWithData:finalData encoding:NSUTF8StringEncoding];
        NSDictionary *jsonDict = [jsonString JSONValue];
        NSArray *headPicList = [jsonDict objectForKey:@"list"];
        for (int i = 0; i < headPicList.count; i++) {
            HNFirstTableViewCellModel *tableViewCellModel = [[HNFirstTableViewCellModel alloc] init];
            NSDictionary *dict = headPicList[i];
            [tableViewCellModel refreshWithNSDictionary:dict];
            [tableViewCellModels addObject:tableViewCellModel];
        }
        //自定义广告条
        NSLog(@"newsTableViewDataDownloadFinished");
        [self.newsTableView reloadData];
    }];

}
#pragma mark --
#pragma mark --自定义主功能函数,这是数据初始化
//使用本地数据
-(void)loadLocalData{
    tableViewCellModels = [NSMutableArray array];
    
    scrollViewImages = [NSMutableArray array];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"firstViewHeader" ofType:@"json"];
    NSString *jsonStr = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSDictionary *jsonContents = [jsonStr JSONValue];
    
    //scrollViewHeaderModel 部分
    //以下是解析
    NSArray *headPicList = jsonContents[@"list"];
    for (int i = 0; i < headPicList.count; i++) {
        NSDictionary *dict = headPicList[i];
        HNFirstViewHeaderModel *headerModel = [[HNFirstViewHeaderModel alloc] init];
        [headerModel refreshWithNSDictionary:dict];
        [scrollViewImages addObject:headerModel];
    }
    
    //tableViewCellModel部分,封装请求函数,以便复用
    [self requestAPictureListWithFileName:@"firstTableView1"];
}
//先用本地数据
-(void)requestAPictureListWithFileName:(NSString*)fileName{
    NSString *pathTableView1 = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    NSString *jsonStrTableView1 = [NSString stringWithContentsOfFile:pathTableView1 encoding:NSUTF8StringEncoding error:nil];
    NSDictionary *jsonContentsTableView1 = [jsonStrTableView1 JSONValue];
    
    NSArray *tableViewPicList1 = jsonContentsTableView1[@"list"];
    
    for (int i = 0; i < tableViewPicList1.count; i++) {
        HNFirstTableViewCellModel *tableViewCellModel = [[HNFirstTableViewCellModel alloc] init];
        NSDictionary *dict = tableViewPicList1[i];
        [tableViewCellModel refreshWithNSDictionary:dict];
        [tableViewCellModels addObject:tableViewCellModel];
    }
}

#pragma mark --
#pragma mark --自定义主功能函数,渐变图层
//添加渐变色图层函数

#pragma mark --
#pragma mark --自定义主功能函数,自定义导航栏
-(void)customNavigationBar{
    //调用HNTabBarController
    HNTabBarController *tabbar = (HNTabBarController*)self.tabBarController;
    tabbar.customNavigationBarRightLine1.hidden = NO;

    //导航栏右边的button,一个Button一个UIImageView添加在一个UIView上面
    rightBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(272, 0, 48, 38)];
    [tabbar.customNavigationBarVisibleView addSubview:rightBackgroundView];
    
    UIImageView *rightImgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 30, 30)];
    [rightImgView setImage:[UIImage imageNamed:@"camera_top_bg"]];
    [rightBackgroundView addSubview:rightImgView];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(3, 0, 43, 38);
    rightBtn.backgroundColor = [UIColor clearColor];
    [rightBackgroundView addSubview:rightBtn];
    [rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    //中间的按钮,Label,小箭头 都放在一个view上面
    navigationBarMiddleView = [[UIView alloc] initWithFrame:CGRectMake(130, 0, 50, 44)];
    [tabbar.customNavigationBarVisibleView addSubview:navigationBarMiddleView];
    //导航条中间的按钮
    UIButton *navigationBarMiddleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    navigationBarMiddleBtn.frame = CGRectMake(0, 0, 50, 44);
    [navigationBarMiddleBtn addTarget:self action:@selector(navigationBarMiddleBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [navigationBarMiddleView addSubview:navigationBarMiddleBtn];
    //中间的lable
    CGRect rect = tabbar.customNavigationBarVisibleView.frame;
    navigationBarLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, (rect.size.height - 25)/2, 40, 25)];
    navigationBarLabel.text = navigationBarLabelText1;
    navigationBarLabel.textColor = [UIColor whiteColor];
    [navigationBarMiddleView addSubview:navigationBarLabel];
    //中间的图片小箭头
    UIImageView *navigationBarMiddleImgView = [[UIImageView alloc] initWithFrame:CGRectMake(navigationBarLabel.frame.origin.x + navigationBarLabel.frame.size.width,(rect.size.height - 15)/2 + 3 ,10 , 10)];
    [navigationBarMiddleImgView setImage:[UIImage imageNamed:@"arror3"]];
    [navigationBarMiddleView addSubview:navigationBarMiddleImgView];
    
    
    
    //点击中间按钮推出选项界面
    pullView = [[UIView alloc] initWithFrame:CGRectMake(0,64, 320, 100)];
    pullView.backgroundColor = [UIColor whiteColor];
    pullView.hidden = YES;
    [self.view addSubview:pullView];
    int height = 0;
    for (int i = 0; i < 3; i++) {
        UIButton *pullBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        pullBtn.frame = CGRectMake(0, height, 320, 33);
        pullBtn.tag = 100 + i;
        NSString *title = [navigationBarLabelPullTitles objectAtIndex:i];
        [pullBtn setTitle:title forState:UIControlStateNormal];
        [pullBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        pullBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [pullBtn addTarget:self action:@selector(pullBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            pullBtn.backgroundColor = [UIColor pullBtnColor];
        }
        [pullView addSubview:pullBtn];
        height += 33;
    }
    
    
    
    //rightBtn点击后的灰色背景
    photoBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    photoBackgroundView.backgroundColor = [UIColor grayColor];
    photoBackgroundView.alpha = 0.5;
    [tabbar.view addSubview:photoBackgroundView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(myTap:)];
    [photoBackgroundView addGestureRecognizer:tap];
    
    photoView = [[UIView alloc] initWithFrame:CGRectMake(5, 280, 310, 145)];
    photoView.layer.cornerRadius = 10;
    photoView.backgroundColor = [UIColor whiteColor];
    photoView.alpha = 0.95;
    [tabbar.view addSubview:photoView];
    
    //photoView分割线
    UIView *splitViewOri = [[UIView alloc] initWithFrame:CGRectMake(0, 72, 320, 1)];
    splitViewOri.backgroundColor = [UIColor grayColor];
    splitViewOri.alpha = 0.5;
    [photoView addSubview:splitViewOri];
    
    UIView *splitViewLen = [[UIView alloc] initWithFrame:CGRectMake(155, 0, 1, 145)];
    splitViewLen.backgroundColor = [UIColor grayColor];
    splitViewLen.alpha = 0.5;
    [photoView addSubview:splitViewLen];
    
    //photoView中的4个button
    int y = 0;
    for (int i = 0; i < 2; i++) {
        int x = 0;
        for (int j = 0; j < 2; j++) {
            CGPoint centerPoint = CGPointMake(75 + j * 160, 36 + 72 * i - 5);
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(10 + x, 20 + y, 100, 50);
            btn.center = centerPoint;
            btn.tag = 200 +i * 2 + j;
            [btn addTarget:self action:@selector(photoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [photoView addSubview:btn];
            
            UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 25, 20)];
            imgView.center = centerPoint;
            NSMutableArray *images = [NSMutableArray arrayWithObjects:@"camera_bg",@"photo_bg",@"video_bg",@"video_local_bg", nil];
            NSMutableArray *labelTitles = [NSMutableArray arrayWithObjects:@"拍照片",@"本地相册",@"拍视频",@"本地视频", nil];
            [imgView setImage:[UIImage imageNamed:[images objectAtIndex:i * 2 + j]]];
            [photoView addSubview:imgView];
            
            UILabel *photoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 15)];
            photoLabel.textColor = [UIColor grayColor];
            photoLabel.textAlignment = NSTextAlignmentCenter;
            photoLabel.font = [UIFont systemFontOfSize:10];
            photoLabel.text = [labelTitles objectAtIndex:i * 2 + j];
            CGPoint labelCenterPoint = CGPointMake(centerPoint.x, centerPoint.y + 20);
            photoLabel.center = labelCenterPoint;
            [photoView addSubview:photoLabel];
        }
        y += 70;
    }
    
    photoBackgroundView.hidden = YES;
    photoView.hidden = YES;
    
}

//拍照按钮
-(void)photoBtnClick:(UIButton*)btn{
    switch (btn.tag - 200) {
        case 0://拍照片
            /*
             UIImagePickerControllerSourceTypePhotoLibrary,图片库
             UIImagePickerControllerSourceTypeCamera,照相机
             UIImagePickerControllerSourceTypeSavedPhotosAlbum 保存图片相册
             */
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                //启动照相机
            }else{
                NSLog(@"不支持照相机");
            }

            break;
        case 1://本地相册
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
                //启动相册，选择图片
                //先实例化一个pickerController
                UIImagePickerController *picker = [[UIImagePickerController alloc]init];
                //在哪里选
                picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                //选何种类型的文件
                picker.mediaTypes = @[(NSString*)kUTTypeImage,(NSString*)kUTTypePDF];
                //设置选择照片后是否需要编辑
                picker.allowsEditing=YES;
                //设置选择完成后的代理
                picker.delegate=self;
                [self presentViewController:picker animated:YES completion:^{
                    NSLog(@"弹出完成");
                }];
                
            }else{
                NSLog(@"不支持相册");
            }

            break;
        case 2://拍视频
            
            break;
        case 3://本地视频
            
            break;
        default:
            break;
    }
    photoBackgroundView.hidden = YES;
    photoView.hidden = YES;
}
-(void)rightBtnClick:(UIButton*)btn{
    NSLog(@"rightBtnClick");
    photoBackgroundView.hidden = NO;
    photoView.hidden = NO;
}
-(void)myTap:(UITapGestureRecognizer*)tap{
    photoBackgroundView.hidden = YES;
    photoView.hidden = YES;
}
-(void)navigationBarMiddleBtnClicked:(id)sender{
    NSLog(@"navigationBarMiddleBtnClicked");
    BOOL pullViewIsHidden = pullView.hidden;
    pullView.hidden = !pullViewIsHidden;
    pullViewIsHidden = !pullViewIsHidden;
}
-(void)pullBtnClick:(UIButton*)btn{
    for (int  i = 0; i < 3; i++) {
        UIButton *button = (UIButton *)[self.view viewWithTag:100 + i];
        button.backgroundColor = [UIColor whiteColor];
    }
    btn.backgroundColor = [UIColor pullBtnColor];
    pullView.hidden = YES;
    navigationBarLabel.text = [navigationBarLabelTitles objectAtIndex:btn.tag - 100];
    
}

#pragma mark--
#pragma mark pickcontroller的代理方法
//选择完成
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSLog(@"选择完成   %@",info);
    //假设同时选择多种文件（很少有这种状况），需要判断后再操作
    if ([info[UIImagePickerControllerMediaType] isEqualToString:(NSString *)kUTTypeImage]) {
        NSLog(@"这是图片");
        
//        UIImage *oldImage=info[UIImagePickerControllerOriginalImage];
//        self.leftImageView.image=oldImage;
//        
//        UIImage *newImage=info[UIImagePickerControllerEditedImage];
//        newImage=[self createImage:newImage withSize:self.rightImageView.frame.size];
//        self.rightImageView.image=newImage;
        
    }else if ([info[UIImagePickerControllerMediaType] isEqualToString:(NSString *)kUTTypePDF]){
        NSLog(@"这是PDF");
    }else{
        NSLog(@"未知类型");
    }
    
    [picker dismissViewControllerAnimated:YES completion:^{
        NSLog(@"消失");
    }];
}
//选择取消
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    NSLog(@"选择取消");
    [picker dismissViewControllerAnimated:YES completion:^{
        NSLog(@"取消");
    }];
}

#pragma mark -- 
#pragma mark -- ViewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
    navigationBarLabelTitles = [NSMutableArray arrayWithObjects:navigationBarLabelText1,navigationBarLabelText2,navigationBarLabelText3, nil];
    navigationBarLabelPullTitles = [NSMutableArray arrayWithObjects:navigationBarLabelTextPull1,navigationBarLabelTextPull2,navigationBarLabelTextPull3, nil];
    //初始化数据
    [self loadScrollViewData];
    [self loadTableViewData];
//    [self loadLocalData];
    
    //主要界面tableView
    self.newsTableView.tableHeaderView = self.headView;
//    [self.view addSubview:self.newsTableView];
    [self.newsTableView registerNib:[UINib nibWithNibName:@"PetMainCell" bundle:Nil] forCellReuseIdentifier:reusedId];
    
    //MJ刷新
    mjHeader = [[MJRefreshHeaderView alloc] initWithScrollView:self.newsTableView];
    mjHeader.delegate = self;
    
    mjFooter = [[MJRefreshFooterView alloc] initWithScrollView:self.newsTableView];
    mjFooter.delegate = self;
    
    
    
}

//生命周期函数控制不同tabbarcontrollerItem被选中时不同的导航栏
#pragma mark -- 
#pragma mark -- ViewController生命周期函数
-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"viewWillAppear");
    //自定义导航栏函数
    [self customNavigationBar];
    
//    navigationBarLabel.hidden = NO;
//    navigationBarMiddleImgView.hidden = NO;
}
-(void)viewDidDisappear:(BOOL)animated{
    NSLog(@"viewDidDisappear");
    [navigationBarMiddleView removeFromSuperview];
    [photoBackgroundView removeFromSuperview];
    [rightBackgroundView removeFromSuperview];
    [pullView removeFromSuperview];
    [photoBackgroundView removeFromSuperview];
    [photoView removeFromSuperview];
}

#pragma mark--
#pragma mark 上下拉刷新的控件
-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView{
    NSLog(@"%@----开始进入刷新状态", refreshView.class);
    if (refreshView == mjHeader) {
        
    }else{
        [self getMoreTableViewPicture];
    }
    //一定要使用perform函数
    [self performSelector:@selector(refreshTableViewPicture:) withObject:refreshView afterDelay:1.0];
}
//刷新tableView
-(void)refreshTableViewPicture:(MJRefreshBaseView *)refreshView{
    [self.newsTableView reloadData];
    [refreshView endRefreshing];
}
//上拉加载
-(void)getMoreTableViewPicture{
    static int currentJsonNumber = 1;
    currentJsonNumber++;
    if (currentJsonNumber >=5) {
        currentJsonNumber = 0;
    }
    NSString *currentJson = [NSString stringWithFormat:@"%@%d",@"firstTableView",currentJsonNumber];
    [self requestAPictureListWithFileName:currentJson];
}
#pragma mark --
#pragma mark -- UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return tableViewCellModels.count / 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PetMainCell *cell = [self.newsTableView dequeueReusableCellWithIdentifier:reusedId];
    for (int i = 0; i < 3; i++) {
        
        int curPos = indexPath.row * 3 + i;
//        NSLog(@"当前位置 %d",curPos);
        if (tableViewCellModels.count > curPos) {
            HNFirstTableViewCellModel *model;
            NSURL *url;
            switch (i) {
                case 0:
                    model = [tableViewCellModels objectAtIndex:curPos];
                    url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",model.smallpath]];
                    [cell.imageViewBg1 setImageWithURL:url];
                    cell.numLabel1.text = [NSString stringWithFormat:@"%@",model.viewNum];
                    break;
                case 1:
                    model = [tableViewCellModels objectAtIndex:curPos];
                    url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",model.smallpath]];
                    [cell.imageViewBg2 setImageWithURL:url];
                    cell.numLabel2.text = [NSString stringWithFormat:@"%@",model.viewNum];
                    break;
                case 2:
                    model = [tableViewCellModels objectAtIndex:curPos];
                    url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",model.smallpath]];
                    [cell.imageViewBg3 setImageWithURL:url];
                    cell.numLabel3.text = [NSString stringWithFormat:@"%@",model.viewNum];
                    break;
                default:
                    break;
            }
        }
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
#pragma mark --
#pragma mark --自定义主功能函数,自定义scrollView作为tableView的headView,包含scroll代理等函数
-(void)customheadScrollView{
    //scrollView背景view,用于安置scrollView和pageControl
    self.headView.frame = CGRectMake(0, 0, 320, 100);
    //新闻条,是一个scrollView
    self.headView.frame = CGRectMake(0, 0, self.headView.frame.size.width, self.headView.frame.size.height);
    self.headScrollView.contentSize = CGSizeMake(self.view.frame.size.width * (scrollViewImages.count + 2), self.headScrollView.frame.size.height);
    self.headScrollView.delegate = self;
    self.headScrollView.bounces = NO;
    self.headScrollView.pagingEnabled = YES;
    self.headScrollView.showsHorizontalScrollIndicator = NO;
    self.headScrollView.showsVerticalScrollIndicator = NO;
    self.headScrollView.contentOffset = CGPointMake(320, 0);
    [self.headView addSubview:self.headScrollView];
    
    //给scrollView添加定时器滑动效果
    scrollTimer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(scrollImgView) userInfo:nil repeats:YES];
    
    //给新闻条添加图片
    for (int i = 0; i < scrollViewImages.count + 2; i++) {
        HNFirstViewHeaderModel *headerModel;
        NSURL *url;
        if (i == 0) {
            headerModel = [scrollViewImages objectAtIndex:scrollViewImages.count - 1];
            url = [NSURL URLWithString:headerModel.path];
        }else if (i == scrollViewImages.count + 1){
            headerModel = [scrollViewImages objectAtIndex:0];
            url = [NSURL URLWithString:headerModel.path];
        }else{
            headerModel = [scrollViewImages objectAtIndex:i - 1];
            url = [NSURL URLWithString:headerModel.path];
        }
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * i, 0, self.view.frame.size.width, self.headScrollView.frame.size.height)];
        [imgView setImageWithURL:url];
        [self.headScrollView addSubview:imgView];
    }
    
    //新闻条下面有一个pageControl
    self.pageCtl.frame = CGRectMake((320 - 100) / 2, 85, 100, 10);
    self.pageCtl.numberOfPages = scrollViewImages.count;
    self.pageCtl.currentPage = 0;
    self.pageCtl.pageIndicatorTintColor = [UIColor grayColor];
    self.pageCtl.currentPageIndicatorTintColor = [UIColor whiteColor];
    [self.headView addSubview:self.pageCtl];
}

#pragma mark -- scrollView滚动时定时器调用函数
-(void)scrollImgView
{
    [self.headScrollView scrollRectToVisible:CGRectMake(320 * (self.pageCtl.currentPage + 2), 0, self.headScrollView.frame.size.width, self.headScrollView.frame.size.height) animated:YES];
}

#pragma mark UIScrollViewDelegate

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    int page=self.headScrollView.contentOffset.x/self.headScrollView.frame.size.width;
    if (self.headScrollView.contentOffset.x>320 * (self.pageCtl.numberOfPages + 0) + 10)
    {
        self.headScrollView.contentOffset=CGPointMake(320, 0);
        page=1;
    }
    if (self.headScrollView.contentOffset.x<320 - 10)
    {
        self.headScrollView.contentOffset=CGPointMake(320 * (self.pageCtl.numberOfPages + 0), 0);
        page=self.pageCtl.numberOfPages;
    }
    self.pageCtl.currentPage=page - 1;
}

// 当scrollView滑动时调用  多次调用
- (void) scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

// 当scrollView停止减速调用,时间控制函数不调用
- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page=self.headScrollView.contentOffset.x/self.headScrollView.frame.size.width;
    if (self.headScrollView.contentOffset.x>320 * (self.pageCtl.numberOfPages + 0) + 10)
    {
        self.headScrollView.contentOffset=CGPointMake(320, 0);
        page=1;
    }
    if (self.headScrollView.contentOffset.x<320 - 10)
    {
        self.headScrollView.contentOffset=CGPointMake(320 * (self.pageCtl.numberOfPages + 0), 0);
        page=self.pageCtl.numberOfPages;
    }
    self.pageCtl.currentPage=page - 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --
#pragma mark -- NavigationBarButtonClick
- (IBAction)leftNavigationBarItemClick:(id)sender {
    NSLog(@"leftNavigationBarItemClick");
}

- (IBAction)rightNavigationBarItemClick:(id)sender {
    NSLog(@"rightNavigationBarItemClick");
}
-(void)dealloc{
    [mjHeader free];
    [mjFooter free];
}




#if 0
#pragma mark -- 友盟分享
-(void)shareSDKWithShareType:(ShareType)shareType{
    [ShareSDK getUserInfoWithType:shareType authOptions:nil result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
        if (result) {
            //            NSLog(@"%@",[userInfo sourceData]);
            PFQuery *query = [PFQuery queryWithClassName:@"UserInfo"];
            [query whereKey:@"uid" equalTo:[userInfo uid]];
            [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                if (objects.count == 0) {
                    PFObject *newUser = [PFObject objectWithClassName:@"UserInfo"];
                    [newUser setObject:[userInfo uid] forKey:@"uid"];
                    [newUser setObject:[userInfo profileImage] forKey:@"name"];
                    [newUser saveInBackground];
                    //                    NSLog(@"保存数据到云诺");
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hello" message:@"欢迎注册" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil];
                    [alertView show];
                }else{
                    UIAlertView *alertVeiw = [[UIAlertView alloc] initWithTitle:@"Hello" message:@"欢迎回来" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil];
                    [alertVeiw show];
                }
            }];
            HNFirstViewController *mainVc = [[HNFirstViewController alloc] initWithNibName:@"HNFirstViewController" bundle:nil];
            [self.navigationController pushViewController:mainVc animated:YES];
        }
    }];
    
}
#endif
@end
