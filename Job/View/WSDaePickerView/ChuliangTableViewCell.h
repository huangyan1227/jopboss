//
//  ChuliangTableViewCell.h
//  Job
//
//  Created by bidiao on 2017/7/20.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JopMode.h"
#import "ChuliangMode.h"
@interface ChuliangTableViewCell : UITableViewCell
@property(nonatomic,strong) NSString * lableString;
@property(nonatomic) BOOL isShow;

@property(nonatomic,strong) JopMode * jopShow;
@end
