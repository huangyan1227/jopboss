//
//  MyJobTableViewCell.h
//  Job
//
//  Created by bidiao on 2017/7/14.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^buttonClick)(int tage);

@interface MyJobTableViewCell : UITableViewCell
@property(nonatomic,strong) NSString * titleString;
@property(nonatomic,strong) NSString * dateString;
@property(nonatomic,strong) NSString * progressString;

@property(nonatomic,strong) UIButton * intbutton;
@end
