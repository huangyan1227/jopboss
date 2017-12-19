//
//  ChuliangMode.m
//  Job
//
//  Created by bidiao on 2017/7/20.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "ChuliangMode.h"

@implementation ChuliangMode

-(instancetype)initWithShopDict:(NSDictionary *)dict{
    
    
    self.titleMeth = dict[@"goodsType"];
    
    self.isSelect = [dict[@"selectState"]boolValue];
    
    
    return self;
}
+(NSArray*)getModeMeth{
    
    
    
    NSArray * arrar = @[@"現金",@"支票",@"銀行轉賬",@"1至2星期",@"每月",@"同日",@"翌日"];
    
    NSMutableArray *  a =[NSMutableArray array];
    
    
    
    for (int i=0; i<arrar.count; i++) {
        
        ChuliangMode *jop =[ChuliangMode new];
        jop.titleMeth =arrar[i];
        jop.isSelect= NO;
        
        [a addObject:jop];
        
        
    }
    
    return a;
    
}
@end
