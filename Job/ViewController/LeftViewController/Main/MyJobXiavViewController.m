//
//  MyJobXiavViewController.m
//  Job
//
//  Created by bidiao on 2017/7/14.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "MyJobXiavViewController.h"
#import "MyJobTableViewCell.h"
#import "JopMode.h"
#import "HYWorkdetailsViewController.h"
#import "FMDB.h"
#import "MyJobPeopleTableViewCell.h"
#import "JobapplicantsViewController.h"

@interface MyJobXiavViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) NSMutableArray * workArrar;
@property(nonatomic,strong) FMDatabase * db;

@property(nonatomic,strong) UITableView * peopletable;
@property(nonatomic,strong) UIView * pepleView;
@property(nonatomic,strong) UIButton * pepleViewButton;
@property(nonatomic) BOOL isan;
@property(nonatomic,strong) UILabel * titlable;
#define kDocumentPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject
@end

@implementation MyJobXiavViewController

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.backgroundColor = [UIColor redColor];
    }
     return _tableView;
    
}
-(UILabel *)titlable {
    if (!_titlable) {
        _titlable = [UILabel new];
        
        
        
        _titlable.frame =CGRectMake(10, 4, self.view.frame.size.width*2/3, 40);
        _titlable.text = @"有關工作申請人";
        
        _titlable.textColor =  [UIColor colorWithRed:61/255.0 green:0/255.0 blue:123/255.0 alpha:1];
    }
    
    return _titlable;
    
}
-(UITableView *)peopletable {
    if (!_peopletable) {
        
        
      
        
        _peopletable = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.pepleView.frame.size.height-44) style:UITableViewStylePlain];
        _peopletable.delegate = self;
        _peopletable.dataSource = self;
        _peopletable.backgroundColor = [UIColor yellowColor];
    }
    return _peopletable;
    
}
-(UIView *)pepleView {
    if (!_pepleView) {
        _pepleView = [UIView new];
        
        
        UIView * lineView =[UIView new];
        
        lineView.frame = CGRectMake(0, 0, self.view.frame.size.width, 4);
        
        lineView.backgroundColor = [UIColor colorWithRed:170/255.0 green:90/255.0 blue:251/255.0 alpha:1];
        
        [self.pepleView addSubview:lineView];
     
        
        self.pepleViewButton = [UIButton new];
        
        [self.pepleViewButton addTarget:self action:@selector(disspeple) forControlEvents:UIControlEventTouchUpInside];
        
        self.pepleViewButton.frame = CGRectMake(self.view.frame.size.width*2/3+20, 4, self.view.frame.size.width/3-30, 40);
        
        self.pepleViewButton.backgroundColor = [UIColor yellowColor];
       ;
    }
    
    return _pepleView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isan = YES;
    
    self.workArrar = [NSMutableArray array];
    
    self.view.backgroundColor =[UIColor whiteColor];
    
    self.title = @"申請的職位";
 
    NSString * fileName = [kDocumentPath stringByAppendingPathComponent:@"creNO.sqlite" ];
    
    self.db =[FMDatabase databaseWithPath:fileName];
   
    [self.view addSubview:self.tableView];
    
    
    [self selectshuj];
    // Do any additional setup after loading the view.
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
            
            NSString * releasedate  =[rs stringForColumn:@"releasedate"];
            
            NSLog(@"%@,%@,%@,%@,%@,%@,%ld,%ld,%ld,%ld,%ld,%@,%@,%@,%@,%@,%@,%@,%@,%@,",address,name,workDate,startTime,stopTime,togetherTime,(long)numberOf,(long)hourlyWage,(long)allowance,(long)intotalMoneny,employersgMoney,hotel,restaurant,language,file,theAmountOf,clothing,age,sex,workdetails
                  
                  
                  );
            
             JopMode * jop= [JopMode addModel:[NSString stringWithFormat:@"%@\n%@\n %@",startTime,stopTime,togetherTime] name:name popole:[NSString stringWithFormat:@"%ld",numberOf] money:[NSString stringWithFormat:@"HKD$%ld",intotalMoneny] detail:[NSString stringWithFormat:@"服装要求:%@",clothing] wokDate: workDate language:language file:file theAmountOf:theAmountOf hourlyWage:hourlyWage allowance:allowance address:address age:age clothing:clothing startTime:startTime stopTIme:stopTime togetherTime:togetherTime hotel:hotel restaurant:restaurant releasedate:releasedate];
            
          [ self.workArrar addObject:jop];
            
        }
        
    }
    
    [self.db close];
}

-(void)addjopModel{
    
 //self.workArrar =   [JopMode addModelWorkdetailsViewname:@"waite" date:@"2017-6-8" progress:@"1"];
    
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    if (tableView==self.tableView) {
         return self.workArrar.count;
    }else{
        
        return 10;
    }
   
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView==self.tableView) {
        
        static NSString * ID = @"MyCell";
        MyJobTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!cell) {
            cell = [[MyJobTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        }
        
        JopMode * jop = self.workArrar[indexPath.row];
        
        cell.titleString = jop.nameString;
        
        cell.dateString = jop.workdate;
        
        cell.progressString = @"1";
        
        [cell.intbutton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        
        cell.intbutton.tag = indexPath.row;
        
        
        return cell;
    }else{
        
        static NSString * ID = @"MyCell";
        MyJobPeopleTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!cell) {
            cell = [[MyJobPeopleTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        }
        
        cell.nameTitle = @"May Chan";
        
        cell.dateTitle = @"7月13日2017年   09:54:39";
        
        return cell;

    }
    

}
-(void)clickButton:(UIButton*)btn{
    
    NSLog(@" %ld",btn.tag);
    
    
    
    if (self.isan) {
        
        self.tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height*2/3);
        
        self.pepleView.frame = CGRectMake(0, CGRectGetMaxY(self.tableView.frame), self.view.frame.size.width,  self.view.frame.size.height/3);

        
       // self.pepleView.backgroundColor = [UIColor blueColor];
        [self.pepleView addSubview:self.pepleViewButton];
        
        [self.pepleView addSubview:self.titlable];
        
        [self.pepleView addSubview:self.peopletable];
        [self.view addSubview:self.pepleView];
        
        self.isan = NO;
    }
    //[self.peopletable reloadData];
    
    
}
#pragma mark =======消失=======
-(void)disspeple{
    

    self.isan = YES;
    
    [self.pepleView removeFromSuperview];
    
    self.tableView.frame = self.view.frame;
    
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    cell.separatorInset = UIEdgeInsetsZero;
    
    cell.layoutMargins = UIEdgeInsetsZero;
    
}
#pragma mark =======cell高度=======
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}
#pragma mark =======点击=======
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView==self.tableView) {
        
        NSDictionary * a =@{@"name":@3};
        
        NSString * path = [kDocumentPath stringByAppendingString:@"a"];
        
        
        [a writeToFile:path atomically:YES];
        
        HYWorkdetailsViewController * workVc = [HYWorkdetailsViewController new];
        
        workVc.array = [NSMutableArray array];
        
        [workVc.array addObject:self.workArrar[indexPath.row]];
        
        [self.navigationController pushViewController:workVc animated:YES];
    
        
    }else{
        
        NSLog(@"aaa");
        JobapplicantsViewController * jopapplicants = [JobapplicantsViewController new];
        
        [self.navigationController pushViewController:jopapplicants animated:YES];
        
    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
