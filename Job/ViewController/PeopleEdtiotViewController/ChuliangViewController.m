//
//  ChuliangViewController.m
//  Job
//
//  Created by bidiao on 2017/7/20.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "ChuliangViewController.h"
#import "ChuliangTableViewCell.h"
#import "JopMode.h"
@interface ChuliangViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) NSArray * modeArray;
@end
#define kDocumentPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject

@implementation ChuliangViewController

-(UITableView *)tableView {
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
    }
    
    return _tableView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    NSString* path =[ kDocumentPath stringByAppendingPathComponent:@"apath.plist"];
    
    NSDictionary * dict =[NSDictionary dictionaryWithContentsOfFile:path];
    
    NSInteger inteage = [dict[@"n"] integerValue];
    
    
    if (inteage==111) {
        
     self.modeArray =[JopMode getHolte];
        
        
        
    }

    
    if (inteage == 113) {
        
        self.modeArray = [JopMode getWenjian];
        
    }else if (inteage ==109){
    //出量
    self.modeArray = [JopMode getModeMeth];
        
    }else if (inteage==112){
        //服装
        self.modeArray = [JopMode getclothing];
        
    }else if (inteage==111){
        //年龄
        self.modeArray = [JopMode getAgeshuju];
    }
//    }else if (inteage==118){
//
//        self.modeArray = [JopMode getSex];
//
//    }
    
}
#pragma mark =======Delegate=======

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.modeArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * ID = @"MyCell";
    ChuliangTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ChuliangTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
   JopMode* jom = self.modeArray[indexPath.row];
    
    cell.jopShow = jom;
     
    return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
   JopMode * jom = self.modeArray[indexPath.row];
    
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
    
    NSMutableString * string = [NSMutableString string];
    for (int i =0; i<self.modeArray.count ; i++) {
        
        JopMode * jom = self.modeArray[i];
        
        if (jom.isSelect) {
            
            [string appendString:jom.titleMeth];
        }
    }
    if (string.length==0) {
        
        return;
    }
    self.chulblock(string);

    NSLog(@" %ld",string.length);
    
   
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
