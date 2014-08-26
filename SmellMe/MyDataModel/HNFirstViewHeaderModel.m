//
//  HNFirstViewHeaderModel.m
//  PetPet
//
//  Created by frostyhot on 14-1-17.
//  Copyright (c) 2014年 frostyhot. All rights reserved.
//

#import "HNFirstViewHeaderModel.h"

@implementation HNFirstViewHeaderModel

-(void)refreshWithNSDictionary:(NSDictionary *)dictionary{
    self.uid = dictionary[@"id"];
    self.title = dictionary[@"title"];
    self.path = dictionary[@"path"];
    self.info = dictionary[@"info"];
    self.word = dictionary[@"woid"];
    self.clickurl = dictionary[@"clickurl"];
    self.createtime = dictionary[@"createtime"];
    self.bannertype = dictionary[@"valib"];
    self.valib = dictionary[@"valib"];
    self.def1 = dictionary[@"def2"];
    self.def2 = dictionary[@"def2"];
    self.bptype = dictionary[@"bptype"];
}
@end
