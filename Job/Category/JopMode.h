//
//  JopMode.h
//  Job
//
//  Created by bidiao on 2017/7/13.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JopMode : NSObject
//上班日期
@property(nonatomic,strong) NSString * dateString;
//工作名稱
@property(nonatomic,strong) NSString * nameString;
@property(nonatomic,strong) NSString * popoleString;
@property(nonatomic,strong) NSString * moneyString;
@property(nonatomic,strong) NSString * detailsString;
//工作日期
@property(nonatomic,strong) NSString * workdate;
//上班时间
@property(nonatomic,strong) NSString * startTime;
//下班时间
@property(nonatomic,strong) NSString * stopTIme;
//合共时间
@property(nonatomic,strong) NSString * togetherTime;
//所需语言
@property(nonatomic,strong) NSString * language;
//所需文件
@property(nonatomic,strong) NSString * file;
//服装守则
@property(nonatomic,strong) NSString * clothing;
//出量
@property(nonatomic,strong) NSString * theAmountOf;
//job.intotalMoneny
@property(nonatomic,strong) NSString * intotalMoneny;
//时薪
@property(nonatomic,assign) NSInteger  hourlyWage;
//津贴
@property(nonatomic,assign) NSInteger  allowance;
//工作地方
@property(nonatomic,strong) NSString * address;
//年龄
@property(nonatomic,strong) NSString *  agef;

//总数支出
@property(nonatomic,assign) NSInteger  employersgMoney;
//酒店
@property(nonatomic,strong) NSString * hotel;
//餐廳
@property(nonatomic,strong) NSString * restaurant;

//性別
@property(nonatomic,strong) NSString *  sex;

//编辑
@property(nonatomic,strong) NSString * nametitleString;

//發佈日期The release date
@property(nonatomic,strong) NSString *  thereleasedate;

//申请进度
@property(nonatomic,strong) NSString * progressString;
//出量
@property(nonatomic) BOOL isSelect;

@property(nonatomic,strong) NSString * titleMeth;

@property(nonatomic,strong) NSDictionary * dict;

+(NSArray*)getModeMeth;

+(NSArray*)getWenjian;

+(NSArray*)getclothing;
+(NSArray*)getSex;
+(NSArray*)getHolte;
+(NSArray*)shujuArray;
+(NSArray*)gerestArray:(NSArray*)arrar;

//-(NSInteger)day:(NSDate *)date;
//发布日期
+(NSArray*)getThereleasedateing:(NSString *)dateString;

+(JopMode*)addModel:(NSString*)date name:(NSString*)name popole:(NSString*)pople money:(NSString*)money detail:(NSString*)detail wokDate:(NSString*)wokDate language:(NSString*)language file:(NSString*)file   theAmountOf:(NSString*)theAmountof hourlyWage:(NSInteger)hourlyWage allowance:(NSInteger)allowance address:(NSString*)address age:(NSString*)age clothing:(NSString*)clothing startTime:(NSString*)startTime stopTIme:(NSString*)stopTIme togetherTime:(NSString*)togetherTime hotel:(NSString*)hotel restaurant:(NSString*)restaurant releasedate:(NSString*)releasedate;

+(NSArray*)getAgeshuju;
//申请进度

+(NSArray *)addModelWorkdetailsViewname:(NSString*)name date:(NSString*)dateString progress:(NSString*)progressing;
+(NSArray*)getModePresonEditor;
@end
