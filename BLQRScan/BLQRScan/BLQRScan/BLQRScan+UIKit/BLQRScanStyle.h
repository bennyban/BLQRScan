//
//  BLQRScanStyle.h
//  QRScanStudyDemo
//
//  Created by 班磊 on 15/12/4.
//  Copyright © 2015年 bennyban. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 扫码区域动画效果
 */
typedef enum BLQRScanAnimationStyle
{
    BLQRScanAnimationStyle_LineMove,     /**< 线条上下移动 */
    BLQRScanAnimationStyle_NetGrid,      /**< 网格 */
    BLQRScanAnimationStyle_LineStill,    /**< 线条停止在扫码区域中央 */
    BLQRScanAnimationStyle_None          /**< 无动画 */
    
}BLQRScanAnimationStyle;

/**
 扫码区域4个角位置类型
 */
typedef enum BLQRScanPhotoframeAngleStyle
{
    BLQRScanPhotoframeAngleStyle_Inner,  /**< 内嵌，一般不显示矩形框情况下 */
    BLQRScanPhotoframeAngleStyle_Outer,  /**< 外嵌,包围在矩形框的4个角 */
    BLQRScanPhotoframeAngleStyle_On      /**< 在矩形框的4个角上，覆盖 */
}BLQRScanPhotoframeAngleStyle;

@interface BLQRScanStyle : NSObject

#pragma mark -中心位置矩形框

@property (nonatomic, assign) BOOL isNeedShowRetangle;      /**< 是否需要绘制扫码矩形框，默认YES */

@property (nonatomic, assign) CGFloat whRatio;              /**< 默认扫码区域为正方形，如果扫码区域不是正方形，设置宽高比 */

@property (nonatomic, assign) CGFloat centerUpOffset;       /**< 矩形框(视频显示透明区)域向上移动偏移量，0表示扫码透明区域在当前视图中心位置，如果负值表示扫码区域下移 */

@property (nonatomic, assign) CGFloat xScanRetangleOffset;  /**< 矩形框(视频显示透明区)域离界面左边及右边距离，默认60 */

@property (nonatomic, strong) UIColor *colorRetangleLine;   /**< 矩形框线条颜色 */

#pragma mark -矩形框(扫码区域)周围4个角

@property (nonatomic, assign) BLQRScanPhotoframeAngleStyle photoframeAngleStyle; /**< 扫码区域的4个角类型 */

@property (nonatomic, strong) UIColor* colorAngle;          /**< 4个角的颜色 */

@property (nonatomic, assign) CGFloat photoframeAngleW;     /**< 扫码区域4个角的宽度和高度 */

@property (nonatomic, assign) CGFloat photoframeAngleH;

@property (nonatomic, assign) CGFloat photoframeLineW;      /**< 扫码区域4个角的线条宽度,默认6，建议8到4之间 */

#pragma mark --动画效果

@property (nonatomic, assign) BLQRScanAnimationStyle anmiationStyle; /**< 扫码动画效果:线条或网格 */

@property (nonatomic,strong) UIImage *animationImage;        /**< 动画效果的图像，如线条或网格的图像 */

#pragma mark -非识别区域颜色,默认 RGBA (0,0,0,0.5)，范围（0--1）
@property (nonatomic, assign) CGFloat red_notRecoginitonArea;
@property (nonatomic, assign) CGFloat green_notRecoginitonArea;
@property (nonatomic, assign) CGFloat blue_notRecoginitonArea;
@property (nonatomic, assign) CGFloat alpa_notRecoginitonArea;

@end
