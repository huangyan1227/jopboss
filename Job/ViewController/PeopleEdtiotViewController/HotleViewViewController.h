//
//  HotleViewViewController.h
//  Job
//
//  Created by bidiao on 2017/7/27.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^HotleBlock)(NSString*string);


@interface HotleViewViewController : UIViewController
@property(nonatomic) HotleBlock  hotelblock;
@property(nonatomic,strong) NSString * titleString;
@end
