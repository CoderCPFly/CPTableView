

//
//  CPTableView.m
//  CPCommonTableView
//
//  Created by 陈鹏 on 2018/6/1.
//  Copyright © 2018年 陈鹏. All rights reserved.
//

#import "CPTableView.h"
#import "CPConst.h"
#import "CPSectionConfig.h"
#import "CPTableViewHeaderView.h"
#import "CPTableViewFooterView.h"
#import "CPTableViewCell.h"

@interface CPTableView ()

@property (nonatomic, strong) NSArray<CPSectionConfig *> *dataArr;
@property (nonatomic, weak) UIViewController *target;

@end

@implementation CPTableView

static NSString * const HeaderViewCellID = @"CPCommonHeaderViewCellID";
static NSString * const FooterViewCellID = @"CPCommonFooterViewCellID";

+ (instancetype)tableViewWithDataArr:(NSArray<CPSectionConfig *> *)dataArr target:(UIViewController *)target {
    CPTableView *tableView = [[self alloc] initWithTableViewWithDataArr:dataArr target:target];
    return tableView;
}

- (instancetype)initWithTableViewWithDataArr:(NSArray<CPSectionConfig *> *)dataArr target:(UIViewController *)target {
    CGRect rect = CGRectMake(0, CPStatusBarHeight + CPNavigationBarHeight, CPScreenWidth, CPScreenHeight - CPStatusBarHeight - CPNavigationBarHeight);
    if (self = [super initWithFrame:rect style:UITableViewStyleGrouped]) {
        self.dataArr = [dataArr copy];
        self.target = target;
        self.backgroundColor = CPColorWithRGB(240, 239, 245, 1);
        self.delegate = self;
        self.dataSource = self;
        self.separatorType = CPTableViewCellSeparatorStyleSingleLineAlignImage;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.estimatedSectionHeaderHeight = 0;
        self.estimatedSectionFooterHeight = 0;
        self.rowHeight = 44;
        self.deleteStr = @"删除";
        [self registerClass:[CPTableViewHeaderView class] forHeaderFooterViewReuseIdentifier:HeaderViewCellID];
        [self registerClass:[CPTableViewFooterView class] forHeaderFooterViewReuseIdentifier:FooterViewCellID];
    }
    return self;
}

- (void)setSeparatorType:(CPTableViewCellSeparatorStyle)separatorType {
    _separatorType = separatorType;
    self.separatorStyle = _separatorType == CPTableViewCellSeparatorStyleNone ? UITableViewCellSeparatorStyleNone : UITableViewCellSeparatorStyleSingleLine;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    CPSectionConfig *sectionConfig = self.dataArr[section];
    return sectionConfig.commonModelArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CPSectionConfig *sectionConfig = self.dataArr[indexPath.section];
    CPCellModel *model = sectionConfig.commonModelArr[indexPath.row];
    CPTableViewCell *cell = [CPTableViewCell cellWithTableView:tableView cellType:model.cellType];
    
    if (indexPath.row == sectionConfig.commonModelArr.count - 1) {
        BOOL noneTopBottom = self.separatorType == CPTableViewCellSeparatorStyleSingleLineWholeWithNoneTopBottom || self.separatorType == CPTableViewCellSeparatorStyleSingleLineAlignImageWithNoneTopBottom || self.separatorType == CPTableViewCellSeparatorStyleSingleLineAlignTextWithNoneTopBottom;
        cell.separatorType = noneTopBottom ? CPTableViewCellSeparatorStyleNone : CPTableViewCellSeparatorStyleSingleLineWhole;
    }else {
        cell.separatorType = self.separatorType;
    }
    cell.cellModel = model;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CPSectionConfig *sectionConfig = self.dataArr[section];
    if (sectionConfig.headerTitle || sectionConfig.headerAttrTitle) {
        CPTableViewHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:HeaderViewCellID];
        if (sectionConfig.headerAttrTitle) {
            headerView.textLabel.attributedText = sectionConfig.headerAttrTitle;
        }else {
            headerView.textLabel.text = sectionConfig.headerTitle;
        }
        headerView.sectionConfig = sectionConfig;
        return headerView;
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    CPSectionConfig *sectionConfig = self.dataArr[section];
    if (sectionConfig.footerTitle || sectionConfig.footerAttrTitle) {
        CPTableViewFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:FooterViewCellID];
        if (sectionConfig.footerAttrTitle) {
            footerView.textLabel.attributedText = sectionConfig.footerAttrTitle;
        }else {
            footerView.textLabel.text = sectionConfig.footerTitle;
        }
        footerView.sectionConfig = sectionConfig;
        return footerView;
    }
    return nil;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.editing;
}


