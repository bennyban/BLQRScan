//
//  BLQRScanResult.m
//  QRScanStudyDemo
//
//  Created by 班磊 on 15/12/4.
//  Copyright © 2015年 bennyban. All rights reserved.
//

#import "BLQRScanResult.h"

@implementation BLQRScanResult

- (instancetype)initWithScanString:(NSString*)str imgScan:(UIImage*)img barCodeType:(NSString*)type
{
    if (self = [super init]) {
        
        _strScanned = str;
        _imgScanned = img;
        _strBarCodeType = type;
    }
    
    return self;
}

@end
