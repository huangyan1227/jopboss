//
//  LanguageViewController.m
//  Job
//
//  Created by bidiao on 2017/7/12.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "LanguageViewController.h"

@interface LanguageViewController ()
@property(nonatomic,strong) UIButton * englishButton;
@property(nonatomic,strong) UIButton * traditionalButton;
@end

@implementation LanguageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
   
    // self.navigationController.title = @"语言";
    //self.title = @"语言";
    UILabel * lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 44, 64)];
    lable.text =@"語 言";
    
    [lable setTextColor:[UIColor whiteColor]];
    
    self.navigationItem.titleView =lable;
    [self addbutton];
    // Do any additional setup after loading the view.
}
-(void)addbutton{
    
    
    
     UIButton * eb = [[UIButton alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 44)];
    
    [self addbuton:@selector(ebclik:) title:@"英文" ub:eb];
       [self.view addSubview:eb];
    
    self.englishButton = eb;
    
    UIButton * traditionalbutton = [[UIButton alloc]initWithFrame:CGRectMake(0, 108, self.view.frame.size.width, 44)];
    
    [self addbuton:@selector(traditional:) title:@"繁體" ub:traditionalbutton];
    
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
    
    if (btn.selected) {
        
        self.traditionalButton.selected = NO;
    }
    
    
    
}
-(void)traditional:(UIButton*)bu{
    
    bu.selected = !bu.selected;
    
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
