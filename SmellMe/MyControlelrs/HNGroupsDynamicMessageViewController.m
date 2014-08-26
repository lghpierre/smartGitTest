//
//  HNGroupsDynamicMessageViewController.m
//  PetPet
//
//  Created by frostyhot on 14-1-20.
//  Copyright (c) 2014年 frostyhot. All rights reserved.
//

#import "HNGroupsDynamicMessageViewController.h"
#import "HNAppDelegate.h"
#import "HNTabBarController.h"
#import "GroupDynamicMessageCell.h"


NSString *reuserID = @"reuseID";
@interface HNGroupsDynamicMessageViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation HNGroupsDynamicMessageViewController

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
    [self customTableView];
    
    
    
    // Do any additional setup after loading the view from its nib.
}

-(void)customTableView{
    NSLog(@"HNGroupsDynamicMessageViewController");
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 320, 416)];
    backgroundView.backgroundColor = [UIColor lightPinchColor];
    [self.view addSubview:backgroundView];
    
    UITableView *dynamicTableView = [[UITableView alloc] initWithFrame:CGRectMake(5, 0, 310, 416) style:UITableViewStyleGrouped];
    dynamicTableView.backgroundColor = [UIColor whiteColor];
    [backgroundView addSubview:dynamicTableView];
    
    [dynamicTableView registerNib:[UINib nibWithNibName:@"GroupDynamicMessageCell" bundle:nil] forCellReuseIdentifier:reuserID];
}

#pragma mark -- UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GroupDynamicMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:reuserID];
    return cell;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
