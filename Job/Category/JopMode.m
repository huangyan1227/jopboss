//
//  JopMode.m
//  Job
//
//  Created by bidiao on 2017/7/13.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "JopMode.h"

@implementation JopMode
+(JopMode*)addModel:(NSString *)date name:(NSString *)name popole:(NSString *)pople money:(NSString *)money detail:(NSString *)detail wokDate:(NSString *)wokDate language:(NSString *)language file:(NSString *)file theAmountOf:(NSString *)theAmountof hourlyWage:(NSInteger)hourlyWage allowance:(NSInteger)allowance address:(NSString *)address age:(NSString *)age clothing:(NSString *)clothing startTime:(NSString *)startTime stopTIme:(NSString *)stopTIme togetherTime:(NSString *)togetherTime hotel:(NSString *)hotel restaurant:(NSString *)restaurant releasedate:(NSString *)releasedate{
    
  //  NSMutableArray * mutable = [NSMutableArray array];
    
    
    JopMode * jop = [JopMode new];
    
    jop.agef = age;
    
    jop.dateString = date;
    
    jop.nameString = name;
    
    jop.popoleString = pople;
    
    jop.moneyString = money;
    
    jop.detailsString = detail;
    
    jop.workdate = wokDate;
    
    jop.language = language;
    
    jop.file = file;
    
    jop.theAmountOf = theAmountof;
    
    jop.hourlyWage = hourlyWage;
    
    jop.allowance = allowance;
    
    jop.address = address;
    
    jop.startTime = startTime;
    
    jop.stopTIme = stopTIme;
    
    jop.togetherTime = togetherTime;
    
    jop.hotel = hotel;
    
    jop.restaurant = restaurant;
    
   // jop.intotalMoneny = 
  
    jop.thereleasedate = releasedate;
    jop.clothing =clothing;
   // [mutable addObject:jop];
    
    
    
    return jop;
}
+(NSArray*)addModelWorkdetailsViewname:(NSString *)name date:(NSString *)dateString progress:(NSString *)progressing{
    
    
    NSMutableArray * muatble = [NSMutableArray array];
    
    JopMode * jop = [JopMode new];
    
    jop.nameString = name;
    
    jop.dateString = dateString;
    
    jop.progressString = progressing;
    
    [muatble addObject:jop];
    
    return [muatble copy];
}
+(NSArray*)getModePresonEditor{
    
    NSString * path =[[NSBundle mainBundle] pathForResource:@"peopleEdito" ofType:@"plist"];
    
    NSArray *arrar = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *  a =[NSMutableArray array];
    
    
    
    for (int i=0; i<arrar.count; i++) {
        
        JopMode *jop =[JopMode new];
        jop.nametitleString =arrar[i];
        
        [a addObject:jop];
        
        
    }
    
    return a;
    
    
}
+(NSArray*)getWenjian{
    
    NSArray * arrar = @[@"身份證 ",@"身份證明書 ",@"銀行賬戶密碼 ",@"東亞MPF賬戶 ",@"銀聯MPF證明 "];
    
    NSMutableArray *  a =[NSMutableArray array];
    
    
    
    for (int i=0; i<arrar.count; i++) {
        
        JopMode *jop =[JopMode new];
        jop.titleMeth =arrar[i];
        jop.isSelect= NO;
        
        [a addObject:jop];
        
        
    }
    
    return a;

    
    
    
}
+(NSArray*)getModeMeth{
    
   
    
    NSArray * arrar = @[@"現金 ",@"支票 ",@"銀行轉賬 ",@"一至兩星期 ",@"每月出糧 ",@"每日出糧 ",@"用餐不計算人工 "];
    
    NSMutableArray *  a =[NSMutableArray array];
    
    
    
    for (int i=0; i<arrar.count; i++) {
        
        JopMode *jop =[JopMode new];
        jop.titleMeth =arrar[i];
        jop.isSelect= NO;
        
        [a addObject:jop];
        
        
    }
    
    return a;
    
}
+(NSArray*)getclothing{
    
    NSArray * arrar = @[@"便裝 ",@"正式的/禮儀的 ",@"純黑色皮鞋 ",@"黑色直腳西褲  ",@"純黑色裙 ",@"黑色長筒絲襪 ",@"黑色襪 ",@"黑色直腳西裙 ",@"純白色的恤衫 ",@"服飾不適當不可上班 "];
    
    NSMutableArray *  a =[NSMutableArray array];
    
    
    
    for (int i=0; i<arrar.count; i++) {
        
        JopMode *jop =[JopMode new];
        jop.titleMeth =arrar[i];
        jop.isSelect= NO;
        
        [a addObject:jop];
        
        
    }
    
    return a;
    
    
    
}
+(NSArray*)getSex{
    NSArray * arrar = @[@"女士優先 ",@"男士優先 "];
    
    NSMutableArray *  a =[NSMutableArray array];
    
    
    
    for (int i=0; i<arrar.count; i++) {
        
        JopMode *jop =[JopMode new];
        jop.titleMeth =arrar[i];
        jop.isSelect= NO;
        
        [a addObject:jop];
        
        
    }
    

    return a;
    
    
}

