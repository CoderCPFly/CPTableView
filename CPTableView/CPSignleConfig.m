//
//  CPSignleConfig.m
//  CPCommonTableView
//
//  Created by 陈鹏 on 2018/6/1.
//  Copyright © 2018年 陈鹏. All rights reserved.
//

#import "CPSignleConfig.h"
#import "CPConst.h"
#import "CPGlobalConfig.h"

@implementation CPSignleConfig

- (instancetype)init {
    if (self = [super init]) {
        CPGlobalConfig *config = [CPGlobalConfig sharedInstance];
        
        self.cellHeight = config.cellHeight;
        self.leftMargin = config.leftMargin;
        self.rightMargin = config.rightMargin;
        // 左边
        self.titleColor = config.titleColor;
        self.titleFont = config.titleFont;
        self.iconImageSize = config.iconImageSize;
        self.iconAndTitleSpaceBetween = config.iconAndTitleSpaceBetween;
        self.subTitleColor = config.subTitleColor;
        self.subTitleFont = config.subTitleFont;
        self.titleAndSubTitleSpaceBetween = config.titleAndSubTitleSpaceBetween;
        
        // 右边
        self.accessoryViewSize = config.accessoryViewSize;
        self.accessoryTitleColor = config.accessoryTitleColor;
        self.accessoryTitleFont = config.accessoryTitleFont;
        self.accessoryIconImageSize = config.accessoryIconImageSize;
        self.accessoryViewAndIconTitleSpaceBetween = config.accessoryViewAndIconTitleSpaceBetween;
        self.accessoryIconAndTitleSpaceBetween = config.accessoryIconAndTitleSpaceBetween;
        self.accessoryArrowColor = config.accessoryArrowColor;
        self.accessoryCheckmarkColor = config.accessoryCheckmarkColor;
        self.accessorySwitchOnTintColor = config.accessorySwitchOnTintColor;
        self.accessorySwitchTintColor = config.accessorySwitchTintColor;
        self.accessorySwitchThumbTintColor = config.accessorySwitchThumbTintColor;
        
        // 中间
        self.centerTitleFont = config.centerTitleFont;
        self.centerTitleColor = config.centerTitleColor;
    }
    return self;
}
@end
