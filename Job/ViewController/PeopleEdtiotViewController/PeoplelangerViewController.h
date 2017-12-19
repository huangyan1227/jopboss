//
//  PeoplelangerViewController.h
//  Job
//
//  Created by bidiao on 2017/7/19.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^SelectlanguageBlock)(NSString* string);
@interface PeoplelangerViewController : UIViewController
@property(nonatomic) SelectlanguageBlock lagueBlock;

//-(void)languageBalckString:(SelectlanguageBlock)block;
@end
