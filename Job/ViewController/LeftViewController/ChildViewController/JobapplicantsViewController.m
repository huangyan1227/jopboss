//
//  JobapplicantsViewController.m
//  Job
//
//  Created by bidiao on 2017/12/14.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "JobapplicantsViewController.h"
#import "UIView+Extension.h"
@interface JobapplicantsViewController ()


#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
@end

@implementation JobapplicantsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self addView];
    // Do any additional setup after loading the view.
}
-(void)addView{
    
    UIView * creView = [UIView new];
    CGFloat h = self.view.frame.size.height/2;
    CGFloat w = self.view.frame.size.width/2;
    creView.frame = CGRectMake(0, 60, self.view.frame.size.width, h);
    
    [self.view addSubview:creView];
    
    
    UIImageView * imageView = [UIImageView new];
    
    imageView.frame = CGRectMake(10, 20, h/3, h/3);
    
    imageView.layer.cornerRadius = h/6;
    
    imageView.centerX = self.view.centerX;
    
    imageView.backgroundColor = fontColor(135, 94, 166);
    
    [creView addSubview:imageView];
    
    NSArray * titleArray = @[@"用户名稱",@"性  别",@"電  話",@"Whatsapp"];
    
    NSArray * titlenameArray = @[@"May Chan",@"女",@"15656432345",@"15656432345"];
    for (int i=0; i<titleArray.count; i++) {
     
    UILabel * username  = [UILabel new];
    
    username.frame = CGRectMake(30, CGRectGetMaxY(imageView.frame)+20+i*50, w*2/3, 40);
    
    username.font = [UIFont systemFontOfSize:20];
    
    username.textColor = fontColor(135, 94, 166);
    
    username.backgroundColor = [UIColor redColor];
    
    username.text = titleArray[i];
    
    username.textAlignment = NSTextAlignmentCenter;
    
    [creView addSubview:username];
    
    UILabel * username2  = [UILabel new];
    
    username2.frame = CGRectMake(CGRectGetMaxX(username.frame), CGRectGetMaxY(imageView.frame)+20+i*50, w*2/3, 40);
    
    username2.textColor = [UIColor lightGrayColor];
    
    username2.backgroundColor = [UIColor yellowColor];
    
    username2.text = titlenameArray[i];
    
    username2.textAlignment = NSTextAlignmentCenter;
    
    [creView addSubview:username2];
        
        if (i==2 || i==3) {
            
            UIButton * addbutton = [[UIButton alloc]init];
            
            addbutton.backgroundColor = [UIColor blueColor];
            
            addbutton.frame = CGRectMake(CGRectGetMaxX(username2.frame)+10, username2.y, 40, 40);
            
            addbutton.tag = i;
            
            [addbutton addTarget:self action:@selector(clicik:) forControlEvents:UIControlEventTouchUpInside];
            
            [creView addSubview:addbutton];
            
            
        }
    
    UIView * lineview = [UIView new];
    
    lineview.frame = CGRectMake(20, CGRectGetMaxY(username.frame), self.view.width-40, 1);
    
    lineview.backgroundColor = [UIColor lightGrayColor];
    
    [creView addSubview:lineview];
    
    }
    
}
-(void)clicik:(UIButton*)btn{
    
    
    if (btn.tag==2) {
        
        [self tellphone];
    }else{
        
           [self whatsapp];
        
    }
}

//打电话
-(void)tellphone{
    
    NSString * string =@"186xxxx6979";
    NSMutableString *str=[[NSMutableString alloc] initWithFormat:@"tel:%@",string];
    UIWebView *callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self.view addSubview:callWebview];
    
    
}
-(void)whatsapp{
    
    NSString * msg = @"";
    
    NSString * url = [NSString stringWithFormat:@"whatsapp://send?text=%@",[msg stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]]];
    
    NSURL * whatsappURL = [NSURL URLWithString:url];
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"whatsapp://app"]]) {
        [[UIApplication sharedApplication] openURL:whatsappURL options:@{} completionHandler:nil];
    }else {
        UIAlertController * actioncontroller =  [UIAlertController alertControllerWithTitle:@"WhatsApp not installed." message:@"Your device has no WhatsApp installed." preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"WhatsApp not installed." message:@"Your device has no WhatsApp installed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//        [alert show];
        
        UIAlertAction * action = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleCancel handler:nil];
        
        [actioncontroller addAction:action];
        
        [self presentViewController:actioncontroller animated:YES completion:nil];
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
