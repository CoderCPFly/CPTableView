//
//  CPAccountSafeViewController.m
//  CPTableViewExample
//
//  Created by 陈鹏 on 2018/6/5.
//  Copyright © 2018年 陈鹏. All rights reserved.
//

#import "CPAccountSafeViewController.h"
#import "CPTableViewSDK.h"
#import "CPLoginEeptViewController.h"
#import "CPMoreSafeSettingViewController.h"

@interface CPAccountSafeViewController ()

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation CPAccountSafeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"账号与安全";
    [self initTableView];
    self.view.backgroundColor = CPColorWithRGB(236, 234, 242, 1.0);
    
}

- (NSMutableArray *)data {
    if (!_data) {
        _data = [NSMutableArray array];
        
        CPCellModel *model1 = [[CPCellModel alloc] init];
        model1.title = @"微信号";
        model1.accessoryTitle = @"CP524662245";
        model1.cellType = CPCellTypeAccessoryNone;
        
        CPCellModel *model2 = [[CPCellModel alloc] init];
        model2.title = @"手机";
        model2.accessoryTitle = @"13398360754";
        model2.accessoryIcon = @"ProfileLockOn";
        
        CPCellModel *model3 = [[CPCellModel alloc] init];
        model3.title = @"微信密码";
        model3.accessoryTitle = @"未设置";
        
        CPCellModel *model4 = [[CPCellModel alloc] init];
        model4.title = @"声音锁";
        model4.accessoryTitle = @"未设置";
        
        CPCellModel *model5 = [[CPCellModel alloc] init];
        model5.title = @"应急联系人";
        
        CPCellModel *model6 = [[CPCellModel alloc] init];
        model6.title = @"登录社备管理";
        model6.destinationVcClass = [CPLoginEeptViewController class];
        
        CPCellModel *model7 = [[CPCellModel alloc] init];
        model7.title = @"更多安全设置";
        model7.destinationVcClass = [CPMoreSafeSettingViewController class];
        
        CPCellModel *model8 = [[CPCellModel alloc] init];
        model8.title = @"微信安全中心";
        
        CPSectionConfig *section1Config1 = [[CPSectionConfig alloc] initWithCommonModels:@[model1, model2]];
        CPSectionConfig *section1Config2 = [[CPSectionConfig alloc] initWithCommonModels:@[model3, model4]];
        CPSectionConfig *section1Config3 = [[CPSectionConfig alloc] initWithCommonModels:@[model5, model6, model7]];
        CPSectionConfig *section1Config4 = [[CPSectionConfig alloc] initWithCommonModels:@[model8]];
        
        
        [_data addObject:section1Config1];
        [_data addObject:section1Config2];
        [_data addObject:section1Config3];
        [_data addObject:section1Config4];
    }
    return _data;
}



- (void)initTableView {
    CPTableView *tableView = [CPTableView tableViewWithDataArr:self.data target:self];
    [self.view addSubview:tableView];
}

@end
