//
//  HYLeftView.m
//  Job
//
//  Created by bidiao on 2017/7/12.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "HYLeftView.h"
#import "HYLeftButton.h"
#import "UIView+Extension.h"
#import "UIImage+Extension.h"

#define HYColorRGB(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

@interface HYLeftView()
@property(nonatomic,weak) HYLeftButton * selectedButton;
@end
@implementation HYLeftView

-(id)initWithFrame:(CGRect)frame{
    
    self =[super initWithFrame:frame];
    if (self) {
        self.backgroundColor =[UIColor whiteColor];
         CGFloat alpha = 0.2;
        
         [self setupBtnWithIcon:@"sidebar_nav_news" title:@"" bgColor:HYColorRGB(202, 68, 73, alpha)];
        
        
        [self setupBtnWithIcon:@"sidebar_nav_news" title:@"我的發布" bgColor:HYColorRGB(202, 68, 73, alpha)];
        
        [self setupBtnWithIcon:@"sidebar_nav_reading"title:@"語    言" bgColor:HYColorRGB(76, 132, 190, alpha)];
        
        [self setupBtnWithIcon:@"sidebar_nav_reading"title:@"使用說明" bgColor:HYColorRGB(76, 132, 190, alpha)];
        
        [self setupBtnWithIcon:@"sidebar_nav_reading"title:@"更改密碼" bgColor:HYColorRGB(76, 132, 190, alpha)];
        
        [self setupBtnWithIcon:@"sidebar_nav_photo" title:@"退出" bgColor:HYColorRGB(190, 62, 119, alpha)];
      
    }
    
    
    return self;
    
    
}

-(HYLeftButton*)setupBtnWithIcon:(NSString *)icon title:(NSString *)title bgColor:(UIColor*)bgColor{
    
    
    HYLeftButton *btn =[[HYLeftButton alloc]init];
    btn.tag = self.subviews.count;
   
    
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
   
    if (btn.tag ==0) {
       // btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [btn setImage:[UIImage imageNamed:@"title2" ]forState:UIControlStateNormal ];
    
       // btn.backgroundColor = HYColorRGB(135, 94, 166, 1);
       // btn.layer.cornerRadius = 80;
       // btn.layer.masksToBounds =YES;
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 20, 10)];
        // 设置间距
      //  [btn setBackgroundImage:[[UIImage imageNamed:@"twitteer3" ]circleImage ] forState:UIControlStateNormal];
      ///  btn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        

    }else{
    //设置文字
   // [btn setImage:[UIImage imageNamed: icon  ]forState:UIControlStateNormal ];
            }
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:20];
        
        // 设置按钮选中的背景
        ////[btn setBackgroundImage:[UIImage imageWithColor:bgColor] forState:UIControlStateSelected];
        
        // 设置高亮的时候不要让图标变色
        btn.adjustsImageWhenHighlighted = NO;
        
        // 设置按钮的内容左对齐
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
       
        // 设置间距
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
        

   
    
        
  //  }
    return btn;
    
    
}
-(void)setDelegateL:(id<HYLeftViewDelegate>)delegateL{
    
    _delegateL = delegateL;
    [self buttonClick:[self.subviews firstObject]];
    
}
-(void)layoutSubviews{
    
    NSUInteger btnCount =self.subviews.count;
    CGFloat btnW =self.width;
    CGFloat btnH = (self.height -100)/ btnCount;
    for (int i = 0; i<btnCount; i++) {
        if (i==0) {
            HYLeftButton *btn =self.subviews[i];
            btn.width = btnW;
            btn.height = btnH+100;
          //  btn.y =i*btnH;
          // [ btn setBackgroundImage:[UIImage imageNamed:@"twitteer3"] forState:UIControlStateNormal];
            
        }else{
        HYLeftButton *btn =self.subviews[i];
        btn.width = btnW;
        btn.height = btnH;
        btn.y =i*(btnH)+100;
        }
    }
    
}
-(void)buttonClick:(HYLeftButton *)button{
    
    if ( [self.delegateL respondsToSelector:@selector(leftMenu:didSelectedBUttonFromIndex:toIndex:)]) {
       
        [self.delegateL leftMenu:self didSelectedBUttonFromIndex:(int)self.selectedButton.tag toIndex:button.tag];
    }
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton =button;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