+(NSArray*)getThereleasedateing:(NSString *)dateString{
    
      NSMutableArray *  a =[NSMutableArray array];
    
//    NSString * dat =[NSString stringWithFormat:@"%@ ",dateString];
//    JopMode *jop =[JopMode new];
//    jop.titleMeth =dat;
//    jop.isSelect= NO;
//    [a addObject:jop];
  
    for (int i =1; i<6; i++) {
        
        
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        
        [formatter setDateFormat:@"yyyy-MM-dd"];
        
        NSDate *date = [formatter dateFromString:dateString];
        
        // NSDate *yesterday = [NSDate dateWithTimeInterval:-60 * 60 * 24 sinceDate:date];
        
        NSDate *tomorrow = [NSDate dateWithTimeInterval:60 * 60 * 24*i sinceDate:date];
      //  NSString * tomorrowdate =[formatter stringFromDate:tomorrow];
        
        
        NSString * dt = [NSString stringWithFormat:@"%li-%li-%li",[self year:tomorrow],[self month:tomorrow],[self day:tomorrow]];
        JopMode *jop =[JopMode new];
        jop.titleMeth =dt;
        jop.isSelect= NO;
        
        
        [a addObject:jop];
    }
    
    
    
   
    
    
    
//    for (int i=0; i<arrar.count; i++) {
//        
//        
//        
//        [a addObject:jop];
//        
//        
//    }
//    
    return a;
    
    
    
}

+(NSInteger)day:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components day];
}


+(NSInteger)month:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components month];
}

+(NSInteger)year:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components year];
}
+(NSArray*)shujuArray{
    
    NSArray * arrar = @[
                        @{@"香港君悅酒店 ":@[@"扒房",@"意大利餐廳",@"Tiffin",@"The Grill"]},
                        
                        @{@"帝苑酒店 ":@[@"The Greenery"]},
                        
                        @{@"九龍香格里拉酒店 ":@[@""]},
                        
                        @{@"港島香格里拉酒店 ":@[@"Lobby Lounge",@"Cafe",@"龍蝦吧"]},
                        
                        @{@"洲際酒店 ":@[@"大堂酒廊",@"扒房",@"鐘仔房",@"日本餐廳",@"意大利餐廳"]},
                        
                        @{@"尖沙咀凱悅酒店 ":@[@"凱悅軒",@"希戈餐廳（意大利）",@"請請吧"]},
                        
                        @{@"Kerry Hotel ":@[@"大堂茶座",@"大灣咖啡廳 ",@"紅糖",@"百味村",@"又一城 安南越南餐廳 "]},
                        
                        @{@"沙田凱悅酒店 ":@[@"意大利餐廳"]},
                        
                        @{@"美麗華酒店 ":@[@"Yamm",]},
                        @{@"旺角康德思酒店 ":@[@"The Place"]},
                        ];

    return arrar;
    
}
+(NSArray*)getHolte{
    
  //  NSArray * arrar = @[
    //   @{@"香港君悅酒店 ":@[@"扒房",@"意大利餐廳",@"Tiffin",@"The Grill"]},
       
     //  @{@"帝苑酒店 ":@[@"The Greenery"]},
       
     //    @{@"九龍香格里拉酒店 ":@[@""]},
       
    //   @{@"港島香格里拉酒店 ":@[@"Lobby Lounge",@"Cafe",@"龍蝦吧"]},
       
    //   @{@"洲際酒店 ":@[@"大堂酒廊",@"扒房",@"鐘仔房",@"日本餐廳",@"意大利餐廳"]},
       
    //    @{@"尖沙咀凱悅酒店 ":@[@"凱悅軒",@"希戈餐廳（意大利）",@"請請吧"]},
       
    //    @{@"Kerry Hotel ":@[@"大堂茶座",@"大灣咖啡廳 ",@"紅糖",@"百味村",@"又一城 安南越南餐廳 "]},
       
      //  @{@"沙田凱悅酒店 ":@[@"意大利餐廳"]},
       
      //  @{@"美麗華酒店 ":@[@"Yamm",]},
      //  @{@"旺角康德思酒店 ":@[@"The Place"]},
                    //        ];
    
    NSArray* arrar = [self shujuArray];
    NSLog(@"%@",arrar);
    
    NSMutableArray *  a =[NSMutableArray array];
    
    
    
    for (int i=0; i<arrar.count; i++) {
        
        JopMode *jop =[JopMode new];
        
      NSDictionary * dict = arrar[i];
        
       jop.titleMeth = [[dict allKeys] firstObject];
        
       // NSArray *arrayr =jop.dict[arrar[i]];
        jop.isSelect= NO;
        
        [a addObject:jop];
        
        
    }
    
    return a;

    
    
    
    
}
+(NSArray*)gerestArray:(NSArray*)arrar{
    
    
    NSMutableArray *  a =[NSMutableArray array];
    
    
    
    for (int i=0; i<arrar.count; i++) {
        
        JopMode *jop =[JopMode new];
        
     //   NSDictionary * dict = arrar[i];
        
        jop.titleMeth = arrar[i];
        
        // NSArray *arrayr =jop.dict[arrar[i]];
        jop.isSelect= NO;
        
        [a addObject:jop];
        
        
    }
    
    return a;

    
    
    
}
+(NSArray*)getAgeshuju{
    
    
    NSArray * arrar = @[@"18歲以上 ",@"60歲以下 "];
    
    NSMutableArray *  a =[NSMutableArray array];
    
    
    
    for (int i=0; i<arrar.count; i++) {
        
        JopMode *jop =[JopMode new];
        jop.titleMeth =arrar[i];
        jop.isSelect= NO;
        
        [a addObject:jop];
        
        
    }
    
    return a;
    
    
    
    
    
    
    
}
@end
