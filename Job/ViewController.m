//
//  ViewController.m
//  Job
//
//  Created by bidiao on 17/3/6.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "ViewController.h"

//#import "ZLPhotoActionSheet.h"
//#import "ZLPhotoBrowser.h"
#import "MBProgressHUD.h"
#import "ClipViewController.h"


#import "JopViewController.h"
#import "LanguageViewController.h"
#import "UIView+Extension.h"
#import "HYLeftView.h"
#import "JopViewController.h"
#import "LanguageViewController.h"
#import "HYShouViewController.h"
#import "HYTitleView.h"
#import "HYNavigationViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "UIImage+Extension.h"
#import "ExitViewController.h"
#import "LogViewController.h"
#import "MyJobXiavViewController.h"
#import "PersonMainViewController.h"
#import "InstructionsViewController.h"
#import "ChangepasswordViewController.h"

#define HYRandomColor  [UIColor colorWithRed:(arc4random_uniform(256))/255.0 green:(arc4random_uniform(256))/255.0 blue:(arc4random_uniform(256))/255.0 alpha:1.0]
#define  HYNavShowAnimDuration 0.5
#define  HYCoverTag 100
@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,ClipViewControllerDelegate,HYLeftViewDelegate>

//@property(nonatomic,strong) NSArray<ZLSelectPhotoModel *> *lasetSelectMoldes;
@property(nonatomic,strong) MBProgressHUD * hud;
@property(nonatomic,strong) UIImageView * imageView;

