//
//  JobTableViewCell.m
//  Job
//
//  Created by bidiao on 2017/7/13.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "JobTableViewCell.h"

@interface JobTableViewCell()



@end
@implementation JobTableViewCell

{
   // UIButton * _view0;
   // UIView * _view1;
    UILabel * _startdatelabel;
    UIView  * _lineView;
    UILabel * _stopdatelabel;
    UILabel * _zonggongdatelabel;
    UILabel * _logo;
    UILabel * _name;
    UILabel * _nameState;
    UILabel * _pepolabel;
    UILabel * _moneylabel;
    UILabel * _detailslabel;
    
    
    
    
}
#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    
        UILabel * datelabel = [[UILabel alloc]init];
        
        _startdatelabel  = datelabel;
      _startdatelabel.backgroundColor =[UIColor yellowColor];
        //datelabel.numberOfLines = 0;
        
        //_datelabel.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview:_startdatelabel];
        
        
        UIView * lineView = [UIView new];
        
        
        _lineView = lineView;
        
        lineView.backgroundColor = [UIColor lightGrayColor];
        
        [self.contentView addSubview:lineView];
        
        UILabel * stopdatelabel = [[UILabel alloc]init];
        
        
        
        _stopdatelabel  = stopdatelabel;
        
       _stopdatelabel.backgroundColor =[UIColor yellowColor];
        //datelabel.numberOfLines = 0;
        
        //_datelabel.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview:_stopdatelabel];
        
        
        
        
        
        UILabel * zonggongdatelabel = [[UILabel alloc]init];
        
        _zonggongdatelabel = zonggongdatelabel;
        
        
        _zonggongdatelabel.textColor = fontColor(53, 0, 119);
        
       _zonggongdatelabel.backgroundColor =[UIColor yellowColor];
        //datelabel.numberOfLines = 0;
        
        //_datelabel.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview:_zonggongdatelabel];
        
        
        UILabel * logo = [[UILabel alloc]init];
        
        _logo =logo;
        
        logo.backgroundColor =fontColor(235, 236, 237);
        
//        logo.layer.cornerRadius = 40;
//
       // logo.layer.masksToBounds = YES;
