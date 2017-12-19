//
//  InstructionsViewController.m
//  Job
//
//  Created by bidiao on 2017/12/12.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "InstructionsViewController.h"

@interface InstructionsViewController ()

@end
#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
@implementation InstructionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"使用說明";
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     
     
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    
    
    
    [self addView];
    // Do any additional setup after loading the view.
}
-(void)addView{
    
    
    UILabel * lable = [[UILabel alloc]init];
    
    lable.frame = CGRectMake(20, 90, self.view.frame.size.width-30, 40);
    
    lable.text = @"在JobHire申請工作後 · 你可以做什麼？";
    
    lable.textColor = fontColor(95, 33, 138);
    
    lable.font = [UIFont systemFontOfSize:21];
    
    [self.view addSubview:lable];
    
    UILabel * textLabe = [UILabel new];
    
     textLabe.numberOfLines = 0;
    
    
    textLabe.text = @"1.成功提交工作申請\n\n2.僱主馬上收到申請通知\n\n3.若你被僱用/要求面試(在有需要的情況下)·僱主會在APP內直接按下“聘用”/打電話聯絡你。\n\n4.被聘請後·請確應接受工作·並請準時上工。\n\n5.在APP上·請確應上·下班的簽到。";
    
    CGSize maxSize = CGSizeMake(self.view.frame.size.width-40, MAXFLOAT);
    
    CGSize size = [textLabe sizeThatFits:maxSize];
    
    
    textLabe.frame = CGRectMake(20, CGRectGetMaxY(lable.frame)+10, size.width, size.height);
    
   
    
    textLabe.textColor = fontColor(118, 118, 118);;
    
    
    [self.view addSubview:textLabe];
    
    
    
  //  textLabe.frame = CGRectMake(20, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    
    
    
    
    
    
    
    
    
    
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
