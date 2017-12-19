//
//  HotleViewViewController.m
//  Job
//
//  Created by bidiao on 2017/7/27.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "HotleViewViewController.h"
#import "JopMode.h"
#import "PickerViewCell.h"

@interface HotleViewViewController ()<UITableViewDelegate,UITableViewDataSource>{
    int _selectCell;
}

@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) NSArray * modeArray;
@end
#define kDocumentPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject



@implementation HotleViewViewController


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
    
     _selectCell = -1 ;
    [self.view addSubview:self.tableView];
    
    NSString* path =[ kDocumentPath stringByAppendingPathComponent:@"th.plist"];
    // NSString* path1 =[ kDocumentPath stringByAppendingPathComponent:@"th.plist"];
    
    NSDictionary * dict =[NSDictionary dictionaryWithContentsOfFile:path];
   // NSDictionary * dict1 =[NSDictionary dictionaryWithContentsOfFile:path1];

    
    NSInteger inteage = [dict[@"n"] integerValue];
    
    
    NSLog(@"gttffgggggggeeetttg %@ " ,self.titleString);
    if (inteage==104) {
        
        self.modeArray =[JopMode getHolte];
        
        
        
    }else if (inteage==101){
        
        NSArray * arrar =[JopMode shujuArray];
     
        for (int i=0;i<arrar.count ;i++) {
            
            NSDictionary *  dicta = arrar[i];
         
            NSArray *key = [dicta allKeys];
            
           
            
            for (NSString* aket in key) {
                
                if ([aket isEqualToString:self.titleString]) {
                
                    self.modeArray =[JopMode gerestArray:dicta[self.titleString]];
                 

                }
                
            }
            
            
        }
        
    }
    
    
    
}
#pragma mark =======Delegate=======

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.modeArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * ID = @"MyCell";
    PickerViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[PickerViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    JopMode* jom = self.modeArray[indexPath.row];
    
     indexPath.row == _selectCell ? (cell.accessoryType =UITableViewCellAccessoryCheckmark) : (cell.accessoryType =UITableViewCellAccessoryNone );
    
    cell.lb_title.text = jom.titleMeth;
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JopMode * jom = self.modeArray[indexPath.row];
    
    _selectCell = (int)indexPath.row ;
    PickerViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType =UITableViewCellAccessoryCheckmark ;

    
     self.hotelblock(jom.titleMeth);
    
  //  if (jom.isSelect) {
        
    //    jom.isSelect = NO;
        
 //   }else{
        
      ///  jom.isSelect = YES;
  //  }
    
    //刷新当前行
    //[self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    //NSLog(@"ddddgg");
    [self.navigationController popViewControllerAnimated:YES];
    
    
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType =UITableViewCellAccessoryNone ;
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
   // NSMutableString * string = [NSMutableString string];
   // for (int i =0; i<self.modeArray.count ; i++) {
        
       // JopMode * jom = self.modeArray[i];
        
     //   if (jom.isSelect) {
            
          //  [string appendString:jom.titleMeth];
     //   }
  //  }
  //  if (string.length==0) {
     //
        //return;
   // }
   
    
   // NSLog(@" %ld",string.length);
    
    
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