@property(nonatomic,weak) HYShouViewController * shouvie;
@property(nonatomic,weak) HYLeftView * leftView;
@property(nonatomic,strong) UIButton * clickbutton;
@property(nonatomic,weak) UINavigationController * shownavigationCotroller;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //添加左视图
    [self lefView];
    [self addChildViewControllerm];
    
    [self menudidSelectedBUttonFromIndex:0 toIndex:0];
    
}
-(void)addChildViewControllerm{
    
    HYShouViewController *news =[HYShouViewController new];
    
    self.shouvie = news;
    [self addOneChlildVc:news title:@"即聘" imageName:@"tabbar_home"selectedImageName:@"tabbar_home_selected"];
    
    ///  JopViewController * readingNews =[[JopViewController alloc]init];
    
    // [ self addOneChlildVc:readingNews title:@"每日职位" imageName:@"tabbar_home"selectedImageName:@"tabbar_home_selected"];
    
    // LanguageViewController * photo =[[LanguageViewController alloc]init];
    
    //  [ self addOneChlildVc:photo title:@"语言" imageName:@"tabbar_home"selectedImageName:@"tabbar_home_selected"];
    
    //  ExitViewController * exit =[[ExitViewController alloc]init];
    
    //   [ self addOneChlildVc:exit title:@"重新登录" imageName:@"tabbar_home"selectedImageName:@"tabbar_home_selected"];
    
}
-(void)addOneChlildVc:(UIViewController *)chilVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectImageName {
    
   // chilVc.title = title;
    chilVc.tabBarItem.image =[UIImage imageWithColor:[UIColor greenColor]];
    //设置tabarItem的普通文字颜色
    NSMutableDictionary *textAttrs =[NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName]=[UIColor blackColor];
    textAttrs[NSFontAttributeName]=[UIFont systemFontOfSize:10];
    [chilVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    //选中时候的tabarItem的文字颜色
    NSMutableDictionary *selectedtextAttrs =[NSMutableDictionary dictionary];
    selectedtextAttrs[NSForegroundColorAttributeName]=[UIColor orangeColor];
    [chilVc.tabBarItem setTitleTextAttributes:selectedtextAttrs forState:UIControlStateSelected];
    //设置选中的图片
    UIImage *selectedImage = [UIImage imageWithName:selectImageName];
    //  不要渲染
    selectedImage =[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    chilVc.tabBarItem.selectedImage = selectedImage;
    
    
    // chilVc.view.backgroundColor =HYRandomColor;
    //HYTitleView *titleView =[[HYTitleView alloc]init];
    //titleView.title =title;
    //chilVc.navigationItem.titleView = titleView;
    
    //top_navigation_menuicon
    chilVc.navigationItem.leftBarButtonItem =[UIBarButtonItem  itemWithImageName:@"left" target:self action:@selector(lefMen)];
    HYNavigationViewController * navi =[[HYNavigationViewController alloc]initWithRootViewController:chilVc];
    
    
    [self addChildViewController:navi];
    
}
//-(void)addlefMen{
//
//    [self lefMen];
//}
-(void)lefView{
    
    HYLeftView *lefMenuView =[[HYLeftView alloc]init];
    //lefMenuView.backgroundColor = [UIColor orangeColor];
    lefMenuView.y=60;
    lefMenuView.height = 400;
    lefMenuView.width = 200;
    lefMenuView.delegateL =self;
    [self.view insertSubview:lefMenuView atIndex:1];
    self.leftView =lefMenuView;
    
    
}-(void)lefMen{
    
    
    
    self.leftView.hidden = NO;
    [UIView animateWithDuration:HYNavShowAnimDuration animations:^{
        
        UIView * view =self.shownavigationCotroller.view;
        CGFloat navi =[UIScreen mainScreen].bounds.size.height -2*60;
        CGFloat scale =navi/[UIScreen mainScreen].bounds.size.height;
        CGFloat leftMenuMargin =[UIScreen mainScreen].bounds.size.width*(1-scale)*0.5;
        CGFloat translateX = 200-leftMenuMargin;
        CGFloat topMargin =[UIScreen mainScreen].bounds.size.height *(1-scale)*0.5;
        CGFloat translateY =topMargin -60;
        
        //缩放
        CGAffineTransform scaleForm = CGAffineTransformMakeScale(1, 1);
        //平移
        CGAffineTransform translateForm =CGAffineTransformTranslate(scaleForm, translateX/scale, translateY/scale);
        view.transform =translateForm;
        //遮盖
        UIButton * cover =[[UIButton alloc]init];
        [cover addTarget:self action:@selector(coverClick:) forControlEvents:UIControlEventTouchUpInside];
        cover.frame = view.bounds;
        cover.tag =HYCoverTag;
        [view addSubview:cover];
        //self.clickbutton = cover;
        
    }];
    
    
    
}
-(void)coverClick:(UIView *)cover{
    
    [UIView animateWithDuration:HYNavShowAnimDuration animations:^{
        self.shownavigationCotroller.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [cover removeFromSuperview];
    }];
    
    
}

-(void)leftMenu:(HYLeftView *)menu didSelectedBUttonFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex{
    
    
    
    
    if ( toIndex ==0 ) {
        NSLog(@"dddd");
        
       // UINavigationController * nav =[[UINavigationController alloc]initWithRootViewController:[LogViewController new]];
        
       // UINavigationController * na = [[UINavigationController alloc]initWithRootViewController:[PersonMainViewController new]
                                    //   ];
        
        [self.shouvie.navigationController pushViewController:[LogViewController new] animated:YES];
        
        //[self presentViewController:nav animated:YES completion:nil];
        [self dismovViewController];
    }else if (toIndex ==1){
        
        [self.shouvie.navigationController pushViewController:[MyJobXiavViewController new] animated:YES];
        // [self menudidSelectedBUttonFromIndex:0 toIndex:0];
        
        [self dismovViewController];
        
    }else if (toIndex ==2){
        LanguageViewController * lang =[[LanguageViewController alloc]init];
        
        [self.shouvie.navigationController pushViewController:lang animated:YES];
        
       // [self dismovViewController];
        
        
        
        //[self menudidSelectedBUttonFromIndex:0 toIndex:0];
        
    }else if (toIndex ==3){
        
        [self.shouvie.navigationController pushViewController:[InstructionsViewController new] animated:YES];
        //使用說明
        
        
    }else if (toIndex ==4){
        //更改密碼
        
        [self.shouvie.navigationController pushViewController:[ChangepasswordViewController new] animated:YES];
        
        
    }
    [self dismovViewController];
    

    //    }else{
    //
    //
    //        [self menudidSelectedBUttonFromIndex:fromIndex toIndex:toIndex];
    //    }
    
    
    
}
-(void)dismovViewController{
    
    
    [UIView animateWithDuration:HYNavShowAnimDuration animations:^{
        self.shownavigationCotroller.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [[ self.shownavigationCotroller.view viewWithTag:HYCoverTag]  removeFromSuperview];
        //[cover removeFromSuperview];
    }];
    
    
}
-(void)menudidSelectedBUttonFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex{
    
    
    HYNavigationViewController *ildNav =self.childViewControllers[fromIndex];
    //ildNav.dd =self;
    [ildNav.view removeFromSuperview];
    HYNavigationViewController *nave =self.childViewControllers[toIndex];
    [self.view addSubview:nave.view];
    
    nave.view.transform =ildNav.view.transform;
    nave.view.layer.shadowColor=[UIColor blackColor].CGColor;
    nave.view.layer.shadowOffset = CGSizeMake(-3, 0);
    nave.view.layer.shadowOpacity = 0.4;
    
    self.shownavigationCotroller =nave;
    [self coverClick:[nave.view viewWithTag:HYCoverTag]];
    
    
    
}


-(void)selectButtonyulan{
    
    
    UIButton * phtotoPreView =[[UIButton alloc]init];
    
    phtotoPreView.frame = CGRectMake(20, 200, 200, 100);
    
    [phtotoPreView setTitle:@"xaiak" forState:UIControlStateNormal];
   
    phtotoPreView.backgroundColor = [UIColor yellowColor];
    
    [phtotoPreView setTintColor:[UIColor blackColor]];
    
    [phtotoPreView addTarget:self action:@selector(selePhoto) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView * imageView = [[UIImageView alloc]init];
    
    imageView.frame = CGRectMake(20, 300, 200, 200);
    
    self.imageView = imageView;
    [self.view addSubview:imageView];
    
    [self.view addSubview:phtotoPreView];
    
}
/**
 *  打开相机或相册
 */
- (void)openCameraOrPhotoLibrary
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [self presentViewController:alertVC animated:YES completion:nil];
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        // 打开相机 比较懒，暂时先这样获取访问权限
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            [self openWithSourceType:UIImagePickerControllerSourceTypeCamera];
        }
    }]];
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        // 打开相册
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
        {
            [self openWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        }
    }]];
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
}

