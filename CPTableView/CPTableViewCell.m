//
//  CPTableViewCell.m
//  CPCommonTableView
//
//  Created by 陈鹏 on 2018/6/1.
//  Copyright © 2018年 陈鹏. All rights reserved.
//

#import "CPTableViewCell.h"
#import "UIView+CPExtension.h"
#import "NSBundle+CPExtension.h"
#import "CPConst.h"
#import "CPGlobalConfig.h"
#import "CPSignleConfig.h"

#define CPTitleCenterCellId @"CPTitleCenterCellId"
#define CPAccessoryCellId @"CPAccessoryCellId"

@implementation CPTableViewCell

#pragma mark - 初始化
+ (instancetype)cellWithTableView:(UITableView *)tableView cellType:(CPCellType)cellType
{
    static NSString *cellId = nil;
    if (cellType == CPCellTypeTitleCenter) {
        cellId = CPTitleCenterCellId;
    }else {
        cellId = CPAccessoryCellId;
    }
    CPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[CPTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return  cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.separatorType = 2;
        //        self.contentView.backgroundColor = CPRandomColor;
        [self setupUI];
    }
    return self;
}


/**
 子控件初始化
 */
- (void)setupUI {
    [self.contentView addSubview:self.subTitleLabel];
    [self.contentView addSubview:self.accessoryLabel];
    [self.contentView addSubview:self.accessoryImageView];
}

- (void)setCellModel:(CPCellModel *)cellModel {
    _cellModel = cellModel;
    switch (_cellModel.cellType) {
        case 0:
            [self setupCenterTitle];
            break;
        case 1:
            self.accessoryView = nil;
            break;
        case 2:
            self.accessoryView = self.accessorySwitch;
            if (_cellModel.key) {
                self.accessorySwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:_cellModel.key];
            }
            break;
        case 3:
            [self.accessoryArrow sizeToFit];
            [self setupAccessoryView:self.accessoryArrow];
            break;
        case 4:
            [self.accessoryCheckmark sizeToFit];
            [self setupAccessoryView:self.accessoryCheckmark];
            break;
        default:
            break;
    }
    if (_cellModel.cellType != CPCellTypeTitleCenter) {
        [self setupSubView];
    }
}


/**
 设置子控件
 */
- (void)setupSubView {
    if (_cellModel.attrTitle) {
        self.textLabel.attributedText = _cellModel.attrTitle;
    }else {
        self.textLabel.text = _cellModel.title;
    }
    self.imageView.image = _cellModel.icon.length > 0 ? [UIImage imageNamed:_cellModel.icon] : nil;
    self.imageView.hidden = _cellModel.icon.length > 0 ? NO : YES;
    self.subTitleLabel.text = _cellModel.subtitle;
    self.accessoryLabel.text = _cellModel.accessoryTitle;
    self.accessoryLabel.hidden = _cellModel.accessoryTitle.length > 0 ? NO : YES;
    self.accessoryImageView.image = _cellModel.accessoryIcon.length ? [UIImage imageNamed:_cellModel.accessoryIcon] : nil;
    self.accessoryImageView.hidden = _cellModel.accessoryIcon.length > 0 ? NO : YES;
}

/**
 设置子中间标题
 */
- (void)setupCenterTitle{
    [self.contentView addSubview:self.centerTitleLabel];
    self.centerTitleLabel.text = self.cellModel.centerTitle;
    self.centerTitleLabel.font = self.cellModel.signleConfig.centerTitleFont;
    self.centerTitleLabel.textColor = self.cellModel.signleConfig.centerTitleColor;
    self.centerTitleLabel.width = self.contentView.width;
    self.centerTitleLabel.height = self.contentView.height;
    self.centerTitleLabel.centerY = self.contentView.centerY;
    self.centerTitleLabel.x = (CPScreenWidth - self.centerTitleLabel.width) * 0.5;
};
/**
 设置附件样式
 */
