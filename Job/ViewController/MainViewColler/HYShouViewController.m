//
//  HYShouViewController.m
//  Job
//
//  Created by bidiao on 2017/7/12.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "HYShouViewController.h"
#import "SZCalendarPicker.h"
#import "HYWorkdetailsViewController.h"
#import "JobTableViewCell.h"
#import "JopMode.h"
#import "UIImage+Extension.h"
#import "PeopleEditorViewController.h"
#import "FMDB.h"
@interface HYShouViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) UILabel * dateLabel;
@property(nonatomic,strong) UIView * viewa;

@property(nonatomic,strong) FMDatabase * db;
@property(nonatomic,strong) NSMutableArray * dateMutable;
@property(nonatomic,strong) NSMutableArray * shuarray;

@property(nonatomic,strong)  SZCalendarPicker *calendarPicker ;
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0
#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
#define kNaHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?20:0)
#define kTopHeight (kStatusBarHeight + kNavBarHeight)

#define kNaheging  [[UIDevice currentDevice] systemVersion].floatValue >10.0 ? 20:0
#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
@end

@implementation HYShouViewController

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 398+kNaHeight, self.view.frame.size.width, self.view.frame.size.height-394-kNaHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
    }
    
    return _tableView;
    
}
-(UILabel *)dateLabel {
    if (!_dateLabel) {
        
        UIView * view = [UIView new];
        
        view.backgroundColor = fontColor(101, 51, 145);
        
        view.frame=CGRectMake(0, 364+kNaHeight, self.view.frame.size.width, 4);
        [self.view addSubview:view];
        _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 368+kNaHeight, self.view.frame.size.width, 30)];
      //  NSLog(@"------ kkksfds  %d",);
        _dateLabel.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
        _dateLabel.textColor =[UIColor colorWithRed:139/255.0 green:139/255.0 blue:140/255.0 alpha:1 ];
       // _dateLabel.backgroundColor =[UIColor redColor];
        _dateLabel.textAlignment = NSTextAlignmentCenter;
        
        
    }
    
    return _dateLabel;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"shujutijiao" object:nil];
    
  ///CGFloat f =  [[UIDevice currentDevice] systemVersion].floatValue;
    
    //CGFloat B =  [[UIApplication sharedApplication] statusBarFrame].size.height;
   // NSLog(@"fff%f  %d %f",f,kNaheging,B);
    
    self.array = [NSMutableArray array];
    self.shuarray = [NSMutableArray array];
    // Do any additional setup after loading the view.
   // self.view.backgroundColor = [UIColor orangeColor];
   // [self addpicker];
    self.title = @"即聘";
    
    [self.navigationController.navigationBar setTitleTextAttributes:
    
    
    @{NSFontAttributeName:[UIFont systemFontOfSize:19],
      NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [self adddatefile];
    
    [self addmeirilable];
    
    [self addrightButton];
    
    [self addpicker];
    
    [self selectshuj];

}
-(void)addmeirilable{
    
    self.view.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
    [self.view addSubview:self.dateLabel];
    NSDate * date = [NSDate date];
    
    NSDateFormatter *formaet = [[NSDateFormatter alloc]init];
    
    [formaet setDateFormat:@"MM月dd日yyyy年"];
    
    NSString * dateString =   [formaet stringFromDate:date];
    self.dateLabel.text = [NSString stringWithFormat:@"每日即聘 %@",dateString]  ;
    
     self.dateLabel.textColor = fontColor(95, 51, 143);
    
    
    [self.view addSubview:self.tableView];
}
-(void)adddatefile{
    
    // 1.获得数据库文件的路径
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filename = [doc stringByAppendingPathComponent:@"creNO.sqlite"];
    
    self.db =[FMDatabase databaseWithPath:filename];
    
    self.dateMutable = [NSMutableArray array];

    
}
-(void)addrightButton{
    
    UIButton * right = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    
    [right setBackgroundImage:[UIImage imageNamed:@"adda"]  forState:UIControlStateNormal];
    
    
    [right addTarget:self action:@selector(addButonwork) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:right];
    
    self.navigationItem.rightBarButtonItem = item;
    
    
    
    
    
}

-(void)addButonwork{
    
    [self.navigationController pushViewController:[PeopleEditorViewController new] animated:YES];
    
  //  NSLog(@"点击");
}
-(void)addpicker{
    
    self.viewa = [[UIView alloc]initWithFrame:CGRectMake(0, kNaHeight, self.view.frame.size.width, 364)];
    
    [self.view addSubview:self.viewa];
    
  self.calendarPicker = [SZCalendarPicker showOnView:_viewa];
    self.calendarPicker.today = [NSDate date];
    
    self.calendarPicker.isShuju = YES;
    
    
    __weak  typeof(self) myself = self;
    self.calendarPicker.date = self.calendarPicker.today;
    self.calendarPicker.frame = CGRectMake(0, 64, self.view.frame.size.width, 300);
    self.calendarPicker.calendarBlock = ^(NSInteger day, NSInteger month, NSInteger year){
        
        NSLog(@"%li-%li-%li", (long)year,(long)month,(long)day);
        
       myself.dateLabel.text = [NSString stringWithFormat:@"每日即聘 %li月%li日%li年", (long)month,(long)day,(long)year];
        
         [myself.array removeAllObjects];
        
    
        
        NSString * dateString = [NSString stringWithFormat:@"%li-%li-%li", (long)year,(long)month,(long)day];
        
        BOOL isdate = [myself.dateMutable containsObject:dateString];
        
        if (isdate) {
            
          
            
           // NSArray * arr = [JopMode addModel:@" 8:00\n18:00\n 10h" name:@"waiter" popole:@"5人" money:@"HKD$800" detail:@"服装要求:便装，纯黑色皮鞋,所需语。。"];
            for (int i= 0; i<myself.shuarray.count; i++) {
                
                JopMode * job = myself.shuarray[i];
           
               
                if ([job.workdate isEqualToString:dateString]) {
                    
                       [myself.array addObject:myself.shuarray[i]];
                    // NSLog(@"7777777 %@",job.agef);
                    
                    
                }
                
                
            }
            
        
            //myself.array = myself.shuarray;
            
           // NSLog(@" %@fff %@",myself.array ,myself.shuarray);
           // [self.tableView reloadData];
            
            
        }else{
            
           // [self.array removeAllObjects];
            
           
        }
        
         [myself.tableView reloadData];
    };


    
    
    
}
-(void)selectshuj{
    
    
    
    
    if ([self.db open]) {
        
          // NSString * sql =  [ NSString  stringWithFormat:@"SELECT * FROM Joblog where crnNO = '%@' ",self.cnString ];
        [self.shuarray removeAllObjects];
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
            NSString * hotel = [rs stringForColumn:@"hotel"];
            
            NSString * restaurant = [rs stringForColumn:@"restaurant"];
            
            NSString * language = [rs stringForColumn:@"language"];
            
            NSString * file= [rs stringForColumn:@"file"];
            
            NSString * theAmountOf = [rs stringForColumn:@"theAmountOf"];
            
            NSString * clothing = [rs stringForColumn:@"clothing"];
            
            NSString * age = [rs stringForColumn:@"age"];
            
            NSString * workdetails = [rs stringForColumn:@"workdetails"];
            
            NSString * releasedate  =[rs stringForColumn:@"releasedate"];
            
            NSLog(@"%@,%@,%@,%@,%@,%@,%ld,%ld,%ld,%ld,%@,%@,%@,%@,%@,%@,",address,name,workDate,startTime,stopTime,togetherTime,(long)numberOf,(long)hourlyWage,(long)allowance,(long)intotalMoneny,language,file,theAmountOf,clothing,age,workdetails);
           // [NSString stringWithFormat:@" %@\n%@\n %@",startTime,stopTime]
         //服装要求
            JopMode * jop= [JopMode addModel:[NSString stringWithFormat:@"%@\n%@\n%@",startTime,stopTime,togetherTime] name:name popole:[NSString stringWithFormat:@"%ld",numberOf] money:[NSString stringWithFormat:@"HKD$%ld",intotalMoneny] detail:[NSString stringWithFormat:@"服装要求:%@",clothing] wokDate: workDate language:language file:file theAmountOf:theAmountOf hourlyWage:hourlyWage allowance:allowance address:address age:age clothing:clothing startTime:startTime stopTIme:stopTime togetherTime:togetherTime hotel:hotel restaurant:restaurant releasedate:releasedate];
            
            [self.dateMutable addObject:workDate];
            [self.shuarray addObject:jop];
        }
        
    }
    
    [self.db close];
}
#pragma mark =======UITableDataSour=======
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.array.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString * ID = @"MyCell";
    JobTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[JobTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
 
    JopMode * jop = self.array[indexPath.row];
    
    //cell.dateString = jop.dateString;
    cell.startdateString = jop.startTime;
    cell.stopString = jop.stopTIme;
    cell.togertimeString = jop.togetherTime;
    cell.nameString = jop.nameString;
    cell.popoleString = jop.popoleString;
    cell.moneyString = jop.moneyString;
    cell.detailsString =jop.detailsString;
 
    return cell;

}
#pragma mark =======delegate=======
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HYWorkdetailsViewController * de = [[HYWorkdetailsViewController alloc]init];
    de.array= [NSMutableArray array];
    

    
    [de.array addObject:self.array[indexPath.row]];
    
    [self.navigationController pushViewController:de animated:YES];
    
    
    
   // NSLog(@"点击");
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 120;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)receiveNotification:(NSNotification *)notification{
    
     [self selectshuj];
    
   // NSLog(@"刷行了");
    [self.calendarPicker.collectionViewa reloadData];

    
}

//当界面从内存中删除掉的时候，需要去掉通知中心中的注册
- (void)dealloc{
    
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
