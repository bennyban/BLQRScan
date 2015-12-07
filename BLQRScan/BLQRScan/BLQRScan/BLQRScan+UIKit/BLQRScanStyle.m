//
//  BLQRScanStyle.m
//  QRScanStudyDemo
//
//  Created by 班磊 on 15/12/4.
//  Copyright © 2015年 bennyban. All rights reserved.
//

#import "BLQRScanStyle.h"

@interface BLQRScanStyle ()

@end

@implementation BLQRScanStyle

- (id)init
{
    if (self =  [super init])
    {
        _isNeedShowRetangle = YES;
        
        _whRatio = 1.0;
        
        _colorRetangleLine = [UIColor whiteColor];
        
        _centerUpOffset = 44;
        _xScanRetangleOffset = 60;
//        if ([UIScreen mainScreen].bounds.size.height <= 480 )
//        {
//            //3.5inch 显示的扫码缩小
//            self.xScanRetangleOffset = self.xScanRetangleOffset - 10;
//        }
        _anmiationStyle = BLQRScanAnimationStyle_LineMove;
        _photoframeAngleStyle = BLQRScanPhotoframeAngleStyle_Outer;
        _colorAngle = [UIColor colorWithRed:0. green:167./255. blue:231./255. alpha:1.0];
        
        _red_notRecoginitonArea = 0.0;
        _green_notRecoginitonArea = 0.0;
        _blue_notRecoginitonArea = 0.0;
        _alpa_notRecoginitonArea = 0.5;
        
        _photoframeAngleW = 24;
        _photoframeAngleH = 24;
        _photoframeLineW = 7;
    }
    return self;
}

@end
