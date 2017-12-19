//
//  ThereleasedateViewController.h
//  Job
//
//  Created by bidiao on 2017/12/14.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DatelingBlock)(NSString* string,NSArray*datearray);
@interface ThereleasedateViewController : UIViewController
@property(nonatomic,strong) NSString * datestring;

@property(nonatomic) DatelingBlock  dateblock;
@end
