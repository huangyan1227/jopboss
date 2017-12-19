//
//  HYWorkdetailsViewController.m
//  Job
//
//  Created by bidiao on 2017/7/13.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "HYWorkdetailsViewController.h"
#import "FMDB.h"
#import "JopMode.h"
@interface HYWorkdetailsViewController ()
@property(nonatomic,strong) UILabel * xiangqinglabel;
@property(nonatomic,strong) UILabel * adressLabel;
@property(nonatomic,strong) UILabel * timeLabel;
@property(nonatomic,strong) UILabel * staretimelabel;
@property(nonatomic,strong) UILabel * stoptimeLabel;
@property(nonatomic,strong) UILabel * togetherTimeLabel;

@property(nonatomic,strong) UILabel * nametitlelabel;
@property(nonatomic,strong) UILabel * namestpeLabel;
@property(nonatomic,strong) UILabel * zongmoneyLabel;


@property(nonatomic,strong) FMDatabase * db;
@end
#define kDocumentPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject
@implementation HYWorkdetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    NSString *filename = [kDocumentPath stringByAppendingString:@"creNO.sqlite"];
    
    self.db =[FMDatabase databaseWithPath:filename];
    
      [self addBuju];
    
      [self addScrollview];
    
      [self selectshuju];
 
    
     }

-(void)addBuju{
    
    
    NSString*  path =   [kDocumentPath stringByAppendingString:@"a"];
    
    NSDictionary * diact =[NSDictionary dictionaryWithContentsOfFile:path];
    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
    NSInteger inteage = [diact[@"name"] integerValue];
    
    if (inteage==3) {
        self.view.backgroundColor =[UIColor yellowColor];
        
        [ self addButtonright];
        
    }else{
        // NSLog(@" rrttt %ld ,%@",(long)inteage, diact[@"name"]);
        [self applyfor];
        
        
    }
    
  
    
}
-(void)addButtonright{
    
   
    
}
-(void)addScrollview{
    
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    
    scrollView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    
    
    

    [self.view addSubview:scrollView];
    
    UIImageView * imageView = [[UIImageView alloc]init];
    
    imageView.image = [UIImage imageNamed:@"pad"];
    
    imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, 120);
    
    [scrollView addSubview:imageView];
    
    imageView.contentMode = UIViewContentModeScaleToFill;
    
    //imageView.backgroundColor = [UIColor redColor];
 
    //滚动大小
  //  scrollView.contentSize = CGSizeMake(0, 1000);
    
    CGFloat w = self.view.frame.size.width/4;
#pragma mark =======時間=======
    
    UILabel * starelabel = [UILabel new];
    
    
    
    starelabel.frame = CGRectMake(10, CGRectGetMaxY(imageView.frame)+10, w, 25);
    
    self.staretimelabel =   starelabel;
    
    starelabel.textAlignment = NSTextAlignmentCenter;
    
    [scrollView addSubview:starelabel];
    
    
    UIView * lineView = [UIView new];
    
    lineView.frame = CGRectMake(starelabel.frame.size.width/2+10, CGRectGetMaxY(starelabel.frame), 2, 20);
    
    [scrollView addSubview:lineView];
    
    lineView.backgroundColor = [UIColor lightGrayColor];
    
    
    UILabel * stoplabel = [UILabel new];
    
   // stoplabel.text = @"15:00";
    
    stoplabel.frame = CGRectMake(10, CGRectGetMaxY(lineView.frame)+10, w, 25);
   
    stoplabel.textAlignment = NSTextAlignmentCenter;
   
    self.stoptimeLabel = stoplabel;
    
    
    [scrollView addSubview:stoplabel];
    
  //UILabel * timelabel = [[UILabel alloc]init];
    
    UILabel * togertimelabel = [UILabel new];
  
    togertimelabel.textAlignment = NSTextAlignmentCenter;
    
    togertimelabel.frame = CGRectMake(10, CGRectGetMaxY(stoplabel.frame)+10, w, 25);
    
    self.togetherTimeLabel = togertimelabel;
    
    togertimelabel.textColor = [UIColor colorWithRed:82/255.0 green:0/255.0 blue:132/255.0 alpha:1];
    
    [scrollView addSubview:togertimelabel];
    
   
    
    
  //名稱
    UILabel * namelable = [UILabel new];
  //  namelable.backgroundColor = [UIColor greenColor];
    
    namelable.frame = CGRectMake(w, CGRectGetMaxY(imageView.frame)+10,60 , 40);
    self.nametitlelabel = namelable;
    
    namelable.font = [UIFont systemFontOfSize:22];
    
    namelable.textColor =[UIColor colorWithRed:82/255.0 green:0/255.0 blue:132/255.0 alpha:1];
    
    [scrollView addSubview:namelable];
