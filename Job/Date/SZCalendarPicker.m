//
//  SZCalendarPicker.m
//  SZCalendarPicker
//
//  Created by Stephen Zhuang on 14/12/1.
//  Copyright (c) 2014年 Stephen Zhuang. All rights reserved.
//

#import "SZCalendarPicker.h"
#import "SZCalendarCell.h"
#import "UIColor+ZXLazy.h"
#import "UIImage+Extension.h"
#import "FMDB.h"

#define kDocumentPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject

#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

NSString *const SZCalendarCellIdentifier = @"cell";

@interface SZCalendarPicker ()
@property (nonatomic , weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic , weak) IBOutlet UILabel *monthLabel;
@property (nonatomic , weak) IBOutlet UIButton *previousButton;
@property (nonatomic , weak) IBOutlet UIButton *nextButton;
@property (nonatomic , strong) NSArray *weekDayArray;
@property (nonatomic , strong) UIView *mask;
@property(nonatomic,strong) FMDatabase * db;
@property(nonatomic,strong) NSMutableArray * dateMutableArray;
@end

@implementation SZCalendarPicker


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self addTap];
    [self addSwipe];
    [self show];
    
    self.collectionViewa = _collectionView;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [_collectionView registerClass:[SZCalendarCell class] forCellWithReuseIdentifier:SZCalendarCellIdentifier];
     _weekDayArray = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
}

- (void)customInterface
{
    CGFloat itemWidth = _collectionView.frame.size.width / 7;
    CGFloat itemHeight = _collectionView.frame.size.height / 7;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.itemSize = CGSizeMake(itemWidth, itemHeight);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    [_collectionView setCollectionViewLayout:layout animated:YES];
    
    
}

- (void)setDate:(NSDate *)date
{
    _date = date;
    [_monthLabel setText:[NSString stringWithFormat:@"%ld月 %li",(long)[self month:date],(long)[self year:date]]];
    _monthLabel.textColor = fontColor(90, 12, 136);
    [_collectionView reloadData];
}

#pragma mark - date

- (NSInteger)day:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components day];
}


- (NSInteger)month:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components month];
}

- (NSInteger)year:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components year];
}


- (NSInteger)firstWeekdayInThisMonth:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar setFirstWeekday:1];//1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
    NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    [comp setDay:1];
    NSDate *firstDayOfMonthDate = [calendar dateFromComponents:comp];
    
    NSUInteger firstWeekday = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayOfMonthDate];
    return firstWeekday - 1;
}

- (NSInteger)totaldaysInThisMonth:(NSDate *)date{
    NSRange totaldaysInMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return totaldaysInMonth.length;
}

- (NSInteger)totaldaysInMonth:(NSDate *)date{
    NSRange daysInLastMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return daysInLastMonth.length;
}

- (NSDate *)lastMonth:(NSDate *)date{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = -1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}

- (NSDate*)nextMonth:(NSDate *)date{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = +1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}

