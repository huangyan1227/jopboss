//
//  EditorpeoopleTableViewCell.h
//  Job
//
//  Created by bidiao on 2017/7/19.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditorpeoopleTableViewCell : UITableViewCell
@property(nonatomic,strong) NSString * labeTitleString;
@property(nonatomic) BOOL istext;
@property(nonatomic) BOOL islabel;
@property(nonatomic,strong) NSString * dateString;
@property(nonatomic,assign) NSInteger tagInteger;
@property(nonatomic,strong) UITextField * textFile;
@property(nonatomic,strong) UIButton * button;
@property(nonatomic) BOOL isbutton;
@property(nonatomic) BOOL isDetails;;

@property(nonatomic,strong) UITextView * textView;
@end
