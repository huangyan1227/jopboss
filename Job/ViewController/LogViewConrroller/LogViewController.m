//
//  LogViewController.m
//  Job
//
//  Created by bidiao on 2017/7/12.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "LogViewController.h"
#import "UIView+Extension.h"
#import "HYShouViewController.h"
#import "ViewController.h"
#import "PersonMainViewController.h"
@interface LogViewController ()<UITextFieldDelegate>
{
    UITextField * textUser;
    UITextField * textPwd;
    UIImageView * imageView;
    UIView      * vlogin;
    
}
@property(nonatomic,strong) UIButton * logButton;

@property(nonatomic,strong) UIButton * rememberButton;

@property(nonatomic,strong) NSString * plistpath;
@end
#define mainSize    [UIScreen mainScreen].bounds.size
#define kDocumentPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject
@implementation LogViewController

-(NSString *)plistpath {
    if (!_plistpath) {
        self.plistpath  = [kDocumentPath stringByAppendingPathComponent:@"test.plist"];
    }
    
    return _plistpath;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addNotionfication];
  
   // self.navigationController.navigationBarHidden = YES;
     [self showloginView];
    self.view.backgroundColor = [UIColor colorWithRed:16/255.0 green:111/255.0 blue:179/255.0 alpha:1];
    // Do any additional setup after loading the view.
}
-(void)addNotionfication{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appenbackgrund) name:UIApplicationDidEnterBackgroundNotification object:[UIApplication sharedApplication]];
    
    
    
}

//写入
-(void)appenbackgrund{
    
    NSString * nameStr = textUser.text;
    
    NSString * pwdStr = textPwd.text;
    
    NSDictionary * dic = @{@"name":nameStr,@"pwd":pwdStr};
    
    [dic writeToFile:self.plistpath atomically:YES];
    
}
-(void)initDataByplist{
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:self.plistpath]) {
        
        NSDictionary * dataDic = [NSDictionary dictionaryWithContentsOfFile:self.plistpath];
        
        self.rememberButton.selected = YES;
        
        textUser.text = [dataDic objectForKey:@"name"];
        
        textPwd.text = [dataDic objectForKey:@"pwd"];
    }
    
    
    
}-(void)showloginView{
    
    UILabel * tilteLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, mainSize.width-100, 70)];
    
    tilteLable.text = @"會 員 登 錄";
    
    //tilteLable.backgroundColor = [UIColor yellowColor];
    
    tilteLable.textAlignment = NSTextAlignmentCenter;
    
    tilteLable.font = [UIFont fontWithName:@"Helvetica-Bold" size:30];
    
    
    
    // tilteLable.centerX = self.view.centerX;
    
    // [self.view addSubview:tilteLable];
    
    // [tilteLable setTextColor:[UIColor blackColor]];
    
    vlogin = [[UIView alloc]initWithFrame:CGRectMake(20, 140, mainSize.width-100,mainSize.height - 180)];
    
    
    
    // [self.view addSubview:view2];
    
    vlogin.centerX = self.view.centerX;
    
    //vlogin.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:vlogin];
    
    
    textUser = [[UITextField alloc]initWithFrame:CGRectMake(0, 10, vlogin.frame.size.width, 44)];
    
    //阴影
    //  CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    //gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:29/255.0 green:129/255.0 blue:72/255.0 alpha:0.91].CGColor, (__bridge id)[UIColor colorWithRed:125/255.0 green:201/255.0 blue:134/255.0 alpha:1].CGColor];
    
    // gradientLayer.locations = @[@0.1, @1.0];
    
    // gradientLayer.startPoint = CGPointMake(0, 0);
    
    // gradientLayer.endPoint = CGPointMake(1.0, 0);
    
    // gradientLayer.frame = CGRectMake(0, 0, textUser.width, textUser.height);
    //gradientLayer.borderWidth = 0.1;
    
    //  gradientLayer.cornerRadius =5;
    
    //  gradientLayer.shadowOffset =CGSizeMake(1, 1);
    //  gradientLayer.shadowColor = [UIColor blackColor].CGColor;
    //  gradientLayer.shadowOpacity = 0.8;
    
    //  [textUser.layer addSublayer:gradientLayer];
    
    [self testfiled:textUser string:@"" placeholder:@"  用户名稱"];
    
    textPwd = [[UITextField alloc]initWithFrame:CGRectMake(0, textUser.y+64, textUser.size.width, 44)];
    
    textPwd.secureTextEntry = YES;
    
    [self testfiled:textPwd string:@"" placeholder:@"  密碼"];
    
    
    
    self.rememberButton = [[UIButton alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(textPwd.frame)+10, 30, 30)];
    
    [self.rememberButton addTarget:self action:@selector(reBerButton:) forControlEvents:UIControlEventTouchUpInside];
    
