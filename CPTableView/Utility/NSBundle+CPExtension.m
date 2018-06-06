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

+ (instancetype)cp_tableViewBundle {
    static NSBundle *tableViewBundle = nil;
    if (tableViewBundle == nil) {
        tableViewBundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[CPTableViewCell class]] pathForResource:@"CPTableView" ofType:@"bundle"]];
    }
    return tableViewBundle;
}

+ (UIImage *)cp_arrowImage {
    static UIImage *arrowImage = nil;
    if (arrowImage == nil) {
         arrowImage = [[UIImage imageWithContentsOfFile:[[self cp_tableViewBundle] pathForResource:@"RightArrowGray@2x" ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
    return arrowImage;
}

+ (UIImage *)cp_checkmarkImage {
    static UIImage *checkmarkImage = nil;
    if (checkmarkImage == nil) {
        checkmarkImage = [[UIImage imageWithContentsOfFile:[[self cp_tableViewBundle] pathForResource:@"RightCheckMark@2x" ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
    return checkmarkImage;
}

@end
