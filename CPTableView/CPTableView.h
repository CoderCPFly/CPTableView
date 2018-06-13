//
//  CPTableView.h
//  CPCommonTableView
//
//  Created by 陈鹏 on 2018/6/1.
//  Copyright © 2018年 陈鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CPSectionConfig;
@class CPCellModel;

typedef NS_ENUM(NSInteger, CPTableViewCellSeparatorStyle) {
    /** 没有分割线  */
    CPTableViewCellSeparatorStyleNone = 0,
    /** 分割线填充整个屏幕 */
    CPTableViewCellSeparatorStyleSingleLineWhole,
    /** 分割线对其图片 */
    CPTableViewCellSeparatorStyleSingleLineAlignImage,
    /** 分割线对其文字 */
    CPTableViewCellSeparatorStyleSingleLineAlignText,
    /** 分割线填充整个屏幕 seticon 没有顶部和底部分割线 */
    CPTableViewCellSeparatorStyleSingleLineWholeWithNoneTopBottom,
    /** 分割线对其图片 seticon 没有顶部和底部分割线 */
    CPTableViewCellSeparatorStyleSingleLineAlignImageWithNoneTopBottom,
    /** 分割线对其文字 seticon 没有顶部和底部分割线 */
    CPTableViewCellSeparatorStyleSingleLineAlignTextWithNoneTopBottom,
};

/** cell 选中调用的block */
typedef void (^CPDidSelectRowBlock)(NSIndexPath *, CPSectionConfig *);
/** cell 删除调用的block */
typedef void (^CPDidDeleteRowBlock)(NSIndexPath *, CPCellModel *);

@interface CPTableView : UITableView <UITableViewDataSource, UITableViewDelegate>
/** cell 选中调用的block */
@property (nonatomic, copy) CPDidSelectRowBlock didSelectRowBlock;
/** cell 删除调用的block */
@property (nonatomic, copy) CPDidDeleteRowBlock didDeleteRowBlock;
/** cell分隔符样式 */
@property (nonatomic, assign) CPTableViewCellSeparatorStyle separatorType;
/** cell高度 */
@property (nonatomic, assign) CGFloat cellRowHeight;
/** cell 删除时显示的字符串 */
@property (nonatomic, copy) NSString *deleteStr;;


/**
 CPCommonTableView初始化
 
 @param dataArr 模型数组
 @param target tableView所在的控制器
 @return CPCommonTableView
 */
+ (instancetype)tableViewWithDataArr:(NSArray<CPSectionConfig *> *)dataArr target:(UIViewController *)target;

/**
 CPCommonTableView初始化
 
 @param dataArr 模型数组
 @param target tableView所在的控制器
 @return CPCommonTableView
 */
- (instancetype)initWithTableViewWithDataArr:(NSArray<CPSectionConfig *> *)dataArr target:(UIViewController *)target;

@end
