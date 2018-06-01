//
//  CPGlobalConfig.m
//  CPCommonTableView
//
//  Created by 陈鹏 on 2018/6/1.
//  Copyright © 2018年 陈鹏. All rights reserved.
//

#import "CPGlobalConfig.h"
#import "CPConst.h"

@implementation CPGlobalConfig

+ (instancetype)sharedInstance{
    static CPGlobalConfig *instance = nil;
    static dispatch_once_t disonce;
    dispatch_once(&disonce, ^{
        instance = [[self alloc] init];
        [instance initConfig];
    });
    return instance;
}

- (void)initConfig {
    self.iconAndTitleSpaceBetween = 10;
    self.leftMargin = 15;
    self.rightMargin = 15;
    self.accessoryViewAndIconTitleSpaceBetween = 5;
    self.accessoryIconAndTitleSpaceBetween = 5;
    self.iconImageSize = CGSizeMake(25, 25);
    self.accessoryIconImageSize = CGSizeMake(15, 15);
    self.accessoryViewSize = CGSizeMake(13 * 0.5, 21 * 0.5);
    self.cellHeight = 44;
    self.titleAndSubTitleSpaceBetween = 2;
    
    self.titleFont = [UIFont systemFontOfSize:15];
    self.centerTitleFont = [UIFont systemFontOfSize:16];
    self.accessoryTitleFont = [UIFont systemFontOfSize:14];
    self.subTitleFont = [UIFont systemFontOfSize:14];
    
    self.separatorColor = CPColorWithRGB(251,251,251,0.5);
    self.titleColor = [UIColor blackColor];
    self.subTitleColor = [UIColor lightGrayColor];
    self.centerTitleColor = [UIColor blackColor];
    self.accessoryTitleColor = [UIColor grayColor];
    self.accessoryArrowColor =  CPColorWithRGB(187,187,193,1);
    self.accessoryCheckmarkColor = CPColorWithRGB(21,100,250,1);
    
    UISwitch *configSwitch = [[UISwitch alloc] init];
    self.accessorySwitchTintColor = configSwitch.onTintColor;
    self.accessorySwitchTintColor = configSwitch.tintColor;
    self.accessorySwitchThumbTintColor = configSwitch.thumbTintColor;
    
    self.sectionHeaderTitleFont = [UIFont systemFontOfSize:13];
    self.sectionFooterTitleFont = [UIFont systemFontOfSize:16];
    self.heightForHeaderInSection = 10;
    self.heightForFooterInSection = 10;
    self.topMarginForHeaderTextInSection = 5;
    self.topMarginForFooterTextInSection = 5;
    self.bottomMarginForHeaderTextInSection = 5;
    self.bottomMarginForFooterTextInSection = 5;
}

@end
