//
//  HNLocalModel.h
//  PetPet
//
//  Created by frostyhot on 14-1-14.
//  Copyright (c) 2014年 frostyhot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HNLocalModel : NSObject
@property (nonatomic, copy) NSString *pidId;
@property (copy, nonatomic) NSString *smallPicUrl;
@property (nonatomic, copy) NSString *info;
@property (nonatomic, copy) NSString *viewNum;
@property (nonatomic, copy) NSString *shotTime;
@property (nonatomic, copy) NSString *itemType;
@property (nonatomic, copy) NSString *evenId;
@property (nonatomic, copy) NSString *tag;
@property (nonatomic, copy) NSString *iconUrl;
@property (nonatomic, copy) NSString *etype;
@property (nonatomic, copy) NSString *wapUrl;

-(NSMutableArray*)ReturnArray:(NSMutableArray*)array;
@end