//
        logo.textColor = fontColor(137, 109, 165);
        
       // [logo setTitleColor:fontColor(137, 109, 165) forState:UIControlStateNormal];
        
        logo.text = @"商户\nLogo";
        
        //[logo setTitle:@"商户\nLogo" forState:UIControlStateNormal];
        logo.textAlignment = NSTextAlignmentCenter;
        
       // logo.titleLabel.numberOfLines = 0;
        logo.numberOfLines = 0;
        
        logo.layer.borderColor = fontColor(235, 236, 237) .CGColor;
        
        logo.layer.borderWidth = 0.8;
        
        logo.layer.shadowColor = [ UIColor blackColor ] .CGColor;
        logo.layer.shadowOpacity = 1.0 ;
        logo.layer.shadowRadius = 4.0 ;
        logo.layer.shadowOffset = CGSizeMake(0,3) ;
       // logo.clipsToBounds = NO ;
        logo.layer.cornerRadius = 40;
        
        logo.layer.masksToBounds = YES;
        
        [self.contentView addSubview:logo];
        
        
        UILabel * name = [[UILabel alloc]init];
        
        _name  = name;
        
        _name.textColor = fontColor(53, 0, 119);
        
        _name.font = [UIFont systemFontOfSize:19];
        _name.backgroundColor =[UIColor redColor];
        
        _name.adjustsFontSizeToFitWidth = YES;
        
        
        [self.contentView addSubview:name];
        
        
        UILabel * namestate =[[UILabel alloc]init];
        
        _nameState = namestate;
        
        namestate.text = @"超额申请";
        
         namestate.textColor = fontColor(137, 109, 165);
        
        [self.contentView addSubview:namestate];
        

        UILabel * pepolabel = [[UILabel alloc]init];
        
        _pepolabel  = pepolabel;
        
        pepolabel.layer.cornerRadius = 10;
        
        _pepolabel.layer.masksToBounds = YES;
        
        _pepolabel.textAlignment = NSTextAlignmentCenter;
        
        _pepolabel.backgroundColor =[UIColor colorWithRed:252/255.0 green:49/255.0 blue:89/255.0 alpha:0.9];
        [self.contentView addSubview:pepolabel];
        

    
        UILabel * moneylabel = [[UILabel alloc]init];
        
        _moneylabel  = moneylabel;
        
        _moneylabel.backgroundColor = [UIColor blueColor];
        
        _moneylabel.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:moneylabel];
        
        UILabel * detailslabel = [[UILabel alloc]init];
        
        _detailslabel = detailslabel;
    //  _detailslabel.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:detailslabel];
        
        _detailslabel.textColor = [UIColor grayColor];
    
        _detailslabel.adjustsFontSizeToFitWidth = YES;
        
        
        
        UIImage *imageGray=[UIImage imageNamed:@"d"];
        UIImageView* accessoryViewGray=[[UIImageView alloc] initWithImage:imageGray];
        CGFloat imageHeight=7;
        accessoryViewGray.frame=CGRectMake(0, 0, imageHeight, imageHeight*imageGray.size.height/imageGray.size.width);
     //   UIImage *imageBlue=[UIImage imageNamed:@"accessoryBlue"];
     //   UIImageView* accessoryViewBlue=[[UIImageView alloc] initWithImage:imageBlue];
     //   accessoryViewBlue.frame=CGRectMake(0, 0, imageHeight, imageHeight*imageBlue.size.height/imageBlue.size.width);
        self.accessoryView=accessoryViewGray;
        
        
        
        
     //   self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        self.selectionStyle = UITableViewCellStateDefaultMask;
    
    
    }
    
    
    
    return self;
    
    
    
    
    
}
-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    _startdatelabel.frame = CGRectMake(5, 5, 70, 20);
    
    _lineView.frame = CGRectMake(27, CGRectGetMaxY(_startdatelabel.frame), 2, 35);
    _stopdatelabel.frame = CGRectMake(5, CGRectGetMaxY(_lineView.frame), 70, 20);
    
    
      _zonggongdatelabel.frame = CGRectMake(5, CGRectGetMaxY(_stopdatelabel.frame)+10, 70, 20);
    
    
    _logo.frame = CGRectMake(self.contentView.frame.size.width-80, 20, 80, 80);
    _name.frame =CGRectMake(CGRectGetMaxX(_startdatelabel.frame)+3, 5, 120, 40);
    
    _nameState.frame = CGRectMake(CGRectGetMaxX(_name.frame), 5, self.contentView.frame.size.width-200, 30);
     _pepolabel.frame =CGRectMake(CGRectGetMaxX(_startdatelabel.frame)+3, CGRectGetMaxY(_lineView.frame)-5, 50, 30);
    
    _moneylabel.frame =CGRectMake(CGRectGetMaxX(_pepolabel.frame)+5, CGRectGetMaxY(_lineView.frame)-5,self.contentView.frame.size.width-90-CGRectGetMaxX(_pepolabel.frame)+5, 30);
    
    _detailslabel.frame = CGRectMake(CGRectGetMaxX(_startdatelabel.frame)+3, self.contentView.frame.size.height-30,  self.contentView.frame.size.width-50, 25);
    
}
//日期
-(void)setDateString:(NSString *)dateString{
    
    _dateString = dateString;
    
    //NSMutableAttributedString * string = [[NSMutableAttributedString alloc] initWithString:dateString];
  //  [string addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(dateString.length-5,5)];
    
  
    _startdatelabel.text = dateString;
   // _datelabel.attributedText = string;
}
//开始
-(void)setStartdateString:(NSString *)startdateString{
    
    _startdateString = startdateString;
    
    _startdatelabel.text = startdateString;
    
    
}
//结束
-(void)setStopString:(NSString *)stopString{
    
    _stopString = stopString;
    
    _stopdatelabel.text = @"12:00";
}
-(void)setTogertimeString:(NSString *)togertimeString{
   
    _togertimeString = togertimeString;
    
    _zonggongdatelabel.text = [NSString stringWithFormat:@"%d小时",12];;
    
    
}
//主题
-(void)setNameString:(NSString *)nameString{
    
    
    _nameString = nameString;
    
    _name.text = @"侍應";
}
//人数
-(void)setPopoleString:(NSString *)popoleString{
    
    _popoleString = popoleString;
  ;
    _pepolabel.text = [NSString stringWithFormat:@"%@位",popoleString];
    
}
//钱数
-(void)setMoneyString:(NSString *)moneyString{
    
    
    _moneyString  = moneyString;
    
    _moneylabel.text = moneyString;
}

-(void)setDetailsString:(NSString *)detailsString{
    
    _detailsString = detailsString;
    
    _detailslabel.text = detailsString;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
