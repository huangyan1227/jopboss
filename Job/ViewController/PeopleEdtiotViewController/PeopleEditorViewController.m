//
//  PeopleEditorViewController.m
//  Job
//
//  Created by bidiao on 2017/7/18.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "PeopleEditorViewController.h"
//#import "PeopleEditorTableViewCell.h"
#import "JopMode.h"
#import "PresonInTableViewCell.h"
#import "EditorpeoopleTableViewCell.h"
#import "WSDatePickerView.h"
#import "SZCalendarPicker.h"
#import "PeoplelangerViewController.h"
#import "ChuliangViewController.h"
#import "FMDB.h"
#import "PeopleEdidtoMode.h"
#import "HotleViewViewController.h"
#import "LXKColorChoice.h"
#import "ThereleasedateViewController.h"

@interface PeopleEditorViewController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,LXKColorChoiceDelegate>

@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) NSArray * jopArray;
@property(nonatomic,strong) FMDatabase * db;
@property(nonatomic,weak) EditorpeoopleTableViewCell * cell;
@property(nonatomic,strong) NSString * whereControllerStringpath;
@property(nonatomic,strong) PeopleEdidtoMode * edidtoMode;
@property(nonatomic,strong) NSString * generalString;//通用赋值

@property(nonatomic,strong) LXKColorChoice * jobnamelx;

@property(nonatomic,strong) UIButton * restButton;
@property(nonatomic,strong) UITextField * textzon;

@property(nonatomic,assign) NSInteger workdateyear;
@property(nonatomic,assign) NSInteger workdateMoth;
@property(nonatomic,assign) NSInteger workdateday;

@property(nonatomic,strong) NSMutableArray * resdateArray;

@end
#define kDocumentPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject

#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
@implementation PeopleEditorViewController