- (void)setupAccessoryView:(UIView *)accessoryView {
    if (_cellModel.cellType == CPCellTypeAccessoryCheckmark) {
        accessoryView.hidden = !_cellModel.showCharkMark;
    }else {
        accessoryView.hidden = NO;
    }
    self.accessoryView = accessoryView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (_cellModel.cellType != CPCellTypeTitleCenter) {
        [self layoutTextAndImageView];
        [self layoutAccessoryTitleAndImageView];
    }
    self.accessoryView.x  = CPScreenWidth - self.accessoryView.width - self.cellModel.signleConfig.rightMargin;
    // 设置分隔符样式
    int extra = 0;
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[NSClassFromString(@"_UITableViewCellSeparatorView") class]] && view) {
            extra ++;
            view.hidden = NO;
            if (self.separatorType == 0 || ((self.separatorType == 4 || self.separatorType == 5  || self.separatorType == 6) && view.y == 0)) {
                view.hidden = YES;
            }else if (self.separatorType == 1 || self.separatorType == 4 || view.y == 0) {
                view.x = 0;
            }else if (self.separatorType == 2 || self.separatorType == 5) {
                view.x = self.cellModel.icon ? self.imageView.x : self.textLabel.x;
            }else if (self.separatorType == 3 || self.separatorType == 6) {
                view.x = self.textLabel.x;
            }
            view.width = CPScreenWidth - view.x;
        }
        if (extra == 2) break;
    }
}

/**
 布局标题和图片
 */
- (void)layoutTextAndImageView {
    CPSignleConfig *signleConfig = self.cellModel.signleConfig;
    if (self.cellModel.icon.length > 0) {
        if (!signleConfig.isTitleFront) {
            self.imageView.x = signleConfig.leftMargin;
            self.textLabel.x = CGRectGetMaxX(self.imageView.frame) + signleConfig.iconAndTitleSpaceBetween;
        }else {
            CGFloat textLabelH = self.textLabel.height;
            [self.textLabel sizeToFit];
            self.textLabel.height = textLabelH;
            self.textLabel.x = signleConfig.leftMargin;
            [self.imageView sizeToFit];
            self.imageView.x = CGRectGetMaxX(self.textLabel.frame) + signleConfig.iconAndTitleSpaceBetween;
        }
    }else {
        self.textLabel.x = signleConfig.leftMargin;
    }
    if (self.cellModel.subtitle) {
        [self.textLabel sizeToFit];
        [self.subTitleLabel sizeToFit];
        self.textLabel.y = (self.contentView.height - self.textLabel.height - self.subTitleLabel.height - signleConfig.titleAndSubTitleSpaceBetween) * 0.5;
        self.subTitleLabel.y = CGRectGetMaxY(self.textLabel.frame) + signleConfig.titleAndSubTitleSpaceBetween;
        self.subTitleLabel.x = self.textLabel.x;
    }
}


/**
 布局附件标题和图片
 */
- (void)layoutAccessoryTitleAndImageView {
    if (self.cellModel.cellType == CPCellTypeAccessorySwitch) return;
    if (self.cellModel.accessoryIcon.length == 0 && self.cellModel.accessoryTitle.length == 0) return;
    
    CPSignleConfig *signleConfig = self.cellModel.signleConfig;
    CGFloat extraWidth = 0;
    if (self.cellModel.cellType != CPCellTypeAccessoryNone) {
        extraWidth = self.accessoryView.width + signleConfig.accessoryViewAndIconTitleSpaceBetween;
    }
    
    if (self.cellModel.accessoryIcon.length > 0 && self.cellModel.accessoryTitle.length > 0) {
        [self.accessoryLabel sizeToFit];
        self.accessoryImageView.size = signleConfig.accessoryIconImageSize;
        self.accessoryImageView.centerY  = self.contentView.centerY;
        self.accessoryLabel.centerY = self.contentView.centerY;
        if (!signleConfig.isTitleFront) {
            self.accessoryLabel.x = CPScreenWidth - extraWidth - signleConfig.rightMargin - self.accessoryLabel.width;
            self.accessoryImageView.x = self.accessoryLabel.x - signleConfig.accessoryIconAndTitleSpaceBetween - self.accessoryImageView.width;
        }else {
            self.accessoryImageView.x = CPScreenWidth - extraWidth - signleConfig.rightMargin - self.accessoryImageView.width;
            self.accessoryLabel.x = self.accessoryImageView.x - signleConfig.accessoryIconAndTitleSpaceBetween - self.accessoryLabel.width;
        }
    }else if (self.cellModel.accessoryIcon.length > 0) {
        self.accessoryImageView.centerY  = self.contentView.centerY;
        self.accessoryImageView.size = signleConfig.accessoryIconImageSize;
        self.accessoryImageView.x = CPScreenWidth - extraWidth - signleConfig.rightMargin - self.accessoryImageView.width;
    }else if (self.cellModel.accessoryTitle.length > 0) {
        [self.accessoryLabel sizeToFit];
        self.accessoryLabel.centerY = self.contentView.centerY;
        self.accessoryLabel.x = CPScreenWidth - extraWidth - signleConfig.rightMargin - self.accessoryLabel.width;
    }
}