//
- (void)openWithSourceType:(UIImagePickerControllerSourceType)sourceType
{
    UIImagePickerController *imagePickerVC = [[UIImagePickerController alloc] init];
    imagePickerVC.sourceType = sourceType;
    imagePickerVC.delegate = self;
    
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    ClipViewController *clipVC = [[ClipViewController alloc] init];
    clipVC.delegate = self;
    clipVC.needClipImage = [self fixOrientation:info[UIImagePickerControllerOriginalImage]];
    [picker pushViewController:clipVC animated:YES];
}

- (UIImage *)fixOrientation:(UIImage *)originalImage
{
    if (originalImage.imageOrientation == UIImageOrientationUp) return originalImage;
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (originalImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, originalImage.size.width, originalImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, originalImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, originalImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    
    switch (originalImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, originalImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, originalImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    
    CGContextRef ctx = CGBitmapContextCreate(NULL, originalImage.size.width, originalImage.size.height,
                                             CGImageGetBitsPerComponent(originalImage.CGImage), 0,
                                             CGImageGetColorSpace(originalImage.CGImage),
                                             CGImageGetBitmapInfo(originalImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (originalImage.imageOrientation)
    {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            CGContextDrawImage(ctx, CGRectMake(0,0,originalImage.size.height,originalImage.size.width), originalImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,originalImage.size.width,originalImage.size.height), originalImage.CGImage);
            break;
    }
    
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

#pragma mark  -- ClipViewControllerDelegate

- (void)didSuccessClipImage:(UIImage *)clipedImage
{
   self.imageView.backgroundColor = [UIColor redColor];
    self.imageView.contentMode = UIViewContentModeScaleToFill;
    //self.clipedImageView.image = clipedImage;
#warning  上传
    NSLog(@"上传");
    //打电话
//    NSMutableString *str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"186xxxx6979"];
//    UIWebView *callWebview = [[UIWebView alloc] init];
//    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
//    [self.view addSubview:callWebview];
   
    self.imageView.image = clipedImage;
    
    
    //NSData * data = UIImageJPEGRepresentation(allimage, 0.2);
    // NSString * sr = [data  base64Encoding ];
   //  [self.wkWebView evaluateJavaScript:[NSString stringWithFormat:@"callbackPhoto('%@')",s] completionHandler:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(UIImage*) OriginImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
}
-(void)selePhoto{
    [self openCameraOrPhotoLibrary];
    
//    ZLPhotoActionSheet *  action = [[ZLPhotoActionSheet alloc]init];
//    
//    action.maxSelectCount  =1;
//    
//    action.maxPreviewCount = 10;
//    
//    
//    __weak typeof(self) weakSelf = self;
//
//    [action showPreviewPhotoWithSender:self animate:YES lastSelectPhotoModels:self.lasetSelectMoldes completion:^(NSArray<UIImage *> * _Nonnull selectPhotos, NSArray<ZLSelectPhotoModel *> * _Nonnull selectPhotoModels) {
//      
//        
//        NSLog(@" %@",selectPhotoModels);
//        
//    }];
    
    
    
    
    
}
//打电话
-(void)tellphone{
    
    NSString * string =@"186xxxx6979";
        NSMutableString *str=[[NSMutableString alloc] initWithFormat:@"tel:%@",string];
        UIWebView *callWebview = [[UIWebView alloc] init];
        [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
        [self.view addSubview:callWebview];
    
    
}
-(void)whatsapp{
    
    NSString * msg = @"";
    
    NSString * url = [NSString stringWithFormat:@"whatsapp://send?text=%@",[msg stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]]];
    
    NSURL * whatsappURL = [NSURL URLWithString:url];
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"whatsapp://app"]]) {
          [[UIApplication sharedApplication] openURL:whatsappURL options:@{} completionHandler:nil];
    }else {
        
          UIAlertController * actioncontroller =  [UIAlertController alertControllerWithTitle:@"WhatsApp not installed." message:@"Your device has no WhatsApp installed." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleCancel handler:nil];
        
        [actioncontroller addAction:action];
        
        [self presentViewController:actioncontroller animated:YES completion:nil];
    }
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