#warning 点击的背景图片;
    
    [self.rememberButton setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    
    [self.rememberButton setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
    
    self.rememberButton.adjustsImageWhenHighlighted = NO;
    
    
    [vlogin addSubview:self.rememberButton];
    
    self.rememberButton.backgroundColor = [UIColor redColor];
    
    
    UILabel * rlabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rememberButton.frame)+10, CGRectGetMaxY(textPwd.frame)+7, textPwd.width/2, 40)];
    
    rlabel.text = @" 記住我的密碼";
    
    
    [rlabel setTextColor:[UIColor whiteColor]];
    
    // [rlabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:21]];
    
    //rlabel.backgroundColor = [UIColor yellowColor];
    [vlogin addSubview:rlabel];
    
    self.logButton = [[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.rememberButton.frame)+10, textPwd.size.width, 44)];
    
    [self.logButton addTarget:self action:@selector(logClickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.logButton.backgroundColor = [UIColor whiteColor];
    
    [self.logButton setTitle:@"登 入" forState:UIControlStateNormal];
    
    [self.logButton setTitleColor:[UIColor colorWithRed:0/255.0 green:100/255.0 blue:179/255.0 alpha:1] forState:UIControlStateNormal];
    
    //  [self.logButton.layer addSublayer:gradientLayer];
    
    
    self.logButton.titleLabel.font =[UIFont fontWithName:@"Helvetica-Bold" size:21];
    
    [vlogin addSubview:self.logButton];
    
    
    
    UIButton * leavebutton = [[UIButton alloc]initWithFrame:CGRectMake(vlogin.width/2-65, CGRectGetMaxY(self.logButton.frame)+30, 44, 44)];
    
    
    
    [vlogin addSubview:leavebutton];
    
    [leavebutton setTitle:@"離開" forState:UIControlStateNormal];
    
    [leavebutton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [leavebutton addTarget:self action:@selector(leave) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * registered = [[UIButton alloc]initWithFrame:CGRectMake(vlogin.width/2+21, leavebutton.y, 44, 44)];
    
    [registered setTitle:@"註冊" forState:UIControlStateNormal];
    
    [registered setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    
    [vlogin addSubview:registered];
    
    
}
-(void)leave{
    
    NSLog(@"离开");
    [self dismissViewControllerAnimated:YES completion:nil];
    // [self presentViewController:[ViewController new] animated:YES completion:nil];
    [self.navigationController popViewControllerAnimated: YES];
}

-(void)logClickButton:(UIButton*)btn{
    NSLog(@"gg");
    
    UINavigationController * na = [[UINavigationController alloc]initWithRootViewController:[PersonMainViewController new]
                                   ];
    
    // [self.navigationController pushViewController:[PersonMainViewController new] animated:YES];
    [self presentViewController:[PersonMainViewController new] animated:YES completion:nil];
    //[self dismissViewControllerAnimated:YES completion:nil];
    // [self jump];
}

//跳转
-(void)jump{
    
    
    
#warning 跳转
    
    
}
-(void)enterAsiin:(NSString*)title messag:(NSString*)messg{
    
    UIAlertController * aler = [UIAlertController alertControllerWithTitle:title message:messg preferredStyle:UIAlertControllerStyleAlert];
    
    [self presentViewController:aler animated:YES completion:nil];
    
    UIAlertAction * acation = [UIAlertAction actionWithTitle:@"確定" style:UIAlertActionStyleDefault handler:nil];
    
    [aler addAction:acation];
    
}

//记着密码
-(void)reBerButton:(UIButton*)btn{
    
    btn.selected = !btn.selected;
    NSLog(@"fggddd");
    
    
}
//移除密码
-(void)reomveFile{
    
    
    NSFileManager * filer = [NSFileManager defaultManager];
    
    if ([filer fileExistsAtPath:self.plistpath]){
        
        self.rememberButton.selected = NO;
        
        [filer removeItemAtPath:self.plistpath error:nil];
        
    }
    
    
    
}
-(void)testfiled:(UITextField *)textfiled string:(NSString *)text placeholder:(NSString *)placeholdertext{
    
    textfiled.delegate = self;
    
    [textfiled setTextColor:[UIColor whiteColor]];
    
    //textfiled.backgroundColor = [UIColor whiteColor];
    
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    NSAttributedString *attribute = [[NSAttributedString alloc] initWithString:placeholdertext attributes:dict];
    [textfiled setAttributedPlaceholder:attribute];
    
    
    // textfiled.backgroundColor = [UIColor redColor];
    
    //textfiled.placeholder = placeholdertext;
    
    
    
    textfiled.clearButtonMode =UITextFieldViewModeWhileEditing;
    
    textfiled.leftViewMode = UITextFieldViewModeAlways;
    
    UIImageView * imageView = [[UIImageView alloc]init];
    
    imageView.backgroundColor = [UIColor yellowColor];
    
    
    imageView.frame =CGRectMake(0, 0, 44, 44);
    
    textfiled.leftView =imageView;
    
    // textfiled.layer.shadowOffset = CGSizeMake(1, 1);
    
    //textfiled.layer.shadowColor = [UIColor blackColor].CGColor;
    
    //textfiled.layer.shadowOpacity = 0.8;
    
    [vlogin addSubview:textfiled];
    
    UIView * lineView = [UIView new];
    
    lineView.frame = CGRectMake(textfiled.x, CGRectGetMaxY(textfiled.frame)+2, textfiled.width, 1);
    
    lineView.backgroundColor = [UIColor whiteColor];
    
    [vlogin addSubview:lineView];
    
    //阴影
    //    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    //    gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:29/255.0 green:129/255.0 blue:72/255.0 alpha:1].CGColor, (__bridge id)[UIColor colorWithRed:125/255.0 green:201/255.0 blue:134/255.0 alpha:1].CGColor];
    //
    //    gradientLayer.locations = @[@0.1, @1.0];
    //
    //    gradientLayer.startPoint = CGPointMake(0, 0);
    //
    //    gradientLayer.endPoint = CGPointMake(1.0, 0);
    //
    //    gradientLayer.frame = CGRectMake(0, 0, textfiled.width,textfiled.height);
    //
    //    gradientLayer.cornerRadius =5;
    //
    //    gradientLayer.shadowOffset =CGSizeMake(1, 1);
    //    gradientLayer.shadowColor = [UIColor blackColor].CGColor;
    //    gradientLayer.shadowOpacity = 0.8;
    
    //[textfiled.layer addSublayer:gradientLayer];
    
}

-(void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textUser resignFirstResponder];
    
    [textPwd resignFirstResponder];
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
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
