//
//  CPSectionConfig.m
//  CPCommonTableView
//
//  Created by 陈鹏 on 2018/6/1.
//  Copyright © 2018年 陈鹏. All rights reserved.
//

#import "CPSectionConfig.h"
#import "CPConst.h"
#import "CPGlobalConfig.h"
#import "NSString+CPExtension.h"

@implementation CPSectionConfig

- (instancetype)initWithCommonModels:(NSArray<CPCellModel *> *)commonModerArr {
    if (self = [super init]) {
        self.commonModelArr = [commonModerArr mutableCopy];
        self.sectionHeaderTitleFont = [CPGlobalConfig sharedInstance].sectionHeaderTitleFont;
        self.sectionFooterTitleFont = [CPGlobalConfig sharedInstance].sectionFooterTitleFont;
        self.heightForHeaderInSection = [CPGlobalConfig sharedInstance].heightForHeaderInSection;
        self.heightForFooterInSection = [CPGlobalConfig sharedInstance].heightForFooterInSection;
        self.topMarginForHeaderTextInSection = [CPGlobalConfig sharedInstance].topMarginForHeaderTextInSection;
        self.topMarginForFooterTextInSection = [CPGlobalConfig sharedInstance].topMarginForFooterTextInSection;
        self.bottomMarginForHeaderTextInSection = [CPGlobalConfig sharedInstance].bottomMarginForHeaderTextInSection;
        self.bottomMarginForFooterTextInSection = [CPGlobalConfig sharedInstance].bottomMarginForFooterTextInSection;
    }
    return self;
}

- (NSMutableArray *)headerTitleActionArr {
    if (!_headerTitleActionArr) {
        _headerTitleActionArr = [NSMutableArray array];
    }
    return _headerTitleActionArr;
}

- (NSMutableArray *)footerTitleActionArr {
    if (!_footerTitleActionArr) {
        _footerTitleActionArr = [NSMutableArray array];
    }
    return _footerTitleActionArr;
}

- (void)setTextClickRange:(NSRange)clickRange header:(BOOL)header clickAction:(CPTexAction)clickAction {
    NSDictionary *dic = @{@"clickRange" : [NSValue valueWithRange:clickRange], @"clickAction" : clickAction};
    if (header) {
        [self.headerTitleActionArr addObject:dic];
    }else {
        [self.footerTitleActionArr addObject:dic];
    }
}

- (void)setHeaderTitle:(NSString *)headerTitle {
    _headerTitle = headerTitle;
    [self setupTitleHeight:_headerTitle header:YES];
}

- (void)setHeaderAttrTitle:(NSMutableAttributedString *)headerAttrTitle {
    _headerAttrTitle = headerAttrTitle;
    [self setupTitleHeight:_headerAttrTitle.string header:YES];
}

- (void)setFooterTitle:(NSString *)footerTitle {
    _footerTitle = footerTitle;
    [self setupTitleHeight:_footerTitle header:NO];
}

- (void)setFooterAttrTitle:(NSMutableAttributedString *)footerAttrTitle {
    _footerAttrTitle = footerAttrTitle;
    [self setupTitleHeight:_footerAttrTitle.string header:NO];
}

- (void)setSectionHeaderTitleFont:(UIFont *)sectionHeaderTitleFont {
    _sectionHeaderTitleFont = sectionHeaderTitleFont;
    if (_headerTitle || _headerAttrTitle) {
        NSString *headerTitle = _headerTitle ? _headerTitle : _headerAttrTitle.string;
        [self setupTitleHeight:headerTitle header:YES];
    }
}

- (void)setSectionFooterTitleFont:(UIFont *)sectionFooterTitleFont {
    _sectionFooterTitleFont = sectionFooterTitleFont;
    if (_footerTitle || _footerAttrTitle) {
        NSString *footerTitle = _footerTitle ? _footerTitle : _footerAttrTitle.string;
        [self setupTitleHeight:footerTitle header:NO];
    }
}

- (void)setupTitleHeight:(NSString *)title header:(BOOL)header {
    CGSize size = CGSizeMake(CPScreenWidth - [CPGlobalConfig sharedInstance].leftMargin - [CPGlobalConfig sharedInstance].rightMargin, MAXFLOAT);
    if (header) {
        self.headerTitleHeight = [title sizeForFont:self.sectionHeaderTitleFont size:size mode:NSLineBreakByWordWrapping].height;
    }else {
        self.footerTitleHeight = [title sizeForFont:self.sectionFooterTitleFont size:size mode:NSLineBreakByWordWrapping].height;
    }
}

@end