-(UITableView *)tableView {
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
    }
    
    return _tableView;
    
}
-(NSString *)whereControllerStringpath {
    if (!_whereControllerStringpath) {
    
        
        _whereControllerStringpath = [kDocumentPath stringByAppendingPathComponent:@"apath.plist"];
    }
    
    return _whereControllerStringpath;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.resdateArray = [NSMutableArray array];
    [self addtitle];
  
    self.edidtoMode = [PeopleEdidtoMode new];
    
    self.tableView.estimatedSectionFooterHeight = 0;
    
    self.tableView.estimatedSectionHeaderHeight = 0;
    
    
    // 1.获得数据库文件的路径
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filename = [doc stringByAppendingPathComponent:@"creNO.sqlite"];
    
    self.db =[FMDatabase databaseWithPath:filename];
    
    self.jopArray =  [JopMode getModePresonEditor];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self changbiao];
    
     [self.edidtoMode addObserver:self forKeyPath:@"hotel" options:NSKeyValueObservingOptionNew context:nil];
        // Do any additional setup after loading the view.
}
//创表
-(void)changbiao{
    
    if ([self.db open]) {
        
        BOOL result = [self.db executeUpdate:@"CREATE TABLE IF NOT EXISTS sJobcar (dbid integer PRIMARY KEY AUTOINCREMENT, address TEXT  NULL,name TEXT  NULL, workDate TEXT  NULL,startTime TEXT  NULL,stopTime TEXT  NULL, togetherTime  TEXT  NULL,numberOf integer NULL, hourlyWage integer  NULL, allowance integer  NULL, intotalMoneny integer  NULL,employersgMoney integer  NULL, hotel TEXT NULL ,restaurant TEXT NULL ,language TEXT NULL ,file TEXT NULL, theAmountOf TEXT NULL,clothing TEXT NULL ,age TEXT NULL,sex TEXT NULL,workdetails TEXT NULL,releasedate TEXT NULL);"];
        
        if (result) {
            NSLog(@"changgon");
        }else{
            
            NSLog(@"失败");
        }
    }
   
    
    
}
//插入数据
-(void)inistJob{
    
//    if ([self.db open]) {
//        
//        
//       
//        NSString *insertSql1= [NSString stringWithFormat:@"INSERT INTO sJobcar (address, name, workDate,startTime,stopTime,togetherTime,numberOf,hourlyWage,allowance,intotalMoneny,language,file,theAmountOf,clothing,age,workdetails) VALUES ('%@','%@','%@','%@','%@','%@','%d','%d','%d','%d','%@','%@','%@','%@','%d','%@')",b , self.dataString, time,c,title,bol];
//        
//        
//        
//        
//        
//        
//        BOOL res = [self.db executeUpdate:insertSql1];
//        
//        if (res) {
//            //  NSLog(@"日志数据插入表成功");
//        } else {
//            // NSLog(@"日志数据插入表失败");
//        }
//        //  }
//        
//        
//        
//    }
//    [self.db close];
    
    
    
    
}
-(void)addtitle{
    
    self.title = @"發布招聘";
    [self.navigationController.navigationBar setTitleTextAttributes:
     
     
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    
    self.view.backgroundColor = [UIColor whiteColor];

    
    
}
#pragma mark =======TableViewDelegate=======

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.jopArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //static NSString * ID = @"MyCell";
    
   NSString * d =  [NSString stringWithFormat:@"Cell%ld%ld", [indexPath section], [indexPath row]];
    
    EditorpeoopleTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier: d];
    
    
    if (!cell) {
        
   cell = [[  EditorpeoopleTableViewCell  alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:d];
    }
 
    JopMode * jop = self.jopArray[indexPath.row];
    
    cell.labeTitleString = jop.nametitleString;
    
   
    
       if (4<indexPath.row && indexPath.row<9) {
            
           cell.tagInteger = indexPath.row+1000;
           
            cell.istext = YES;
            [cell.textFile addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
                
                cell.textFile.keyboardType = UIKeyboardTypeNumberPad;
      
           
            cell.accessoryType = UITableViewCellAccessoryNone;
           
        }else{
    
            
            if (0<=indexPath.row && indexPath.row<5) {
                
               
                 cell.isbutton = YES;
                 cell.accessoryType = UITableViewCellAccessoryNone;
                
                cell.tagInteger = indexPath.row+100;
                
                [cell.button addTarget:self action:@selector(clickBu:) forControlEvents:UIControlEventTouchUpInside];
                
            }else if(indexPath.row==15){
                
                cell.isDetails =YES;
                cell.accessoryType = UITableViewCellAccessoryNone;
                cell.textView.delegate = self;
            }else {
                
                cell.isbutton = YES;
                
                cell.tagInteger = indexPath.row+100;
                
                [cell.button addTarget:self action:@selector(clickBu:) forControlEvents:UIControlEventTouchUpInside];
                
           cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
        }
    
    self.cell = cell;
   
    return cell;

}
#pragma mark =======cell高度=======
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==15) {
        
        return 220;
    }else{
        
        return 44;
    }
    
}
#pragma mark =======获取TextFiled的值=======
-(void)textFieldDidChange :(UITextField *)theTextField{
    
    
    
    UITextField * textf = [self.view viewWithTag:1008];
    if (theTextField.tag==1005){
        //空缺人数
        self.edidtoMode.numberof = theTextField.text.integerValue;
       // self.edidtoMode.togetherTime = theTextField.text;
        
    }else if (theTextField.tag==1006){
        
        //时薪
        self.edidtoMode.hourlyWage = theTextField.text.integerValue;
        
        NSLog(@"总数");
        NSInteger toger  = self.edidtoMode.hourlyWage + self.edidtoMode.allowance;
        textf.text = [NSString stringWithFormat:@"%ld",toger];
        
    }else if (theTextField.tag==1007){
        
       // UITextField * textf = [self.view viewWithTag:1008];
        //津贴
        self.edidtoMode.allowance = theTextField.text.integerValue;
        
       
        NSInteger toger  = self.edidtoMode.hourlyWage + self.edidtoMode.allowance;
        textf.text = [NSString stringWithFormat:@"%ld",toger];
        
        
        
    }else if (theTextField.tag ==1008){
        //总数
        self.edidtoMode.intotalMoneny =  theTextField.text.integerValue;
         NSLog(@"总ee数");
    }

   
}

