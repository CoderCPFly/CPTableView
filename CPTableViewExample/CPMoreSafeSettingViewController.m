//
//  CPMoreSafeSettingViewController.m
//  CPTableViewExample
//
//  Created by 陈鹏 on 2018/6/5.
//  Copyright © 2018年 陈鹏. All rights reserved.
//

#import "CPMoreSafeSettingViewController.h"
#import "CPTableViewSDK.h"

@interface CPMoreSafeSettingViewController ()

@property (nonatomic, strong) NSArray<CPSectionConfig *>  *moreArr;

@end

@implementation CPMoreSafeSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"更多安全设置";
    [self initTableView];
    self.view.backgroundColor = CPColorWithRGB(236, 234, 242, 1);
}


- (NSArray<CPSectionConfig *> *)moreArr {
    if (!_moreArr) {
        CPCellModel *model1 = [[CPCellModel alloc] init];
        model1.title = @"QQ号";
        model1.accessoryTitle = @"123456789";
        
        CPCellModel *model2 = [[CPCellModel alloc] init];
        model2.title = @"QQ邮箱";
        model2.accessoryTitle = @"123456789@qq.com";
        
        CPSectionConfig *section1Config1 = [[CPSectionConfig alloc] initWithCommonModels:@[model1, model2]];
        _moreArr = @[section1Config1];
    }
    return _moreArr;
}

- (void)initTableView {
    CPTableView *tableView = [CPTableView tableViewWithDataArr:self.moreArr target:self];
    [self.view addSubview:tableView];
}

@end
