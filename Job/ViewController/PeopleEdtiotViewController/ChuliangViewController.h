//
//  ChuliangViewController.h
//  Job
//
//  Created by bidiao on 2017/7/20.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ChulingBlock)(NSString* string);
@interface ChuliangViewController : UIViewController

@property(nonatomic) ChulingBlock  chulblock;


//-(void)chlblock:(ChulingBlock*)chlock;



@end
