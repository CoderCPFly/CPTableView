//
//  CPGlobalConfig.h
//  CPCommonTableView
//
//  Created by 陈鹏 on 2018/6/1.
//  Copyright © 2018年 陈鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPGlobalConfig : NSObject

+ (instancetype)sharedInstance;

/** 图片和标题间距  */
@property (nonatomic, assign) CGFloat iconAndTitleSpaceBetween;
/** 左侧边距 */
@property (nonatomic, assign) CGFloat leftMargin;
/** 右侧边距 */
@property (nonatomic, assign) CGFloat rightMargin;
/** 附件和右侧图片或者标题间距 */
@property (nonatomic, assign) CGFloat accessoryViewAndIconTitleSpaceBetween;
/** 附件图片和附件文字间距 */
@property (nonatomic, assign) CGFloat accessoryIconAndTitleSpaceBetween;
/** 图片大小 */
@property (nonatomic, assign) CGSize iconImageSize;
/** 附件图片大小 */
@property (nonatomic, assign) CGSize accessoryIconImageSize;
/** 附件大小 */
@property (nonatomic, assign) CGSize accessoryViewSize;
/** cell高度 */
@property (nonatomic, assign) CGFloat cellHeight;
/** 标题和子标题间距  */
@property (nonatomic, assign) CGFloat titleAndSubTitleSpaceBetween;


/** 标题字体大小  */
@property (nonatomic, strong) UIFont *titleFont;
/** 子标题字体大小  */
@property (nonatomic, strong) UIFont *subTitleFont;
/** 中间标题字体大小  */
@property (nonatomic, strong) UIFont *centerTitleFont;
/** 附件标题大小  */
@property (nonatomic, strong) UIFont *accessoryTitleFont;

/** 分隔符颜色  */
@property (nonatomic, strong) UIColor *separatorColor;
/** 标题颜色  */
@property (nonatomic, strong) UIColor *titleColor;
/** 子标题颜色  */
@property (nonatomic, strong) UIColor *subTitleColor;
/** 中间标题颜色  */
@property (nonatomic, strong) UIColor *centerTitleColor;


/** 附件标题颜色  */
@property (nonatomic, strong) UIColor *accessoryTitleColor;
/** 附件箭头颜色  */
@property (nonatomic, strong) UIColor *accessoryArrowColor;
/** 附件钩钩颜色  */
@property (nonatomic, strong) UIColor *accessoryCheckmarkColor;
/** 附件开关 onTintColor  */
@property (nonatomic, strong) UIColor *accessorySwitchOnTintColor;
/** 附件开关 tintColor  */
@property (nonatomic, strong) UIColor *accessorySwitchTintColor;
/** 附件开关 humbTintColor  */
@property (nonatomic, strong) UIColor *accessorySwitchThumbTintColor;

/** 附件箭头图片名称 */
@property (nonatomic, copy) NSString *accessoryArrow;
/** 附件钩钩图片名称 */
@property (nonatomic, copy) NSString *accessoryCheckmark;


// header
/** section头部视图 字体大小 */
@property (nonatomic, strong) UIFont *sectionHeaderTitleFont;
/** section没有文字 头部视图高度 */
@property (nonatomic, assign) CGFloat heightForHeaderInSection;
/** section头部视图 文字 顶部间距 */
@property (nonatomic, assign) CGFloat topMarginForHeaderTextInSection;
/** section头部视图 文字 尾间距 */
@property (nonatomic, assign) CGFloat bottomMarginForHeaderTextInSection;


// footer
/** section尾部视图 字体大小 */
@property (nonatomic, strong) UIFont *sectionFooterTitleFont;
/** section没有文字 尾部视图高度 */
@property (nonatomic, assign) CGFloat heightForFooterInSection;
/** section尾部视图 文字 顶部间距 */
@property (nonatomic, assign) CGFloat topMarginForFooterTextInSection;
/** section尾部视图 文字 尾间距 */
@property (nonatomic, assign) CGFloat bottomMarginForFooterTextInSection;
@end
