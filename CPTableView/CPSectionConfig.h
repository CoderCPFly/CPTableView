//
//  CPSectionConfig.h
//  CPCommonTableView
//
//  Created by 陈鹏 on 2018/6/1.
//  Copyright © 2018年 陈鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UILabel+CPExtension.h"
#import "CPCellModel.h"

/** section 头部视图 自定义view */
typedef UIView *(^sectionHeaderViewBlock)(void);
/** section 尾部视图 自定义view */
typedef UIView *(^sectionFooterViewBlock)(void);

@interface CPSectionConfig : NSObject

// header
/** section头部标题 */
@property (nonatomic, copy) NSString *headerTitle;
/** section头部富文本标题 */
@property (nonatomic, copy) NSMutableAttributedString *headerAttrTitle;
/** section头部视图 字体大小 */
@property (nonatomic, strong) UIFont *sectionHeaderTitleFont;
/** section头部标题高度 */
@property (nonatomic, assign) CGFloat headerTitleHeight;
/** section没有文字 头部视图高度 */
@property (nonatomic, assign) CGFloat heightForHeaderInSection;
/** section头部视图 文字 顶部间距 */
@property (nonatomic, assign) CGFloat topMarginForHeaderTextInSection;
/** section头部视图 文字 尾间距 */
@property (nonatomic, assign) CGFloat bottomMarginForHeaderTextInSection;
/** section 头部视图 自定义view */
@property (nonatomic, copy) sectionHeaderViewBlock headerViewBlock;

// footer
/** section尾部标题 */
@property (nonatomic, copy) NSString *footerTitle;
/** section尾部富文本标题 */
@property (nonatomic, copy) NSMutableAttributedString *footerAttrTitle;
/** section尾部视图 字体大小 */
@property (nonatomic, strong) UIFont *sectionFooterTitleFont;
/** section尾部标题高度 */
@property (nonatomic, assign) CGFloat footerTitleHeight;
/** section没有文字 尾部视图高度 */
@property (nonatomic, assign) CGFloat heightForFooterInSection;
/** section尾部视图 文字 顶部间距 */
@property (nonatomic, assign) CGFloat topMarginForFooterTextInSection;
/** section尾部视图 文字 尾间距 */
@property (nonatomic, assign) CGFloat bottomMarginForFooterTextInSection;
/** section 尾部视图 自定义view */
@property (nonatomic, copy) sectionFooterViewBlock footerViewBlock;

/** 通用模型数组 */
@property (nonatomic, strong) NSMutableArray<CPCellModel *> *commonModelArr;

/** 头部视图 文字点击Range和回调block的字典数组 */
@property (nonatomic, strong) NSMutableArray *headerTitleActionArr;
/** 尾部视图 文字点击Range和点击回调block的字典数组 */
@property (nonatomic, strong) NSMutableArray *footerTitleActionArr;


/**
 设置头部视图和尾部视图中文字的点击事件
 
 @param clickRange 文字点击的Range
 @param header 是否是头部视图
 @param clickAction 点击事件回调的block
 */
- (void)setTextClickRange:(NSRange)clickRange header:(BOOL)header clickAction:(CPTexAction)clickAction ;

/**
 section初始化
 
 @param commonModerArr 通用模型数组
 @return section对象
 */
- (instancetype)initWithCommonModels:(NSArray<CPCellModel *> *)commonModerArr;

@end
