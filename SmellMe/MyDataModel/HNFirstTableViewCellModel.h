//
//  HNFirstTableViewCellModel.h
//  PetPet
//
//  Created by frostyhot on 14-1-17.
//  Copyright (c) 2014年 frostyhot. All rights reserved.
//

#import <Foundation/Foundation.h>
//16项
@interface HNFirstTableViewCellModel : NSObject
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *title;
@property (copy, nonatomic) NSString *smallpath;
@property (nonatomic, copy) NSString *info;
@property (nonatomic, copy) NSString *suffix;
@property (nonatomic, copy) NSString *viewNum;
@property (nonatomic, copy) NSString *hight;
@property (nonatomic, copy) NSString *width;
@property (nonatomic, copy) NSString *coordtype;
@property (nonatomic, copy) NSString *shottime;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *itemtype;
@property (nonatomic, copy) NSString *itemurl;
@property (nonatomic, copy) NSArray *event;
@property (nonatomic, copy) NSString *raceld;
@property (nonatomic, copy) NSString *familyid;

-(void)refreshWithNSDictionary:(NSDictionary *)dictionary;
@end
