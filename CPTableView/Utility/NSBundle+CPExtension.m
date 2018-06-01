//
//  NSBundle+CPExtension.m
//  CPCommonTableView
//
//  Created by 陈鹏 on 2018/5/23.
//  Copyright © 2018年 陈鹏. All rights reserved.
//

#import "NSBundle+CPExtension.h"
#import "CPTableViewCell.h"

@implementation NSBundle (CPExtension)

+ (instancetype)cp_commonBundle {
    static NSBundle *commonBundle = nil;
    if (commonBundle == nil) {
        commonBundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[CPTableViewCell class]] pathForResource:@"CPCell" ofType:@"bundle"]];
    }
    return commonBundle;
}

+ (UIImage *)cp_arrowImage {
    static UIImage *arrowImage = nil;
    if (arrowImage == nil) {
         arrowImage = [[UIImage imageWithContentsOfFile:[[self cp_commonBundle] pathForResource:@"RightArrowGray@2x" ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
    return arrowImage;
}

@end
