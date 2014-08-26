//
//  HNFirstViewHeaderModel.h
//  PetPet
//
//  Created by frostyhot on 14-1-17.
//  Copyright (c) 2014年 frostyhot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HNFirstViewHeaderModel : NSObject
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *path;
@property (nonatomic, copy) NSString *info;
@property (nonatomic, copy) NSString *word;
@property (nonatomic, copy) NSString *clickurl;
@property (nonatomic, copy) NSString *createtime;
@property (nonatomic, copy) NSString *bannertype;
@property (nonatomic, copy) NSString *valib;
@property (nonatomic, copy) NSString *def1;
@property (nonatomic, copy) NSString *def2;
@property (nonatomic, copy) NSString *bptype;

-(void)refreshWithNSDictionary:(NSDictionary *)dictionary;
@end
