//
//  GenDerViewController.h
//  Job
//
//  Created by bidiao on 2017/7/14.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectedBlock)(NSString*sex);

@interface GenDerViewController : UIViewController

@property(nonatomic,copy) SelectedBlock selectBlock;

-(void)returnbock:(SelectedBlock)block;
@end