#pragma mark - 懒加载
- (UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] init];
        _subTitleLabel.font = [UIFont systemFontOfSize:14];
        _subTitleLabel.textColor = [UIColor lightGrayColor];
    }
    return _subTitleLabel;
}

- (UIImageView *)accessoryImageView {
    if (!_accessoryImageView) {
        _accessoryImageView = [[UIImageView alloc] init];
    }
    return _accessoryImageView;
}

- (UILabel *)accessoryLabel {
    if (!_accessoryLabel) {
        _accessoryLabel = [[UILabel alloc] init];
        _accessoryLabel.font = [CPGlobalConfig sharedInstance].accessoryTitleFont;
        _accessoryLabel.textColor = [CPGlobalConfig sharedInstance].accessoryTitleColor;
    }
    return _accessoryLabel;
}

- (UIImageView *)accessoryArrow {
    if (!_accessoryArrow) {
        _accessoryArrow = [[UIImageView alloc] init];
        UIImage *img = [[UIImage imageNamed:@"RightArrowGray"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        _accessoryArrow.image = img;
        _accessoryArrow.tintColor = [CPGlobalConfig sharedInstance].accessoryArrowColor;
    }
    return _accessoryArrow;
}

- (UISwitch *)accessorySwitch {
    if (!_accessorySwitch) {
        _accessorySwitch = [[UISwitch alloc] init];
        _accessorySwitch.onTintColor = [CPGlobalConfig sharedInstance].accessorySwitchOnTintColor;
        _accessorySwitch.tintColor = [CPGlobalConfig sharedInstance].accessorySwitchTintColor;
        _accessorySwitch.thumbTintColor = [CPGlobalConfig sharedInstance].accessorySwitchThumbTintColor;
        // 添加状态监听
        [_accessorySwitch addTarget:self action:@selector(switchChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _accessorySwitch;
}

- (UIImageView *)accessoryCheckmark {
    if (!_accessoryCheckmark) {
        _accessoryCheckmark = [[UIImageView alloc] init];
        UIImage *img = [[UIImage imageNamed:@"RightCheckMark"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        _accessoryCheckmark.image = img;
        _accessoryCheckmark.hidden = YES;
        _accessoryCheckmark.tintColor = [CPGlobalConfig sharedInstance].accessoryCheckmarkColor;;
    }
    return _accessoryCheckmark;
}


- (UILabel *)centerTitleLabel {
    if (!_centerTitleLabel) {
        _centerTitleLabel = [[UILabel alloc] init];
        _centerTitleLabel.textAlignment = NSTextAlignmentCenter;
        _centerTitleLabel.font = [CPGlobalConfig sharedInstance].centerTitleFont;;
        _centerTitleLabel.textColor = [CPGlobalConfig sharedInstance].centerTitleColor;
    }
    return _centerTitleLabel;
}

#pragma mark - 开关触发事件
- (void)switchChange:(UISwitch *)accessorySwitch {
    // 1.开关事件block传递
    if (self.cellModel.cellType == CPCellTypeAccessorySwitch) {
        if (self.cellModel.switchChangeBlock) {
            self.cellModel.switchChangeBlock(accessorySwitch.isOn);
        }
    }
    
    // 2.开关状态保存到偏好设置
    if (self.cellModel.key) {
        [[NSUserDefaults standardUserDefaults] setBool:accessorySwitch.isOn forKey:self.cellModel.key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

@end
