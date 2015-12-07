//
//  BLQRScanViewController.h
//  BLQRScan
//
//  Created by 班磊 on 15/12/7.
//  Copyright © 2015年 bennyban. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BLQRScanView.h"
#import "BLQRScanWrapper.h"

@interface BLQRScanViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic,strong) BLQRScanWrapper* scanObj;      /**< 扫码功能封装对象 */

#pragma mark - 扫码界面效果及提示等

@property (nonatomic,strong) BLQRScanView* qRScanView;      /**< 扫码区域视图,二维码一般都是框 */

@property(nonatomic,strong)UIImage* scanImage;              /**< 扫码当前图片 */

@property (nonatomic, strong) BLQRScanStyle *style;         /**< 界面效果参数 */

@property(nonatomic,assign)BOOL isOpenInterestRect;         /**< 启动区域识别功能 */

#pragma mark -模仿qq界面

@property (nonatomic, assign) BOOL isQQSimulator;

@property (nonatomic, strong) UILabel *topTitle;            /**< 扫码区域上方提示文字 */

@property(nonatomic,assign)BOOL isOpenFlash;                /**< 闪关灯开启状态 */

#pragma mark - 底部几个功能：开启闪光灯、相册、我的二维码

@property (nonatomic, strong) UIView *bottomItemsView;      /**< 底部显示的功能项 */

@property (nonatomic, strong) UIButton *btnPhoto;           /**< 相册 */

@property (nonatomic, strong) UIButton *btnFlash;           /**< 闪光灯 */

@property (nonatomic, strong) UIButton *btnMyQR;            /**< 我的二维码 */

@end
