//
//  ThereleasedateViewController.m
//  Job
//
//  Created by bidiao on 2017/12/14.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "ThereleasedateViewController.h"
#import "ChuliangTableViewCell.h"
#import "JopMode.h"
@interface ThereleasedateViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableView;

//@property(nonatomic,strong) NSArray * modeArray;


@property(nonatomic,strong) NSArray * mutableArray;

#define kDocumentPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject
@end

@implementation ThereleasedateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     [self.view addSubview:self.tableView];
   // NSString *dateString = @"2016-12-08";
    
    //self.mutableArray = [NSMutableArray array];
    
    
   
    self.mutableArray = [JopMode getThereleasedateing:self.datestring];
    
    NSLog(@" %@",self.mutableArray);
    
 //   NSLog(@"yesterday %@    tomorrow %@", [formatter stringFromDate:yesterday], [formatter stringFromDate:tomorrow]);
    // Do any additional setup after loading the view.
}
-(UITableView *)tableView {
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
    }
    
    return _tableView;
    
}

#pragma mark =======Delegate=======

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.mutableArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * ID = @"MyCell";
    ChuliangTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ChuliangTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    JopMode* jom = self.mutableArray[indexPath.row];
    
    cell.jopShow = jom;
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JopMode * jom = self.mutableArray[indexPath.row];
    
    if (jom.isSelect) {
        
        jom.isSelect = NO;
        
    }else{
        
        jom.isSelect = YES;
    }
    
    //刷新当前行
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    
    
    
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    NSMutableArray * table = [NSMutableArray array];
    NSMutableString * string = [NSMutableString string];
    for (int i =0; i<self.mutableArray.count ; i++) {
        
        JopMode * jom = self.mutableArray[i];
        
        if (jom.isSelect) {
          //  [NSString stringWithFormat:@"%@ ",jom.titleMeth];
            [string appendString: [NSString stringWithFormat:@"%@ ",jom.titleMeth]];
            [table addObject:jom];
        }
    }
    if (string.length==0) {
        
        return;
    }
    self.dateblock(string,table);
    
    NSLog(@" %@",table);
    
    
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
