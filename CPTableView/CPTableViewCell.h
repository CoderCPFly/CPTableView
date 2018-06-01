//
//  CPTableViewCell.h
//  CPCommonTableView
//
//  Created by 陈鹏 on 2018/6/1.
//  Copyright © 2018年 陈鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPCellModel.h"

@interface CPTableViewCell : UITableViewCell

/** 数据模型 */
@property (nonatomic, strong) CPCellModel *cellModel;
/** 子标题 */
@property (nonatomic, strong) UILabel *subTitleLabel;
/** 附件标题 */
@property (nonatomic, strong) UILabel *accessoryLabel;
/** 附件图标 */
@property (nonatomic, strong) UIImageView *accessoryImageView;
/** 标题处于cell中间 */
@property (nonatomic, strong) UILabel *centerTitleLabel;
/** 附件开关 */
@property (nonatomic, strong) UISwitch *accessorySwitch;
/** 附件箭头 */
@property (nonatomic, strong) UIImageView *accessoryArrow;
/* 附件钩钩 */
@property (nonatomic, strong) UIImageView *accessoryCheckmark;
/* 分隔符显示类型 */
@property (nonatomic, assign) int separatorType;

/**
 cell初始化
 @param tableView cell所在的tableView
 @param cellType cell的类型
 @return cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView cellType:(CPCellType)cellType;

@end
