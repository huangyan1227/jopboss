//
//  GenDerViewController.m
//  Job
//
//  Created by bidiao on 2017/7/14.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "GenDerViewController.h"

@interface GenDerViewController ()
@property(nonatomic,strong) UIButton * traditionalButton;
@property(nonatomic,strong) UIButton * englishButton;
@end

@implementation GenDerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel * lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 44, 64)];
    lable.text =@"性别";
    
    self.navigationController.navigationBar.translucent = NO;
    NSLog(@"性别");
    //self.navigationItem.hidesBackButton = YES;
    
    [lable setTextColor:[UIColor whiteColor]];
    
    self.navigationItem.titleView =lable;
    [self addbutton];

    // Do any additional setup after loading the view.
}
-(void)addbutton{
    
    
    
    UIButton * eb = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    
    [self addbuton:@selector(ebclik:) title:@"男" ub:eb];
    [self.view addSubview:eb];
    
    self.englishButton = eb;
    
    
    
    UIButton * traditionalbutton = [[UIButton alloc]initWithFrame:CGRectMake(0, 45, self.view.frame.size.width, 44)];
    
    [self addbuton:@selector(traditional:) title:@"女" ub:traditionalbutton];
    
    self.traditionalButton = traditionalbutton;
    
    [self.view addSubview:traditionalbutton];
    
}
-(void)addbuton:(SEL)selector title:(NSString*)title ub:(UIButton*)eb{
    
    
    [eb setTitle:title forState:UIControlStateNormal];
    
    [eb addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    
    [eb setImage:[UIImage imageNamed:@"d"] forState:UIControlStateSelected];
    eb.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    eb.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 20);
    
    eb.imageEdgeInsets = UIEdgeInsetsMake(0,self.view.frame.size.width-40, 0, 0);
    
    [eb setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    
    
}
-(void)ebclik:(UIButton*)btn{
    
    btn.selected = !btn.selected;
    
    if (self.selectBlock != nil) {
        self.selectBlock(@"男");
    }
    
    if (btn.selected) {
        
        self.traditionalButton.selected = NO;
    }
    
    
    
}
-(void)returnbock:(SelectedBlock)block{
    
    
    self.selectBlock = block;
    
    
}
-(void)traditional:(UIButton*)bu{
    
    bu.selected = !bu.selected;
    if (self.selectBlock != nil) {
        self.selectBlock(@"女");
    }
    if (bu.selected) {
        
        self.englishButton.selected = NO;
        
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
