//
//  ChuliangMode.h
//  Job
//
//  Created by bidiao on 2017/7/20.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChuliangMode : NSObject
//出量
@property(nonatomic) BOOL isSelect;

@property(nonatomic,strong) NSString * titleMeth;

+(NSArray*)getModeMeth;
-(instancetype)initWithShopDict:(NSDictionary *)dict;
@end