#pragma mark =======点击button跳转页面=======
-(void)clickBu:(UIButton*)btn{
    // __weak  typeof(self) myself = self;;
    if (btn.tag==100) {
        //工作名称
        //NSLog(@"102");
        self.jobnamelx =[LXKColorChoice makeViewWithMaskDatePicker:self.view.frame setTitle:@"職位" Arr:@[@"侍應生",@"其他"]];
        
        self.jobnamelx.delegate = self;
     
    }else if (btn.tag==101){
        //工作日期
        [self addPickerTime:btn];

    
    }else if (btn.tag ==102){
        //NSLog(@"102");
        //上班时间
        [self selectActionbtn:btn];
        
    }else if (btn.tag==103) {
        //下班时间
          [self selectActionbtn:btn];
        
        //[self addPickerTime:btn];
        
    }else if (btn.tag==104){
       // 工作地址
        [self addHotVicntroller:btn shuint:@104];
        
       // [self selectActionbtn:btn];

    }else if (btn.tag==109){
        //出量
         [self addChlVicntroller:btn shuint:@109 ];
        
    }else if (btn.tag==110){
        
        
        PeoplelangerViewController * langer =  [PeoplelangerViewController new];
        __weak typeof(self) myself = self;
        [self.navigationController pushViewController:langer animated:YES];
        langer.lagueBlock = ^(NSString *string) {
            
            [btn setTitle:string forState:UIControlStateNormal];
            
            myself.edidtoMode.language = string;
        };
        
       //   [self addChlVicntroller:btn shuint:@112 ];
        
    }else if (btn.tag==111){
         //年龄要求
           [self addChlVicntroller:btn shuint:@111 ];
        
    }else if (btn.tag==112){
        //服装
        [self addChlVicntroller:btn shuint:@112 ];
        
    
    }else if (btn.tag==113){
        //申请文件
        [self addChlVicntroller:btn shuint:@113 ];
        
      
    }else if (btn.tag==114){
        //发布日期
        
        //[self addChlVicntroller:btn shuint:@114];
        ThereleasedateViewController * thereleasedate = [ThereleasedateViewController new];
        
        thereleasedate.datestring = self.edidtoMode.workDate;
        
        thereleasedate.dateblock = ^(NSString *string,NSArray*datearray) {
            
            [btn setTitle:string forState:UIControlStateNormal];
            
           for (int i=0; i<datearray.count; i++) {
               JopMode * model = datearray[i];
               NSLog(@"%@",model.titleMeth);
                 [self.resdateArray addObject:model.titleMeth];
               
           }

//
//                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//
//                [formatter setDateFormat:@"yyyy-MM-dd"];
//
//                NSDate *date = [formatter dateFromString:model.titleMeth];
//                NSLog(@"%li",[self day:date]);
          //  }
//            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:datearray options:NSJSONWritingPrettyPrinted error:nil];
//            NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            //self.edidtoMode.thereleasedate = jsonStr;
            
          
          
        };
        
        [self.navigationController pushViewController:thereleasedate animated:YES];
       
    }
}


