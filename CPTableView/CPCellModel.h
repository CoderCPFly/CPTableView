//
//  CPCellModel.h
//  CPCommonTableView
//
//  Created by 陈鹏 on 2018/6/1.
//  Copyright © 2018年 陈鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPSignleConfig.h"

typedef enum {
    /** 标题处于中间处 */
    CPCellTypeTitleCenter = 0,
    /** 附件为空 */
    CPCellTypeAccessoryNone,
    /** 附件为开关 */
    CPCellTypeAccessorySwitch,
    /** 附件为箭头 */
    CPCellTypeAccessoryArrow,
    /** 附件为钩钩 */
    CPCellTypeAccessoryCheckmark,
}CPCellType;

/** switch开关状态改变的block */
typedef void (^CPSwitchChangeBlock)(BOOL isON);

/** model所在cell 被点击时 调用的block */
typedef void (^CPModelClickBlock)(void);

@interface CPCellModel : NSObject

/** 图片 */
@property (nonatomic, copy) NSString *icon;
/** 标题 */
@property (nonatomic, copy) NSString *title;
/** 富文本属性的标题 */
@property (nonatomic, copy) NSAttributedString *attrTitle;
/** 子标题 */
@property (nonatomic, copy) NSString *subtitle;
/** 附件图片 */
@property (nonatomic, copy) NSString *accessoryIcon;
/** 附件标题 */
@property (nonatomic, copy) NSString *accessoryTitle;
/** 中间标题 */
@property (nonatomic, copy) NSString *centerTitle;

/**  model所在cell的高度 默认为0 cell高度采用  CPTableView的rowHeight */
@property (nonatomic, assign) CGFloat cellRowHeight;

/** model所在cell的类型 */
@property (nonatomic, assign) CPCellType cellType;
/** cell中子控件样式配置对象 */
@property (nonatomic, strong) CPSignleConfig *signleConfig;

/** model所在cell 被点击时 调用的block */
@property (nonatomic, copy) CPModelClickBlock modelClickBlock;
/** 跳转 目标控制器的class */
@property (nonatomic, assign) Class destinationVcClass;
/** 是否是modal或者push 控制器 */
@property (nonatomic, assign, getter=isModalVc) BOOL modalVc;
/** 是否是modal 导航控制器的class */
@property (nonatomic, assign, getter=isModalNav) BOOL modalNav;

/** 开关切换时调用的block */
@property (nonatomic, copy) CPSwitchChangeBlock switchChangeBlock;
/** 保存到用户偏好设置里 开关状态 的key */
@property (nonatomic, copy) NSString *key;

/** 是否显示附件钩钩 */
@property (nonatomic, assign, getter=isShowCharkMark) BOOL showCharkMark;


@end
