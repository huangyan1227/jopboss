//
//  PersonMainViewController.m
//  Job
//
//  Created by bidiao on 2017/7/14.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "PersonMainViewController.h"
#import "PresonInTableViewCell.h"
#import "UIImage+Extension.h"
#import "ViewController.h"
#import "GenDerViewController.h"
@interface PersonMainViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) NSArray * array;
@property(nonatomic,strong) NSMutableArray * mutableArray;
@end

@implementation PersonMainViewController

-(UITableView *)tableView {
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
    }
    
    return _tableView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"個人信息";
   // NSLog(@"dddddd");
    self.navigationItem.hidesBackButton = YES;

    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:252/255.0 green:49/255.0 blue:89/255.0 alpha:1]] forBarMetrics:UIBarMetricsDefault];
    
    [self.view addSubview:self.tableView];
    
    [self backjobViewController];
    
    [self addshuju];
}
-(void)backjobViewController{
    
    UIButton * adbu = [[UIButton alloc]init];
    
    adbu.frame = CGRectMake(0, 0, 30, 30);
    
    
    [adbu addTarget:self action:@selector(backJob) forControlEvents:UIControlEventTouchUpInside];
    
    [adbu setBackgroundImage:[UIImage imageNamed:@"backa"] forState:UIControlStateNormal];
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:adbu];
    
    self.navigationItem.leftBarButtonItem = item;
    //[self.navigationController.navigationBar addSubview:adbu];
    
}
-(void)backJob{
    
    
    //[self popoverPresentationController];
    [self presentViewController:[ViewController new] animated:YES completion:nil];
   // NSLog(@"返回");
}
-(void)addshuju{
    
    
    self.array = @[@"頭像",@"性别",@"名稱",@"電話",@"WhatsApp",@"身份ID",@"個人簡介"];
    self.mutableArray  = [NSMutableArray array];
    
    [self.mutableArray addObjectsFromArray:@[@"",@"男",@"ALinv",@"10394856",@"3232",@"3433",@"没有简介"]];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 7;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString * ID = @"MyCell";
    PresonInTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[PresonInTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    cell.toString =self.array[indexPath.row];
    if (indexPath.row==0) {
        
        cell.image = [[UIImage imageNamed:@"twitteer3"] circleImage];
        
        cell.isImage = YES;
    }else{
    cell.xingString = self.mutableArray[indexPath.row];
    }
    return cell;

    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    // 在手指离开的那一刻进行反选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    if (indexPath.row ==1) {
        GenDerViewController * gen = [GenDerViewController new];
        
        [gen returnbock:^(NSString *sex) {
            [self.mutableArray replaceObjectAtIndex:1 withObject:sex];
            
            [self.tableView reloadData];
            NSLog(@"999%@",sex);
        }];
        [self.navigationController pushViewController:gen animated:YES];
    
    
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