//侍應生代理
-(void)getColorChoiceValues:(NSString *)values{
    
    
   // NSLog(@"--- %@",values);
    
    UIButton * btn = [self.view viewWithTag:100];
    [btn setTitle:values forState:UIControlStateNormal];
    self.edidtoMode.name = values;
}
#pragma mark =======酒店餐厅跳转=======
-(void)addHotVicntroller:(UIButton*)btn shuint:(NSNumber*)intetger{
    
    HotleViewViewController * hotle = [HotleViewViewController new];
    
    NSDictionary * a =@{@"n":intetger};
    
    
  
    NSString *path = [kDocumentPath stringByAppendingPathComponent:@"th.plist"];
    
    
    [a writeToFile:path atomically:YES];
 
    __weak  typeof(self) myself = self;
    
      __block NSNumber *ainttger = intetger;
      hotle.hotelblock = ^(NSString *string) {
          
          [btn setTitle:string forState:UIControlStateNormal];
          btn.titleLabel.numberOfLines=0;
          
          btn.titleLabel.adjustsFontSizeToFitWidth=YES;
          
          
          
         if ([ainttger isEqual:@104]) {
              
              myself.edidtoMode.hotel = string;
          
             
            
          }else if ([ainttger isEqual:@101]){
              
              
              
              myself.edidtoMode.restaurant = string;

          }

        
    } ;
    
    if (hotle.titleString.length == 0) {
        
        hotle.titleString=self.edidtoMode.hotel;
        
    }
    
   
    
    [self.navigationController pushViewController:hotle animated:YES];
    
}
#pragma mark =======监听=======
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    if ([keyPath isEqualToString:@"hotel"]) {
        
        [self.restButton setTitle:@"" forState:UIControlStateNormal];
        
        
    }
    
    
    
}
-(void)addChlVicntroller:(UIButton*)btn shuint:(NSNumber*)inttger{
    
    NSDictionary * a =@{@"n":inttger};
    
  
    [a writeToFile:self.whereControllerStringpath atomically:YES];
    ChuliangViewController * new = [ChuliangViewController new];
    //__weak __typeof(&*self)weakSelf =self;
    
     __weak  typeof(self) myself = self;
    
  __block NSNumber *ainttger = inttger;
        new.chulblock = ^(NSString *string) {
            
        [btn setTitle:string forState:UIControlStateNormal];
        btn.titleLabel.numberOfLines=0;
            
        btn.titleLabel.adjustsFontSizeToFitWidth=YES;
            
            if ([ainttger isEqual:@111]) {
                
                //年龄要求
                 myself.edidtoMode.age = string ;
                //self.edidtoMode.hotel = string;
                
            }else if ([ainttger isEqual:@112]){
                //服装
                 myself.edidtoMode.clothing = string;
                
            }else if ([ainttger isEqual:@113]) {
                //文件
                 myself.edidtoMode.file= string;
                
          }//else if ([ainttger isEqual:@113]){
//
//                myself.edidtoMode.thereleasedate = string;
//                
//            }


       
    };
    
    [self.navigationController pushViewController:new animated:YES];
    
    
    
    
}
#pragma mark =======获取时间按钮和值=======
-(void)addPickerTime:(UIButton*)btn{

        __weak  typeof(self) myself = self;
   SZCalendarPicker *calendarPicker = [SZCalendarPicker showOnView:self.view];
  calendarPicker.today = [NSDate date];


 calendarPicker.date = calendarPicker.today;
    calendarPicker.ishide =YES;
 calendarPicker.frame = CGRectMake(0, 64, self.view.frame.size.width, 300);
 calendarPicker.calendarBlock = ^(NSInteger day, NSInteger month, NSInteger year){
    
    //NSLog(@"%li-%li-%li", (long)year,(long)month,(long)day);
     
    NSString* tring = [NSString stringWithFormat:@"%li-%li-%li", (long)year,(long)month,(long)day];
     
      myself.edidtoMode.workDate = tring;
     
     [self.resdateArray  addObject:self.edidtoMode.workDate];
     
     self.workdateyear = year;
     self.workdateMoth = month;
     self.workdateday = day;
     [btn setTitle:tring forState:UIControlStateNormal];
     
     
     
};
    
}
#pragma mark =======时间=======
- (void)selectActionbtn:(UIButton*)btn {
        __weak  typeof(self) myself = self;
    
    WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowHourMinute CompleteBlock:^(NSDate *startDate) {
        
        NSString *date = [startDate stringWithFormat:@"HH:mm"];
        
        [btn setTitle:date forState:UIControlStateNormal];
        
        if (btn.tag ==102) {
            
            myself.edidtoMode.startTime = date;
            
        }else if (btn.tag==103){
           
          myself.edidtoMode.stopTIme= date;
            
            
            NSTimeInterval toda = [myself intervalFromLastDate:self.edidtoMode.startTime toTheDate:date];
            
              NSInteger t = toda/3600;
            
          // myself.textzon = (UITextField*)[self.view viewWithTag:1007];
            
           // NSLog(@"gg %ld",(long)self.textzon.tag);
            
            NSString * togtime =[NSString stringWithFormat:@"%0.2f",toda/3600];
            
           
            
            self.edidtoMode.togetherTime = togtime;
          //  myself.textzon.textAlignment = NSTextAlignmentCenter;
        }
        
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    }];
    datepicker.doneButtonColor = [UIColor orangeColor];//确定按钮的颜色
    [datepicker show];
    
}
-(NSTimeInterval)intervalFromLastDate:(NSString*)dateString1 toTheDate:(NSString*)dateString2{
    
    NSArray *timeArray1=[dateString1 componentsSeparatedByString:@"."];
    dateString1=[timeArray1 objectAtIndex:0];
    NSArray *timeArray2=[dateString2 componentsSeparatedByString:@"."];
    dateString2=[timeArray2 objectAtIndex:0];
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"HH:mm"];
    NSDate * date1 =[date dateFromString:dateString1];
    NSTimeInterval late1=[date1 timeIntervalSince1970]*1;
    NSDate * date2=[date dateFromString:dateString2];
    NSTimeInterval late2=[date2 timeIntervalSince1970]*1;
    NSTimeInterval tdoa = late2 - late1;

     return tdoa;
}
-(void)timecha{
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 64;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 1;
}
#pragma mark =======底部提交按钮=======
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView * view= [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 44)];
    
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(20, 0, tableView.frame.size.width-40, 44)];
    
    [button addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    
    button.layer.masksToBounds = YES;
    
    button.layer.cornerRadius = 15;
    
    button.backgroundColor = [UIColor colorWithRed:119/255.0 green:83/255.0 blue:146/255.0 alpha:1];
    
    [button setTitle:@"遞 交" forState:UIControlStateNormal];
    
    [view addSubview:button];
    

    return view;
}
#pragma mark =======提交=======
-(void)submit{
    
    //判断是否为空
  // [self judge];
    
   [self inistJobb];
    
   [self addNotion];
    
   [self.navigationController popViewControllerAnimated:YES];

    
}
#pragma mark =======提示不能为空=======
-(void)judge{
    
    if (self.edidtoMode.address==nil|| self.edidtoMode.name == nil || self.edidtoMode.workDate ==nil || self.edidtoMode.startTime == nil || self.edidtoMode.hourlyWage == 0) {
        
        [self tangchuduihuakuan:@"信息"];
        
        return;
     
    }
    
}

