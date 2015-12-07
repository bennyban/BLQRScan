//
//  BLQRScanView.h
//  QRScanStudyDemo
//
//  Created by 班磊 on 15/12/4.
//  Copyright © 2015年 bennyban. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BLQRScanLineAnimation.h"
#import "BLQRScanNetAnimation.h"
#import "BLQRScanStyle.h"

/**
 扫码区域显示效果
 */
@interface BLQRScanView : UIView

/*!
*  @brief  初始化
*
*  @param frame 位置大小
*  @param style 类型
*
*  @return instancetype
*/
-(id)initWithFrame:(CGRect)frame style:(BLQRScanStyle*)style;

/*!
 *  @brief  设备启动中文字提示
 *
 *  @param text 设备启动中文字提示
 */
- (void)startDeviceReadyingWithText:(NSString*)text;

/*!
 *  @brief  设备启动完成
 */
- (void)stopDeviceReadying;

/*!
 *  @brief  开始扫描动画
 */
- (void)startScanAnimation;

/*!
 *  @brief  结束扫描动画
 */
- (void)stopScanAnimation;

/*!
 *  @brief  根据矩形区域，获取识别兴趣区域
 *
 *  @param view  视频流显示UIView
 *  @param style 效果界面参数
 *
 *  @return 识别区域
 */
+ (CGRect)getScanRectWithPreView:(UIView*)view style:(BLQRScanStyle*)style;

@end