#pragma -mark collectionView delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return _weekDayArray.count;
    } else {
        return 42;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SZCalendarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SZCalendarCellIdentifier forIndexPath:indexPath];
    
    
    if (indexPath.section == 0) {
        [cell.dateLabel setText:_weekDayArray[indexPath.row]];
      //  [cell.dateLabel setTextColor:[UIColor colorWithHexString:@"#15cc9c"]];
        cell.dateLabel.textColor = fontColor(90, 12, 136);
        cell.dateLabel.backgroundColor  =[UIColor clearColor];
        cell.imagView.image = [UIImage imageNamed:@""];
    } else {
        NSInteger daysInThisMonth = [self totaldaysInMonth:_date];
        NSInteger firstWeekday = [self firstWeekdayInThisMonth:_date];
        
        NSInteger day = 0;
        NSInteger i = indexPath.row;
         cell.dateLabel.textColor = fontColor(90, 12, 136);
        
        if (i < firstWeekday) {
            [cell.dateLabel setText:@""];
            
        }else if (i > firstWeekday + daysInThisMonth - 1){
            [cell.dateLabel setText:@""];
        }else{
            day = i - firstWeekday + 1;
            [cell.dateLabel setText:[NSString stringWithFormat:@"%li",(long)day]];
         //   [cell.dateLabel setTextColor:[UIColor colorWithHexString:@"#6f6f6f"]];
            
            //this month
            if ([_today isEqualToDate:_date]) {
                if (day == [self day:_date]) {
                   // [cell.dateLabel setTextColor:[UIColor colorWithHexString:@"#4898eb"]];
                } else if (day > [self day:_date]) {
                  //  [cell.dateLabel setTextColor:[UIColor colorWithHexString:@"#cbcbcb"]];
                }
            } else if ([_today compare:_date] == NSOrderedAscending) {
               // [cell.dateLabel setTextColor:[UIColor colorWithHexString:@"#cbcbcb"]];
            }
        }
        
        
        [self selectshuj];
     
        NSString * dt = [NSString stringWithFormat:@"%ld-%ld-%ld",[self year:_date],[self month:_date],day];

      
        
        BOOL isbool = [self.dateMutableArray containsObject:dt];
        if (!isbool) {

            cell.dateLabel.layer.masksToBounds = NO;
            
            cell.imagView.image = [UIImage imageNamed:@""];
            
            cell.dateLabel.backgroundColor = [UIColor clearColor];
         
            
        }else{
            
            if (self.isShuju) {
          
                cell.imagView.image = [[UIImage imageWithColor:[UIColor  yellowColor]] circleImage];
                cell.dateLabel.layer.cornerRadius = 20;
                
                cell.dateLabel.layer.masksToBounds = YES;
                
            }

            
        }
            
            
            
            
            
        
    }
   
    return cell;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        NSInteger daysInThisMonth = [self totaldaysInMonth:_date];
        NSInteger firstWeekday = [self firstWeekdayInThisMonth:_date];
        
        NSInteger day = 0;
        NSInteger i = indexPath.row;
        
        if (i >= firstWeekday && i <= firstWeekday + daysInThisMonth - 1) {
            day = i - firstWeekday + 1;
            
//            //this month这个判断超过今天不能点击
//            if ([_today isEqualToDate:_date]) {
//                if (day <= [self day:_date]) {
//                    return YES;
//                }
//            } else if ([_today compare:_date] == NSOrderedDescending) {
//                return YES;
//            }
//            
            if (day<=daysInThisMonth) {
                return YES;
            }

        }
    }
    return NO;
}
-(void)selectshuj{
    
    // 1.获得数据库文件的路径
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filename = [doc stringByAppendingPathComponent:@"creNO.sqlite"];
    
    self.db =[FMDatabase databaseWithPath:filename];
    
    
    self.dateMutableArray = [NSMutableArray array];
    
    if ([self.db open]) {
        
        //查询某个数据where crnNO = '0020170222'
        NSString * sql = @"SELECT * FROM sJobcar ";
        FMResultSet * rs = [self.db executeQuery:sql];
        while ([rs next]) {
          //  NSString *  address = [rs stringForColumn:@"address"];
            
          //  NSString *  name  = [rs stringForColumn:@"name"];
            
            NSString * workDate = [rs stringForColumn:@"workDate"];
            
          //  NSString * startTime = [rs stringForColumn:@"startTime"];
            
         //   NSString * stopTime = [rs stringForColumn:@"stopTime"];
            
          //  NSString * togetherTime = [rs stringForColumn:@"togetherTime"];
            
        //    NSInteger  numberOf = [rs intForColumn:@"numberOf"];
            
   //         NSInteger  hourlyWage = [rs intForColumn:@"hourlyWage"];
            
         //   NSInteger  allowance = [rs intForColumn:@"allowance"];
            
         //   NSInteger  intotalMoneny = [rs intForColumn:@"intotalMoneny"];
            
           // NSString * language = [rs stringForColumn:@"language"];
            
           // NSString * file= [rs stringForColumn:@"file"];
            
         //   NSString * theAmountOf = [rs stringForColumn:@"theAmountOf"];
         //
         //   NSString * clothing = [rs stringForColumn:@"clothing"];
            
        //    NSString * age = [rs stringForColumn:@"age"];
            
        //    NSString * workdetails = [rs stringForColumn:@"workdetails"];
            
            
           // NSLog(@"%@,%@,%@,%@,%@,%@,%ld,%ld,%ld,%ld,%@,%@,%@,%@,%@,%@,",address,name,workDate,startTime,stopTime,togetherTime,(long)numberOf,(long)hourlyWage,(long)allowance,(long)intotalMoneny,language,file,theAmountOf,clothing,age,workdetails
                  
           // NSString * thereleasedate = [rs stringForColumn:@"releasedate"];
                  //);
            
          //  NSArray * dateArray =[rs ];
            
          //  NSLog(@" 2222222--%@",)
            
            [self.dateMutableArray addObject:workDate];
            
        }
        
    }
    
    [self.db close];
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    //NSLog(@"diangj");
    //点击选中的效果
   // UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
   // cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self.date];
    NSInteger firstWeekday = [self firstWeekdayInThisMonth:_date];
    
    NSInteger day = 0;
    NSInteger i = indexPath.row;
    day = i - firstWeekday + 1;
    if (self.calendarBlock) {
        self.calendarBlock(day, [comp month], [comp year]);
    }
    
    if (self.ishide) {
        
        [self hide];
        
    }
    
    
}

