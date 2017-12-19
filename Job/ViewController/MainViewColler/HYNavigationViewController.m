//
//  HYNavigationViewController.m
//  Job
//
//  Created by bidiao on 2017/7/12.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "HYNavigationViewController.h"
#import "UIImage+Extension.h"
@interface HYNavigationViewController ()

@end

@implementation HYNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.translucent = YES;
    [self.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:170/255.0 green:90/255.0 blue:251/255.0 alpha:1]] forBarMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
