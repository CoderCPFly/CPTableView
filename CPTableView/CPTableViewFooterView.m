//
//  CPTableViewFooterView.m
//  CPCommonTableView
//
//  Created by 陈鹏 on 2018/6/1.
//  Copyright © 2018年 陈鹏. All rights reserved.
//

#import "CPTableViewFooterView.h"
#import "CPSectionConfig.h"
#import "UIView+CPExtension.h"

@implementation CPTableViewFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.textLabel.numberOfLines = 0;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.textLabel.font = self.sectionConfig.sectionFooterTitleFont;
    self.textLabel.y = self.sectionConfig.topMarginForFooterTextInSection;
}

@end
