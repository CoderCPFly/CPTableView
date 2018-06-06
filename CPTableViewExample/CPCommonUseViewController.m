//
//  CPCommonUseViewController.m
//  CPTableViewExample
//
//  Created by 陈鹏 on 2018/6/5.
//  Copyright © 2018年 陈鹏. All rights reserved.
//

#import "CPCommonUseViewController.h"
#import "CPTableViewSDK.h"
#import "CPSettingLanguageViewController.h"
#import "CPAssistViewController.h"

@interface CPCommonUseViewController ()

@property (nonatomic, strong) NSArray<CPSectionConfig *> *commonArr;

@end

@implementation CPCommonUseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"通用";
    [self initTableView];
    self.view.backgroundColor = CPColorWithRGB(236, 234, 242, 1);
}

- (void)dealloc {
    NSLog(@"通用 dealloc");
}

- (NSArray *)commonArr {
    if (!_commonArr) {
        CPCellModel *model1 = [[CPCellModel alloc] init];
        model1.title = @"多语言";
        model1.modalNav = YES;
        model1.destinationVcClass = [CPSettingLanguageViewController class];
        
        CPCellModel *model2 = [[CPCellModel alloc] init];
        model2.title = @"字体大小";
        
        CPCellModel *model3 = [[CPCellModel alloc] init];
        model3.title = @"聊天背景";
        
        CPCellModel *model4 = [[CPCellModel alloc] init];
        model4.title = @"我的表情";
        
        CPCellModel *model5 = [[CPCellModel alloc] init];
        model5.title = @"照片、视频和文件";
        
        CPCellModel *model6 = [[CPCellModel alloc] init];
        model6.title = @"听筒模式";
        model6.cellType = CPCellTypeAccessorySwitch;
        model6.switchChangeBlock = ^(BOOL isON) {
            NSLog(@"听筒模式 %d", isON);
        };
        model6.key = @"listenModel";
        
        CPCellModel *model7 = [[CPCellModel alloc] init];
        model7.title = @"发现页管理";
        
        CPCellModel *model8 = [[CPCellModel alloc] init];
        model8.title = @"辅助功能";
        model8.destinationVcClass = [CPAssistViewController class];
        
        CPCellModel *model9 = [[CPCellModel alloc] init];
        model9.title = @"聊天记录迁移";
        
        CPCellModel *model10 = [[CPCellModel alloc] init];
        model10.title = @"存储空间";
        
        CPCellModel *model11 = [[CPCellModel alloc] init];
        model11.centerTitle = @"清空聊天记录";
        model11.cellType = CPCellTypeTitleCenter;
        
        CPSectionConfig *section1Config1 = [[CPSectionConfig alloc] initWithCommonModels:@[model1]];
        CPSectionConfig *section1Config2 = [[CPSectionConfig alloc] initWithCommonModels:@[model2, model3, model4, model5]];
        CPSectionConfig *section1Config3 = [[CPSectionConfig alloc] initWithCommonModels:@[model6]];
        CPSectionConfig *section1Config4 = [[CPSectionConfig alloc] initWithCommonModels:@[model7, model8]];
        CPSectionConfig *section1Config5 = [[CPSectionConfig alloc] initWithCommonModels:@[model9, model10]];
        CPSectionConfig *section1Config6 = [[CPSectionConfig alloc] initWithCommonModels:@[model11]];
        _commonArr = @[section1Config1, section1Config2, section1Config3, section1Config4, section1Config5, section1Config6];
    }
    return _commonArr;
}


- (void)initTableView {
    CPTableView *tableView = [CPTableView tableViewWithDataArr:self.commonArr target:self];
    tableView.separatorType = 3;
    [self.view addSubview:tableView];
}

@end
