//
//  CPLoginEeptViewController.m
//  CPTableViewExample
//
//  Created by 陈鹏 on 2018/6/5.
//  Copyright © 2018年 陈鹏. All rights reserved.
//

#import "CPLoginEeptViewController.h"
#import "CPTableViewSDK.h"

@interface CPLoginEeptViewController ()

@property (nonatomic, strong) NSArray<CPSectionConfig *> *eqptArr;
@property (nonatomic, weak) CPTableView *tableView;

@end

@implementation CPLoginEeptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavBar];
    [self initTableView];
    self.view.backgroundColor = CPColorWithRGB(240, 239, 245, 1);
}

- (void)initNavBar {
    self.title = @"登录设备管理";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(edit)];
}



- (NSArray *)eqptArr {
    if (!_eqptArr) {
        CPCellModel *model1 = [[CPCellModel alloc] init];
        model1.title = @"iPhone";
        model1.subtitle = @"13:54";
        
        CPCellModel *model2 = [[CPCellModel alloc] init];
        model2.title = @"特朗普的MacBook Pro";
        model2.subtitle = @"11:19";
        
        CPSectionConfig *section1Config1 = [[CPSectionConfig alloc] initWithCommonModels:@[model1, model2]];
        
        section1Config1.headerTitle = @"最近登录设备：你可以删除列表中的设备，删除后在该设备登录微信需要进行身份验证";
        _eqptArr = @[section1Config1];
    }
    return _eqptArr;
}


- (void)initTableView {
    CPTableView *tableView = [CPTableView tableViewWithDataArr:self.eqptArr target:self];
    tableView.rowHeight = 50;
    __weak typeof(self) weakSelf = self;
    tableView.didSelectRowBlock = ^(NSIndexPath *indexPath, CPSectionConfig *sectionConfig) {
        weakSelf.navigationItem.rightBarButtonItem.enabled = indexPath.row == 0 ? NO : YES;
    };
    [self.view addSubview:tableView];
    tableView.didDeleteRowBlock = ^(NSIndexPath *indexPath, CPCellModel *cellModel) {
        CPSectionConfig *sectionConfig = weakSelf.eqptArr[indexPath.section];
        CPCellModel *model = sectionConfig.commonModelArr[indexPath.row];
        [sectionConfig.commonModelArr removeObject:model];
        [weakSelf.tableView reloadData];
        NSLog(@"thread %@", [NSThread currentThread]);
    };
    self.tableView = tableView;
}

- (void)edit {
    self.tableView.editing = !self.tableView.editing;
}

@end