#pragma mark - UIDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CPSectionConfig *sectionConfig = self.dataArr[indexPath.section];
    CPCellModel *model = sectionConfig.commonModelArr[indexPath.row];
    
    if (model.cellType == CPCellTypeAccessoryCheckmark) {
        CPSectionConfig *sectionConfig = self.dataArr[indexPath.section];
        
        NSIndexPath *deSelectIndePath  =  [NSIndexPath indexPathForRow:0 inSection:indexPath.section];;
        for(int i = 0; i < sectionConfig.commonModelArr.count; i++) {
            CPCellModel *model = sectionConfig.commonModelArr[i];
            if (model.showCharkMark) {
                model.showCharkMark = NO;
                deSelectIndePath = [NSIndexPath indexPathForRow:i inSection:indexPath.section];
                break;
            }
        }
        model.showCharkMark = YES;
        NSIndexPath *selectIndePath  = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
        [tableView reloadRowsAtIndexPaths:@[deSelectIndePath, selectIndePath] withRowAnimation:UITableViewRowAnimationNone];
    }
    
    if (self.didSelectRowBlock) {
        self.didSelectRowBlock(indexPath, sectionConfig);
    }
    
    if (model.modelClickBlock) {
        model.modelClickBlock();
    }
    
    if (model.destinationVcClass && model.cellType == CPCellTypeAccessoryArrow) {
        if (![model.destinationVcClass isKindOfClass:[UINavigationController class]]) {
            UIViewController *vc = (UIViewController *)[[model.destinationVcClass alloc] init];
            if (model.isModalNav) {
                UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
                [self.target presentViewController:nav animated:YES completion:nil];
            }else if (model.isModalVc){
                [self.target presentViewController:vc animated:YES completion:nil];
            }else {
                [self.target.navigationController pushViewController:vc animated:YES];
            }
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    CPSectionConfig *sectionConfig = self.dataArr[section];
    if (sectionConfig.headerTitleHeight > 0) {
        return sectionConfig.topMarginForHeaderTextInSection + sectionConfig.headerTitleHeight + sectionConfig.bottomMarginForHeaderTextInSection;
    }else {
        return sectionConfig.heightForHeaderInSection;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    CPSectionConfig *sectionConfig = self.dataArr[section];
    if (sectionConfig.footerTitleHeight > 0) {
        return sectionConfig.topMarginForFooterTextInSection + sectionConfig.footerTitleHeight + sectionConfig.bottomMarginForFooterTextInSection;
    }else {
        return sectionConfig.heightForFooterInSection;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    CPSectionConfig *sectionConfig = self.dataArr[section];
    UITableViewHeaderFooterView *sectionHeaderView = (UITableViewHeaderFooterView *)view;
    if (sectionConfig.headerAttrTitle) {
        sectionHeaderView.textLabel.attributedText = sectionConfig.headerAttrTitle;
    }
    if (sectionConfig.headerTitleActionArr.count > 0) {
        sectionHeaderView.textLabel.clickActionArr = sectionConfig.headerTitleActionArr;
        sectionHeaderView.textLabel.userInteractionEnabled = YES;
    }else {
        sectionHeaderView.textLabel.userInteractionEnabled =  NO;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
    CPSectionConfig *sectionConfig = self.dataArr[section];
    UITableViewHeaderFooterView *sectionFooterView = (UITableViewHeaderFooterView *)view;
    if (sectionConfig.footerAttrTitle) {
        sectionFooterView.textLabel.attributedText = sectionConfig.footerAttrTitle;
    }
    if (sectionConfig.footerTitleActionArr.count > 0) {
        sectionFooterView.textLabel.clickActionArr = sectionConfig.footerTitleActionArr;
        sectionFooterView.textLabel.userInteractionEnabled = YES;
    }else {
        sectionFooterView.textLabel.userInteractionEnabled =  NO;
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.didDeleteRowBlock) {
        CPSectionConfig *sectionConfig = self.dataArr[indexPath.section];
        CPCellModel *model = sectionConfig.commonModelArr[indexPath.row];
        self.didDeleteRowBlock(indexPath, model);
    }
    
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.deleteStr;
}


@end