- (IBAction)previouseAction:(UIButton *)sender
{
    [UIView transitionWithView:self duration:0.5 options:UIViewAnimationOptionTransitionCurlDown animations:^(void) {
        self.date = [self lastMonth:self.date];
    } completion:nil];
}

- (IBAction)nexAction:(UIButton *)sender
{
    [UIView transitionWithView:self duration:0.5 options:UIViewAnimationOptionTransitionCurlUp animations:^(void) {
        self.date = [self nextMonth:self.date];
    } completion:nil];
}

+ (instancetype)showOnView:(UIView *)view
{
    SZCalendarPicker *calendarPicker = [[[NSBundle mainBundle] loadNibNamed:@"SZCalendarPicker" owner:self options:nil] firstObject];
    calendarPicker.mask = [[UIView alloc] initWithFrame:view.bounds];
    calendarPicker.mask.backgroundColor = [UIColor blackColor];
    calendarPicker.mask.alpha = 0.3;
    [view addSubview:calendarPicker.mask];
    [view addSubview:calendarPicker];
    return calendarPicker;
}

- (void)show
{
    //提前布局
    [self customInterface];
    
    self.transform = CGAffineTransformTranslate(self.transform, 0, -CGRectGetMaxY(self.frame));
    [UIView animateWithDuration:0.5 animations:^(void) {
        self.transform = CGAffineTransformIdentity;
    } completion:^(BOOL isFinished) {
        [self customInterface];
    }];
}

- (void)hide
{
    [UIView animateWithDuration:0.5 animations:^(void) {
        self.transform = CGAffineTransformTranslate(self.transform, 0, -CGRectGetMaxY(self.frame));
        self.mask.alpha = 0;
    } completion:^(BOOL isFinished) {
        [self.mask removeFromSuperview];
        [self removeFromSuperview];
    }];
}


- (void)addSwipe
{
    UISwipeGestureRecognizer *swipLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(nexAction:)];
    swipLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self addGestureRecognizer:swipLeft];
    
    UISwipeGestureRecognizer *swipRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(previouseAction:)];
    swipRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self addGestureRecognizer:swipRight];
}

- (void)addTap
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
    
    if (self.ishide) {
         [self.mask addGestureRecognizer:tap];
    }
   
}
@end
