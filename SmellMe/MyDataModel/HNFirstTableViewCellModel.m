//
//  HNFirstTableViewCellModel.m
//  PetPet
//
//  Created by frostyhot on 14-1-17.
//  Copyright (c) 2014年 frostyhot. All rights reserved.
//

#import "HNFirstTableViewCellModel.h"

@implementation HNFirstTableViewCellModel
-(void)refreshWithNSDictionary:(NSDictionary *)dictionary{
    /*
    @property (nonatomic, copy) NSString *uid;
    @property (nonatomic, copy) NSString *title;
    @property (copy, nonatomic) NSString *smallpath;
    @property (nonatomic, copy) NSString *info;
    @property (nonatomic, copy) NSString *suffix;
    @property (nonatomic, copy) NSString *viewNum;
    @property (nonatomic, copy) NSString *hight;
    @property (nonatomic, copy) NSString *width;
    @property (nonatomic, copy) NSString *coordtype;
    @property (nonatomic, copy) NSString *shotTime;
    @property (nonatomic, copy) NSString *status;
    @property (nonatomic, copy) NSString *itemType;
    @property (nonatomic, copy) NSString *itemurl;
    @property (nonatomic, copy) NSArray *event;
    @property (nonatomic, copy) NSString *raceld;
    @property (nonatomic, copy) NSString *familyid;
     */
    self.uid = dictionary[@"id"];
    self.title = dictionary[@"title"];
    self.smallpath = dictionary[@"smallpath"];
    self.info = dictionary[@"info"];
    self.suffix = dictionary[@"suffix"];
    self.viewNum = dictionary[@"viewnum"];
    self.hight = dictionary[@"hight"];
    self.width = dictionary[@"width"];
    self.coordtype = dictionary[@"coordtype"];
    self.shottime = dictionary[@"shottime"];
    self.status = dictionary[@"status"];
    self.itemtype = dictionary[@"itemtype"];
    self.event = dictionary[@"event"];
    self.raceld = dictionary[@"raceld"];
    self.familyid = dictionary[@"familyid"];
}
@end
