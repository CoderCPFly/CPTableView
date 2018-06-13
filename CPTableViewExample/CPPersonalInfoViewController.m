//
//  CPPersonalInfoViewController.m
//  CPTableViewExample
//
//  Created by 陈鹏 on 2018/6/12.
//  Copyright © 2018年 陈鹏. All rights reserved.
//

#import "CPPersonalInfoViewController.h"
#import "CPTableViewSDK.h"

@interface CPPersonalInfoViewController ()

@property (nonatomic, strong) NSArray *personalInfoArr;

@end

@implementation CPPersonalInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    [self initTableView];
    self.view.backgroundColor = CPColorWithRGB(236, 234, 242, 1);
    
}

- (NSArray *)personalInfoArr {
    if (!_personalInfoArr) {
        CPCellModel *model1 = [[CPCellModel alloc] init];
        model1.title = @"头像";
        model1.accessoryIcon = @"me_avator";
        model1.cellRowHeight = 90;
        model1.signleConfig.accessoryIconImageSize = CGSizeMake(70, 70);
        model1.signleConfig.accessoryIconImageCornerRadius = 5;
        
        CPCellModel *model2 = [[CPCellModel alloc] init];
        model2.title = @"名字";
        model2.accessoryTitle = @"狗不理包子馒头";
        
        CPCellModel *model3 = [[CPCellModel alloc] init];
        model3.cellType = CPCellTypeAccessoryNone;
        model3.title = @"微信号";
        model3.accessoryTitle = @"CP123456789";
        
        CPCellModel *model4 = [[CPCellModel alloc] init];
        model4.title = @"我的二维码";
        model4.accessoryIcon = @"setting_myQR";
        model4.signleConfig.accessoryViewSize = CGSizeMake(16, 16);
        
        CPCellModel *model5 = [[CPCellModel alloc] init];
        model5.title = @"更多";
        
        CPCellModel *model6 = [[CPCellModel alloc] init];
        model6.title = @"我的地址";
        
        CPSectionConfig *section1Config1 = [[CPSectionConfig alloc] initWithCommonModels:@[model1, model2, model3, model4, model5]];
        CPSectionConfig *section1Config2 = [[CPSectionConfig alloc] initWithCommonModels:@[model6]];

        _personalInfoArr = @[section1Config1, section1Config2];
    }
    return _personalInfoArr;
}

- (void)initTableView {
    CPTableView *tableView = [CPTableView tableViewWithDataArr:self.personalInfoArr target:self];
    tableView.contentInset = UIEdgeInsetsMake(5, 0, 0, 0);
    [self.view addSubview:tableView];
}


@end
