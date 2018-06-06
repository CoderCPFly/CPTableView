//
//  CPSettingViewController.m
//  CPTableViewExample
//
//  Created by 陈鹏 on 2018/6/5.
//  Copyright © 2018年 陈鹏. All rights reserved.
//

#import "CPSettingViewController.h"
#import "CPTableViewSDK.h"
#import "CPAccountSafeViewController.h"
#import "CPPrivacyViewController.h"
#import "CPCommonUseViewController.h"

@interface CPSettingViewController ()

@property (nonatomic, strong) NSArray *setupArr;

@end

@implementation CPSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    [self initTableView];
    self.view.backgroundColor = CPColorWithRGB(236, 234, 242, 1);
    
}

- (NSArray *)setupArr {
    if (!_setupArr) {
        CPCellModel *model1 = [[CPCellModel alloc] init];
        model1.title = @"账号与安全";
        model1.cellType = CPCellTypeAccessoryArrow;
        model1.destinationVcClass = [CPAccountSafeViewController class];
        
        CPCellModel *model2 = [[CPCellModel alloc] init];
        model2.title = @"新消息通知";
        
        CPCellModel *model3 = [[CPCellModel alloc] init];
        model3.title = @"隐私";
        model3.cellType = CPCellTypeAccessoryArrow;
        model3.destinationVcClass = [CPPrivacyViewController class];
        
        CPCellModel *model4 = [[CPCellModel alloc] init];
        model4.title = @"通用";
        model4.destinationVcClass = [CPCommonUseViewController class];
        
        CPCellModel *model5 = [[CPCellModel alloc] init];
        model5.title = @"帮助与反馈";
        
        CPCellModel *model6 = [[CPCellModel alloc] init];
        model6.title = @"关于微信";
        model6.accessoryTitle = @"版本6.6.7";
        
        CPCellModel *model7 = [[CPCellModel alloc] init];
        model7.title = @"插件";
        model7.icon = @"light";
        model7.signleConfig.titleFront = YES;
        
        CPCellModel *model8 = [[CPCellModel alloc] init];
        model8.cellType = CPCellTypeTitleCenter;
        model8.centerTitle = @"切换账号";
        
        CPCellModel *model9 = [[CPCellModel alloc] init];
        model9.cellType = CPCellTypeTitleCenter;
        model9.centerTitle = @"退出登录";
        model9.signleConfig.centerTitleColor = [UIColor redColor];
        
        CPSectionConfig *section1Config1 = [[CPSectionConfig alloc] initWithCommonModels:@[model1]];
        CPSectionConfig *section1Config2 = [[CPSectionConfig alloc] initWithCommonModels:@[model2, model3, model4]];
        CPSectionConfig *section1Config3 = [[CPSectionConfig alloc] initWithCommonModels:@[model5, model6]];
        CPSectionConfig *section1Config4 = [[CPSectionConfig alloc] initWithCommonModels:@[model7]];
        CPSectionConfig *section1Config5 = [[CPSectionConfig alloc] initWithCommonModels:@[model8]];
        CPSectionConfig *section1Config6 = [[CPSectionConfig alloc] initWithCommonModels:@[model9]];
        _setupArr = @[section1Config1, section1Config2, section1Config3, section1Config4, section1Config5, section1Config6];
    }
    return _setupArr;
}

- (void)initTableView {
    CPTableView *tableView = [CPTableView tableViewWithDataArr:self.setupArr target:self];
    [self.view addSubview:tableView];
}

@end
