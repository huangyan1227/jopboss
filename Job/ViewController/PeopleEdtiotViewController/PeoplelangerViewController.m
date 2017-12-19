//
//  PeoplelangerViewController.m
//  Job
//
//  Created by bidiao on 2017/7/19.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "PeoplelangerViewController.h"

@interface PeoplelangerViewController ()
@property(nonatomic,strong) UIButton * englishButton;
@property(nonatomic,strong) UIButton * traditionalButton;
@property(nonatomic,strong) UIButton * butongHuaButton;

@property(nonatomic,strong) NSString * engString;

@property(nonatomic,strong) NSString * tradString;

@property(nonatomic,strong) NSString * buttonString;


@end

@implementation PeoplelangerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    
    [self addbutton];
    // Do any additional setup after loading the view.
}
-(void)addbutton{
    
    
    
    UIButton * eb = [[UIButton alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 44)];
    
    [self addbuton:@selector(ebclik:) title:@"英文" ub:eb];
    [self.view addSubview:eb];
    
    self.englishButton = eb;
    
    UIButton * traditionalbutton = [[UIButton alloc]initWithFrame:CGRectMake(0, 108, self.view.frame.size.width, 44)];
    
    [self addbuton:@selector(traditional:) title:@"廣東話" ub:traditionalbutton];
    
    self.traditionalButton = traditionalbutton;
    
    [self.view addSubview:traditionalbutton];
    
    
    UIButton * bu =[[ UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(traditionalbutton.frame), self.view.frame.size.width, 44)];
    
    self.butongHuaButton = bu;
    
    [self.view addSubview:bu];
    
    [self addbuton: @selector(buclick:)  title:@"普通话" ub:bu];
    
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
    
    if ( btn.selected) {
        
       // self.engString = @"英文";
    }else{
        
      //  self.engString = nil;

    }

    
    
}
-(void)traditional:(UIButton*)bu{
    
    bu.selected = !bu.selected;
    
    
    if ( bu.selected) {
       
      //  self.tradString = @"廣東話";
    }else{
        
       // self.tradString = nil;

    }
    
    
}

-(void)buclick:(UIButton*)buton{
    
    buton.selected = !buton.selected;
    
    if (buton.selected) {
        
       // self.tradString = @"廣東話";
        NSLog(@"buton");
    }else{
        
       // self.buttonString = nil;
        
//        if (self.buttonString==nil) {
//            
//            NSLog(@"ffffffff%@333",self.buttonString);
//            
//        }

    }
    
    
    
    
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
 // NSString * sting =[NSString stringWithFormat:@" %@  %@ %@",self.tradString,self.engString,self.buttonString];
    
   //   NSString * sting =[NSString ];
   NSMutableString * s = [NSMutableString string];
    
   
//    
//    [s appendString:self.tradString];
//    
//    [s appendString:self.engString];
//    
//    [s appendString:self.buttonString];
    
    if ( self.englishButton.selected) {
        
        self.engString = @"英文 ";
        [s appendString:self.engString];
        
    } if (self.traditionalButton.selected){
         self.tradString = @"廣東話 ";
        [s appendString:self.tradString];
        
    }if (self.butongHuaButton.selected){
        
        
        self.buttonString = @"普通话 ";
        [s appendString:self.buttonString];
        
    }
    

    if (s.length==0) {
        return;
    }
    
   self.lagueBlock(s);
    
    
  
 
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
