//
//  CPSignleConfig.h
//  CPCommonTableView
//
//  Created by 陈鹏 on 2018/6/1.
//  Copyright © 2018年 陈鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPSignleConfig : NSObject

/** cell高度 */
@property (nonatomic, assign) CGFloat cellHeight;
/** 左侧边距 */
@property (nonatomic, assign) CGFloat leftMargin;
/** 右侧边距 */
@property (nonatomic, assign) CGFloat rightMargin;

// 左边部分
/** 标题颜色 */
@property (nonatomic, strong) UIColor *titleColor;
/** 标题字体大小 */
@property (nonatomic, strong) UIFont *titleFont;
/** 图片大小 */
@property (nonatomic, assign) CGSize iconImageSize;
/** 图片和标题间距  */
@property (nonatomic, assign) CGFloat iconAndTitleSpaceBetween;
/** 图片或者标题在前面 默认是图片在前面 NO */
@property (nonatomic, assign, getter=isTitleFront) BOOL titleFront;

/** 子标题颜色 */
@property (nonatomic, strong) UIColor *subTitleColor;
/** 子标题字体大小 */
@property (nonatomic, strong) UIFont *subTitleFont;
/** 标题和子标题间距  */
@property (nonatomic, assign) CGFloat titleAndSubTitleSpaceBetween;

// 右边部分
/** 附件view大小 */
@property (nonatomic, assign) CGSize accessoryViewSize;
/** 附件标题颜色 */
@property (nonatomic, strong) UIColor *accessoryTitleColor;
/** 附件标题字体大小 */
@property (nonatomic, strong) UIFont *accessoryTitleFont;
/** 附件图片大小 */
@property (nonatomic, assign) CGSize accessoryIconImageSize;
/** 附件和右侧图片或者标题间距 */
@property (nonatomic, assign) CGFloat accessoryViewAndIconTitleSpaceBetween;
/** 附件图片和附件文字间距 */
@property (nonatomic, assign) CGFloat accessoryIconAndTitleSpaceBetween;
/**  附件图片或者附件文字在前面 默认是附件图片在前面 NO */
@property (nonatomic, assign, getter=isAccessoryTitleFront) BOOL accessoryTitleFront;
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

// 中间
/** 中间标题颜色 */
@property (nonatomic, strong) UIColor *centerTitleColor;
/** 中间标题字体大小 */
@property (nonatomic, strong) UIFont *centerTitleFont;
/** 中间标题背景颜色 */
@property (nonatomic, strong) UIColor *centerTitleBackgroundColor;
/** 中间标题圆角 */
@property (nonatomic, assign) CGFloat centerTitleCornerRadius;
/** 中间标题size */
@property (nonatomic, assign) CGSize centerTitleSize;

@end
