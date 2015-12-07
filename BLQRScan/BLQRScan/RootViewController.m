//
//  RootViewController.m
//  BLQRScan
//
//  Created by 班磊 on 15/12/7.
//  Copyright © 2015年 bennyban. All rights reserved.
//

#import "RootViewController.h"
#import <objc/message.h>
#import "BLQRScanStyle.h"
#import "BLQRScanViewController.h"

@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;   /**< 当前表格 */

@property (nonatomic, strong) NSArray* arrayItems;      /**< 数据 */

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"扫码";
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    _arrayItems = @[
                    @[@"模拟qq扫码界面",@"qqStyle"],
                    @[@"模仿支付宝扫码区域",@"ZhiFuBaoStyle"],
                    @[@"模仿微信扫码区域",@"weixinStyle"],
                    @[@"无边框，内嵌4个角",@"InnerStyle"],
                    @[@"4个角在矩形框线上,网格动画",@"OnStyle"],
                    @[@"自定义颜色",@"changeColor"],
                    @[@"只识别框内",@"recoCropRect"],
                    @[@"改变尺寸",@"changeSize"],
                    @[@"条形码效果",@"notSquare"],
                    @[@"二维码/条形码生成",@"myQR"]
                    ];
    
    [self initView];
}

- (void)initView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark - UITableViewDelegate
#pragma mark
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arrayItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [_arrayItems[indexPath.row]firstObject];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray* array = _arrayItems[indexPath.row];
    NSString *methodName = [array lastObject];
    
    SEL normalSelector = NSSelectorFromString(methodName);
    if ([self respondsToSelector:normalSelector]) {
        
        ((void (*)(id, SEL))objc_msgSend)(self, normalSelector);
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark -模仿qq界面
- (void)qqStyle
{
    //设置扫码区域参数
    BLQRScanStyle *style = [[BLQRScanStyle alloc]init];
    style.centerUpOffset = 44;
    style.photoframeAngleStyle = BLQRScanPhotoframeAngleStyle_Outer;
    style.photoframeLineW = 6;
    style.photoframeAngleW = 24;
    style.photoframeAngleH = 24;
    
    style.anmiationStyle = BLQRScanAnimationStyle_LineMove;
    
    //qq里面的线条图片
    UIImage *imgLine = [UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_light_green"];
    style.animationImage = imgLine;
    
    BLQRScanViewController *vc = [BLQRScanViewController new];
    vc.style = style;
    vc.isQQSimulator = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark --模仿支付宝
- (void)ZhiFuBaoStyle
{
    //设置扫码区域参数
    BLQRScanStyle *style = [[BLQRScanStyle alloc]init];
    style.centerUpOffset = 60;
    style.xScanRetangleOffset = 30;
    
    if ([UIScreen mainScreen].bounds.size.height <= 480 )
    {
        //3.5inch 显示的扫码缩小
        style.centerUpOffset = 40;
        style.xScanRetangleOffset = 20;
    }
    
    style.alpa_notRecoginitonArea = 0.6;
    
    style.photoframeAngleStyle = BLQRScanPhotoframeAngleStyle_Inner;
    style.photoframeLineW = 2.0;
    style.photoframeAngleW = 16;
    style.photoframeAngleH = 16;
    
    style.isNeedShowRetangle = NO;
    
    style.anmiationStyle = BLQRScanAnimationStyle_NetGrid;
    
    //使用的支付宝里面网格图片
    UIImage *imgFullNet = [UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_full_net"];
    
    
    style.animationImage = imgFullNet;
    
    
    [self openScanVCWithStyle:style];
}



#pragma mark -无边框，内嵌4个角
- (void)InnerStyle
{
    //设置扫码区域参数
    BLQRScanStyle *style = [[BLQRScanStyle alloc]init];
    style.centerUpOffset = 44;
    style.photoframeAngleStyle = BLQRScanPhotoframeAngleStyle_Inner;
    style.photoframeLineW = 3;
    style.photoframeAngleW = 18;
    style.photoframeAngleH = 18;
    style.isNeedShowRetangle = NO;
    
    style.anmiationStyle = BLQRScanAnimationStyle_LineMove;
    
    //qq里面的线条图片
    UIImage *imgLine = [UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_light_green"];
    
    style.animationImage = imgLine;
    //非正方形
    //        style.isScanRetangelSquare = NO;
    //        style.xScanRetangleOffset = 40;
    
    
    [self openScanVCWithStyle:style];
}

#pragma mark -无边框，内嵌4个角
- (void)weixinStyle
{
    //设置扫码区域参数
    BLQRScanStyle *style = [[BLQRScanStyle alloc]init];
    style.centerUpOffset = 44;
    style.photoframeAngleStyle = BLQRScanPhotoframeAngleStyle_Inner;
    style.photoframeLineW = 2;
    style.photoframeAngleW = 18;
    style.photoframeAngleH = 18;
    style.isNeedShowRetangle = YES;
    
    style.anmiationStyle = BLQRScanAnimationStyle_LineMove;
    
    style.colorAngle = [UIColor colorWithRed:0./255 green:200./255. blue:20./255. alpha:1.0];
    
    
    //qq里面的线条图片
    UIImage *imgLine = [UIImage imageNamed:@"CodeScan.bundle/qrcode_Scan_weixin_Line"];
    
    // imgLine = [self createImageWithColor:[UIColor colorWithRed:120/255. green:221/255. blue:71/255. alpha:1.0]];
    
    style.animationImage = imgLine;
    
    [self openScanVCWithStyle:style];
}

#pragma mark -框内区域识别
- (void)recoCropRect
{
    //设置扫码区域参数
    BLQRScanStyle *style = [[BLQRScanStyle alloc]init];
    style.centerUpOffset = 44;
    style.photoframeAngleStyle = BLQRScanPhotoframeAngleStyle_On;
    style.photoframeLineW = 6;
    style.photoframeAngleW = 24;
    style.photoframeAngleH = 24;
    style.isNeedShowRetangle = YES;
    
    style.anmiationStyle = BLQRScanAnimationStyle_NetGrid;
    
    //矩形框离左边缘及右边缘的距离
    style.xScanRetangleOffset = 80;
    
    //使用的支付宝里面网格图片
    UIImage *imgPartNet = [UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_part_net"];
    
    style.animationImage = imgPartNet;
    
    
    BLQRScanViewController *vc = [BLQRScanViewController new];
    vc.style = style;
    //开启只识别框内
    vc.isOpenInterestRect = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -4个角在矩形框线上,网格动画
- (void)OnStyle
{
    //设置扫码区域参数
    BLQRScanStyle *style = [[BLQRScanStyle alloc]init];
    style.centerUpOffset = 44;
    style.photoframeAngleStyle = BLQRScanPhotoframeAngleStyle_On;
    style.photoframeLineW = 6;
    style.photoframeAngleW = 24;
    style.photoframeAngleH = 24;
    style.isNeedShowRetangle = YES;
    
    style.anmiationStyle = BLQRScanAnimationStyle_NetGrid;
    
    
    //使用的支付宝里面网格图片
    UIImage *imgPartNet = [UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_part_net"];
    
    style.animationImage = imgPartNet;
    
    //非正方形
    //        style.isScanRetangelSquare = NO;
    //        style.xScanRetangleOffset = 40;
    
    [self openScanVCWithStyle:style];
}

#pragma mark -自定义4个角及矩形框颜色
- (void)changeColor
{
    //设置扫码区域参数
    BLQRScanStyle *style = [[BLQRScanStyle alloc]init];
    style.centerUpOffset = 44;
    style.photoframeAngleStyle = BLQRScanPhotoframeAngleStyle_On;
    style.photoframeLineW = 6;
    style.photoframeAngleW = 24;
    style.photoframeAngleH = 24;
    style.isNeedShowRetangle = YES;
    style.anmiationStyle = BLQRScanAnimationStyle_NetGrid;
    
    //使用的支付宝里面网格图片
    UIImage *imgPartNet = [UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_part_net"];
    
    style.animationImage = imgPartNet;
    
    //4个角的颜色
    style.colorAngle = [UIColor colorWithRed:65./255. green:174./255. blue:57./255. alpha:1.0];
    
    //矩形框颜色
    style.colorRetangleLine = [UIColor colorWithRed:247/255. green:202./255. blue:15./255. alpha:1.0];
    
    //非矩形框区域颜色
    style.red_notRecoginitonArea = 247./255.;
    style.green_notRecoginitonArea = 202./255;
    style.blue_notRecoginitonArea = 15./255;
    style.alpa_notRecoginitonArea = 0.2;
    
    
    [self openScanVCWithStyle:style];
}

#pragma mark -改变扫码区域位置
- (void)changeSize
{
    //设置扫码区域参数
    BLQRScanStyle *style = [[BLQRScanStyle alloc]init];
    
    //矩形框向上移动
    style.centerUpOffset = 60;
    //矩形框离左边缘及右边缘的距离
    style.xScanRetangleOffset = 100;
    
    
    style.photoframeAngleStyle = BLQRScanPhotoframeAngleStyle_On;
    style.photoframeLineW = 6;
    style.photoframeAngleW = 24;
    style.photoframeAngleH = 24;
    style.isNeedShowRetangle = YES;
    style.anmiationStyle = BLQRScanAnimationStyle_LineMove;
    
    //qq里面的线条图片
    UIImage *imgLine = [UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_light_green"];
    
    style.animationImage = imgLine;
    
    [self openScanVCWithStyle:style];
}

#pragma mark -非正方形，可以用在扫码条形码界面

- (UIImage*) createImageWithColor: (UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (void)notSquare
{
    //设置扫码区域参数
    BLQRScanStyle *style = [[BLQRScanStyle alloc]init];
    style.centerUpOffset = 44;
    style.photoframeAngleStyle = BLQRScanPhotoframeAngleStyle_Inner;
    style.photoframeLineW = 4;
    style.photoframeAngleW = 28;
    style.photoframeAngleH = 16;
    style.isNeedShowRetangle = NO;
    
    style.anmiationStyle = BLQRScanAnimationStyle_LineStill;
    
    
    style.animationImage = [self createImageWithColor:[UIColor redColor]];
    //非正方形
    //设置矩形宽高比
    style.whRatio = 4.3/2.18;
    
    //离左边和右边距离
    style.xScanRetangleOffset = 30;
    
    
    [self openScanVCWithStyle:style];
}

- (void)myQR
{
    //    MyQRViewController *vc = [[MyQRViewController alloc]init];
    //    [self.navigationController pushViewController:vc animated:YES];
}

- (void)openScanVCWithStyle:(BLQRScanStyle*)style
{
    BLQRScanViewController *vc = [BLQRScanViewController new];
    vc.style = style;
    //vc.isOpenInterestRect = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
