//
//  ChangepasswordViewController.m
//  Job
//
//  Created by bidiao on 2017/12/12.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "ChangepasswordViewController.h"

@interface ChangepasswordViewController ()<UITextFieldDelegate>

@end
#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
@implementation ChangepasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"更改密碼";
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     
     
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    
    // Do any additional setup after loading the view.
    [self addViewtitle];
}
-(void)addViewtitle{
    
    
    NSArray * titleArray =@[@"現有密碼",@"新密碼",@"再輸入密碼",];
    
    for (int i = 0; i<titleArray.count; i++) {
     
    
    
    UILabel * oldPassword = [UILabel new];
    
    oldPassword.text = titleArray[i];
    
    oldPassword.textColor = fontColor(98, 51, 143);
    
    oldPassword.textAlignment = NSTextAlignmentRight;
    
    [self.view addSubview:oldPassword];
    
    oldPassword.frame = CGRectMake(self.view.frame.size.width/2-160, 140+i*45, 120, 40);
    
    
    UITextField * oldPasswordtext = [[UITextField alloc]init];
    
    oldPasswordtext.frame = CGRectMake(CGRectGetMaxX(oldPassword.frame)+10, 140+i*45, self.view.frame.size.width/2-20, 40);
    
    [oldPasswordtext addTarget:self action:@selector(textFieldEditing:) forControlEvents:UIControlEventEditingChanged];
   
        oldPasswordtext.secureTextEntry = YES;
        
        oldPasswordtext.placeholder = titleArray[i];
    
        oldPasswordtext.tag = 10+i;
  
    
    [self.view addSubview:oldPasswordtext];
    
    UIView * oldView = [[UIView alloc]init];
    
    oldView.backgroundColor = [UIColor lightGrayColor];
    
    oldView.frame = CGRectMake(self.view.frame.size.width/2-150,182+i*44 , self.view.frame.size.width-120, 1);
    
    [self.view addSubview:oldView];
    
        
    }
    
    UIButton * tijiao = [[UIButton alloc]init];
    
    [tijiao addTarget: self action:@selector(tijiao) forControlEvents:UIControlEventTouchUpOutside];
    
    [tijiao setTitle:@"遞交" forState:UIControlStateNormal];
    
     tijiao.frame = CGRectMake(self.view.frame.size.width/2-150,182+4*44 , self.view.frame.size.width-120, 40);
    
    [self.view addSubview:tijiao];
    
//[tijiao setTitleColor:fontColor(135, 94, 166) forState:UIControlStateNormal];
    [tijiao setBackgroundColor:fontColor(135, 94, 166)];
    
    
}
-(void)tijiao{
    
    NSLog(@"提交");
}
-(void)textFieldEditing:(UITextField *)textField{
    
    
    NSLog(@"%@",textField.text);
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