-(void)tangchuduihuakuan:(NSString *)title{
  
    
    UIAlertAction * action =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertController * aleart = [UIAlertController alertControllerWithTitle:@"提示" message:  [NSString stringWithFormat:@"%@不能为空",title] preferredStyle:UIAlertControllerStyleAlert];
    
    [aleart addAction:action];
    

    
    [self presentViewController:aleart animated:YES completion:nil];
    
    
    
    
}

#pragma mark =======插入数据=======
-(void)inistJobb{
    
    // hotel TEXT NULL ,restaurant TEXT NULL ,
     for (int i= 0; i<self.resdateArray.count; i++) {
         
         self.edidtoMode.workDate =self.resdateArray[i];
         
         NSLog(@"e33 %@",self.resdateArray[i]);
      //   NSString * workdate = job.titleMeth;
        if ([self.db open]) {
            
           
                
        
            NSString *insertSql1= [NSString stringWithFormat:@"INSERT INTO sJobcar (address,name, workDate,startTime,stopTime,togetherTime,numberOf,hourlyWage,allowance,intotalMoneny,employersgMoney,hotel,restaurant,language,file,theAmountOf,clothing,age,sex,workdetails,releasedate) VALUES ('%@','%@','%@','%@','%@','%@','%ld','%ld','%ld','%ld','%ld','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')",self.edidtoMode.address,self.edidtoMode.name,self.edidtoMode.workDate,self.edidtoMode.startTime,self.edidtoMode.stopTIme,self.edidtoMode.togetherTime,self.edidtoMode.numberof,self.edidtoMode.hourlyWage,self.edidtoMode.allowance,self.edidtoMode.intotalMoneny,self.edidtoMode.employersgMoney,self.edidtoMode.hotel,self.edidtoMode.restaurant,self.edidtoMode.language,self.edidtoMode.file,self.edidtoMode.theAmountOf,self.edidtoMode.clothing,self.edidtoMode.age,self.edidtoMode.sex,self.edidtoMode.workdetails,self.edidtoMode.thereleasedate];
   
            
            
            
            BOOL res = [self.db executeUpdate:insertSql1];
    
            if (res) {
                  NSLog(@"日志数据插入表成功");
            } else {
                 NSLog(@"日失败");
            }
       }
    
    

        [self.db close];
        }
    
    //[self selectshuj];
    
}
-(void)selectshuj{
    
    
    
    
    if ([self.db open]) {
        
        //查询某个数据where crnNO = '0020170222'
        NSString * sql = @"SELECT * FROM sJobcar ";
        FMResultSet * rs = [self.db executeQuery:sql];
        while ([rs next]) {
            NSString *  address = [rs stringForColumn:@"address"];
            
            NSString *  name  = [rs stringForColumn:@"name"];

            NSString * workDate = [rs stringForColumn:@"workDate"];

            NSString * startTime = [rs stringForColumn:@"startTime"];

            NSString * stopTime = [rs stringForColumn:@"stopTime"];

            NSString * togetherTime = [rs stringForColumn:@"togetherTime"];

            NSInteger  numberOf = [rs intForColumn:@"numberOf"];
            
            NSInteger  hourlyWage = [rs intForColumn:@"hourlyWage"];
            
            NSInteger  allowance = [rs intForColumn:@"allowance"];
            
            NSInteger  intotalMoneny = [rs intForColumn:@"intotalMoneny"];
            NSInteger  employersgMoney = [rs intForColumn:@"employersgMoney"];
            
            NSString * hotel = [rs stringForColumn:@"hotel"];
            
            NSString * restaurant = [rs stringForColumn:@"restaurant"];
            
            NSString * language = [rs stringForColumn:@"language"];
            
            NSString * file= [rs stringForColumn:@"file"];
            
            NSString * theAmountOf = [rs stringForColumn:@"theAmountOf"];
            
            NSString * clothing = [rs stringForColumn:@"clothing"];
            
            NSString * age = [rs stringForColumn:@"age"];
            
            NSString * sex = [rs stringForColumn:@"sex"];

            
            NSString * workdetails = [rs stringForColumn:@"workdetails"];
            
            NSString * thereleasedate = [rs stringForColumn:@"releasedate"];
            
            NSLog(@"%@,%@,%@,%@,%@,%@,%ld,%ld,%ld,%ld,%ld,%@,%@,%@,%@,%@,%@,%@,%@,%@,,%@",address,name,workDate,startTime,stopTime,togetherTime,(long)numberOf,(long)hourlyWage,(long)allowance,(long)intotalMoneny,employersgMoney,hotel,restaurant,language,file,theAmountOf,clothing,age,sex,workdetails,thereleasedate
                  
                  
                  );
            
        }
        
    }
    
    [self.db close];
}

#pragma mark =======获取TextView的值=======
-(void)textViewDidEndEditing:(UITextView *)textView{
    
    self.edidtoMode.workdetails = textView.text;
    NSLog(@" %@",textView.text);
}

#pragma mark =======添加通知=======
-(void)addNotion{
    
    //发送通知,告诉所有收听本频道的控制器,全部把背景色变为红色
    //发通知，需要电视台 或者 广播台。
    //程序上来说， 需要一个 通知中心
    //获取通知中心，通知中心是单例，整个程序独一份
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    //使用通知中心发送通知
    //NotificationName 通知的名称， 类似于广播的频段，电视的频道
    //object 指的是谁发的消息
    //userInfo 字典类型， 发送的消息都放在这里
    [center postNotificationName:@"shujutijiao" object:self userInfo:@{@"B": [UIColor redColor]}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//当界面从内存中删除掉的时候，需要去掉通知中心中的注册
- (void)dealloc{
    
    [self.edidtoMode removeObserver:self forKeyPath:@"hotel"];
    //这个方法，在对象从内存中删除时，自动执行，我们可以重写，来掌握这个时间点
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
