//
//  PeopleEdidtoMode.h
//  Job
//
//  Created by bidiao on 2017/7/21.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PeopleEdidtoMode : NSObject
//工作地方
@property(nonatomic,strong) NSString * address;
//工作名称
@property(nonatomic,strong) NSString * name;
//工作日期
@property(nonatomic,strong) NSString * workDate;
//上班时间
@property(nonatomic,strong) NSString * startTime;
//xiab班时间
@property(nonatomic,strong) NSString * stopTIme;
//合共时间
@property(nonatomic,strong) NSString * togetherTime;
//空缺人数
@property(nonatomic,assign) NSInteger  numberof;
//时薪
@property(nonatomic,assign) NSInteger  hourlyWage;
//津贴
@property(nonatomic,assign) NSInteger  allowance;
//合计
@property(nonatomic,assign) NSInteger  intotalMoneny;
//僱主支出
@property(nonatomic,assign) NSInteger  employersgMoney;
//酒店
@property(nonatomic,strong) NSString * hotel;
//餐廳
@property(nonatomic,strong) NSString * restaurant;
//發佈日期
@property(nonatomic,strong) NSString *  thereleasedate;

//所需语言
@property(nonatomic,strong) NSString * language;
//所需文件
@property(nonatomic,strong) NSString * file;
//出量
@property(nonatomic,strong) NSString * theAmountOf;
//服装守则
@property(nonatomic,strong) NSString * clothing;
//年龄
@property(nonatomic,strong) NSString *  age;
//
@property(nonatomic,strong) NSString *  sex;
//工作详情
@property(nonatomic,strong) NSString * workdetails;


@end
