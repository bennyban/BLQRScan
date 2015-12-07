//
//  BLScanLineAnimation.h
//  QRScanStudyDemo
//
//  Created by 班磊 on 15/12/4.
//  Copyright © 2015年 bennyban. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BLQRScanLineAnimation : UIImageView

/*!
*  @brief  开始扫码线动画
*
*  @param animationRect 显示在parentView中得区域
*  @param parentView    动画显示在UIView
*  @param image         扫码线的图像
*/
- (void)startAnimatingWithRect:(CGRect)animationRect InView:(UIView*)parentView Image:(UIImage*)image;

/*!
 *  @brief  停止动画
 */
- (void)stopAnimating;

@end
