//
//  HYLeftView.h
//  Job
//
//  Created by bidiao on 2017/7/12.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HYLeftView;

@protocol HYLeftViewDelegate <NSObject>



-(void)leftMenu:(HYLeftView*)menu didSelectedBUttonFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;

@end

@interface HYLeftView : UIView

@property(nonatomic,weak) id<HYLeftViewDelegate>delegateL;
@end
