//
//  BLQRScanResult.h
//  QRScanStudyDemo
//
//  Created by 班磊 on 15/12/4.
//  Copyright © 2015年 bennyban. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BLQRScanResult : NSObject

- (instancetype)initWithScanString:(NSString*)str imgScan:(UIImage*)img barCodeType:(NSString*)type;

@property (nonatomic, copy) NSString* strScanned;   /**< 扫码字符串 */

@property (nonatomic, strong) UIImage* imgScanned;  /**< 扫码图像 */

@property (nonatomic, copy) NSString* strBarCodeType; /**< 扫码码的类型,AVMetadataObjectType  如AVMetadataObjectTypeQRCode，AVMetadataObjectTypeEAN13Code等  如果使用ZXing扫码，返回类型也已经转换成对应的AVMetadataObjectType */

@end