#pragma mark =======招聘中=======
    UILabel * statelabel = [UILabel new];
    
    //statelabel.backgroundColor = [UIColor yellowColor];
    
    statelabel.frame = CGRectMake(CGRectGetMaxX(namelable.frame)+10, CGRectGetMaxY(imageView.frame)+20,60 , 30);
    
  
    
    self.namestpeLabel = statelabel;
    
    statelabel.textColor =[UIColor colorWithRed:100/255.0 green:40/255.0 blue:142/255.0 alpha:1];
    
    
    [scrollView addSubview:statelabel];
    
    UILabel * zongMoneny = [UILabel new];
    
   // zongMoneny.backgroundColor = [UIColor blueColor];
    
    zongMoneny.frame = CGRectMake(w, CGRectGetMaxY(namelable.frame),200 , 40);
    
     zongMoneny.font = [UIFont systemFontOfSize:20];
    
   
    
    self.zongmoneyLabel = zongMoneny;
    
   // zongMoneny.textColor = ];
    
    [scrollView addSubview:zongMoneny];
    
   
    
    UILabel * titlelabel  = [[UILabel alloc]init];
    
    titlelabel.frame = CGRectMake(w, CGRectGetMaxY(zongMoneny.frame)+5, w*3, 30);
    
    [scrollView addSubview:titlelabel];
    //
    titlelabel.text = @"工作詳情";
    
    //titlelabel.backgroundColor = [UIColor redColor];
    
    titlelabel.font = [UIFont systemFontOfSize:20];
    
    titlelabel.textColor = [UIColor colorWithRed:115/255.0 green:57/255.0 blue:151/255.0 alpha:1];
    
    UILabel * xiangqinglabel =[[UILabel alloc]init];
    
    xiangqinglabel.frame = CGRectMake(w, CGRectGetMaxY(titlelabel.frame), w*3, 540);
    
    //xiangqinglabel.backgroundColor = [UIColor yellowColor];
    
    self.xiangqinglabel = xiangqinglabel;
    
    xiangqinglabel.textColor = [UIColor colorWithRed:163/255.0 green:163/255.0 blue:168/255.0 alpha:1];
    
    xiangqinglabel.numberOfLines = 0;
    
    xiangqinglabel.textAlignment = NSTextAlignmentLeft;
  
    [scrollView addSubview:xiangqinglabel];
    
    UILabel * adrreslabel = [[UILabel alloc]init];
    
    adrreslabel.frame = CGRectMake(w, CGRectGetMaxY(xiangqinglabel.frame), w*3, 40);
    
    [scrollView addSubview:adrreslabel];
    
    adrreslabel.text = @"工作地址";
    
    adrreslabel.font = [UIFont systemFontOfSize:20];
    
   adrreslabel.textColor = [UIColor colorWithRed:115/255.0 green:57/255.0 blue:151/255.0 alpha:1];
    
    UILabel * adrreslabel1 = [[UILabel alloc]init];
    
    adrreslabel1.frame = CGRectMake(w, CGRectGetMaxY(adrreslabel.frame), w*3, 40);
    
    adrreslabel1.textColor = [UIColor colorWithRed:163/255.0 green:163/255.0 blue:168/255.0 alpha:1];

    
    [scrollView addSubview:adrreslabel1];
     self.adressLabel = adrreslabel1;
    
    UILabel * howlabel = [[UILabel alloc]init];
    
    howlabel.frame = CGRectMake(w, CGRectGetMaxY(adrreslabel1.frame), w*3, 40);
    
    howlabel.text = @"如何運作？";
    
    howlabel.font = [UIFont systemFontOfSize:20];
    
    howlabel.textColor = [UIColor colorWithRed:115/255.0 green:57/255.0 blue:151/255.0 alpha:1];
    
    [scrollView addSubview:howlabel];
    
    UILabel * howlabel1 = [[UILabel alloc]init];
    
    howlabel1.frame = CGRectMake(w, CGRectGetMaxY(howlabel.frame), w*3, 320);

    [scrollView addSubview:howlabel1];
    
    howlabel1.numberOfLines= 0;
    
  howlabel1.textColor = [UIColor colorWithRed:163/255.0 green:163/255.0 blue:168/255.0 alpha:1];
    
    
    howlabel1.text = @"在JOB申請工作之後,你可以做什麼？\n \n 1. 成功提交工作申請。\n \n 2. 僱主馬上收到申請通知。\n \n 3. 若你被僱用/要求面試(在有需要的情況下),僱主會在APP內直接按下\"聘用\"給你打電話。\n \n 4. 被申請之後,請確認接受工作並且準時上工。\n \n 5. 在APP上準時上下班簽到";
    
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, CGRectGetMaxY(howlabel1.frame)+10);
    
}
-(void)selectshuju{
    
    JopMode * job =self.array[0];
    
    self.xiangqinglabel.text = [NSString stringWithFormat:@" 工作日期: %@ \n \n 上班時間:%@ \n \n 下班時間:%@ \n \n 空缺人數:%@(人) \n \n 時薪:HK$%ld \n \n 津貼:HK$%ld \n \n 總數:HK$%@ \n \n 出糧方式:%@ \n \n工作語言:%@ \n \n 年齡要求:%@ \n \n 服裝守则:%@ \n \n 申请文件:%@",job.workdate,job.startTime,job.stopTIme, job.popoleString,job.hourlyWage,job.allowance,   job.moneyString,job.theAmountOf,job.language, job.agef,job.clothing,job.file];
    //
   
    //job.workdate;
    //job.moneyString
    
     self.nametitlelabel.text = @"侍應";
     self.namestpeLabel.text = @"招聘中";
     self.zongmoneyLabel.text =@"HK$490";
    
     //    togertimelabel.text = @"7小时";
    //starelabel.text = @"8:00";
    self.staretimelabel.text =  @"8:00";
    self.stoptimeLabel.text = @"15:00";
    self.togetherTimeLabel.text =@"7小时";
    
  //  self.timeLabel.text = [NSString stringWithFormat:@"%@\n \n%@\n \n%@",job.startTime,job.stopTIme,job.togetherTime] ;
    
    self.adressLabel.text = job.hotel;
    
   // [self.array removeAllObjects];
    
    
    
}
-(void)applyfor{
    
    UIButton * applyfor =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 35, 35)];
    
    [applyfor addTarget:self action:@selector(applyforback) forControlEvents:UIControlEventTouchUpInside];
    
    [applyfor setBackgroundImage:[UIImage imageNamed:@"fabu"] forState:UIControlStateNormal];
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:applyfor];
    
    
    self.navigationItem.rightBarButtonItem =  item;
    
    
}
-(void)applyforback{
   
    UIAlertController * action =[UIAlertController alertControllerWithTitle:@"消息" message:@"发布成功" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * actiona = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
    [action addAction:actiona];
    [self presentViewController:action animated:YES completion:nil];
    
    
    
    NSLog(@"发布");
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
