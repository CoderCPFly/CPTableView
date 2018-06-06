//
//  CPAssistViewController.m
//  CPTableViewExample
//
//  Created by 陈鹏 on 2018/6/5.
//  Copyright © 2018年 陈鹏. All rights reserved.
//

#import "CPAssistViewController.h"
#import "CPTableViewSDK.h"

@interface CPAssistViewController ()

@property (nonatomic, strong) NSArray<CPSectionConfig *>  *assistArr;

@end

@implementation CPAssistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"辅助功能";
    [self initTableView];
    self.view.backgroundColor = CPColorWithRGB(236, 234, 242, 1);
}


- (NSArray<CPSectionConfig *> *)assistArr {
    if (!_assistArr) {
        CPCellModel *model1 = [[CPCellModel alloc] init];
        model1.title = @"群发助手";
        model1.icon = @"Plugins_groupsms_avatar";
        
        CPCellModel *model2 = [[CPCellModel alloc] init];
        model2.title = @"QQ邮箱提醒";
        model2.icon = @"Plugins_Pushmail_avatr";
        
        CPCellModel *model3 = [[CPCellModel alloc] init];
        model3.title = @"腾讯新闻";
        model3.icon = @"Plugins_News";
        
        CPCellModel *model4 = [[CPCellModel alloc] init];
        model4.title = @"微信运动";
        model4.icon = @"Plugins_WeSport_avatar";
        
        CPSectionConfig *section1Config1 = [[CPSectionConfig alloc] initWithCommonModels:@[model1]];
        section1Config1.headerViewBlock = ^UIView *{
            UIView *headerView = [[UIView alloc] init];
            headerView.height = 40;
            
            UIImageView *dotIv = [[UIImageView alloc] init];
            dotIv.image = [UIImage imageNamed:@"me_dot_green"];
            dotIv.size = CGSizeMake(8, 8);
            dotIv.x = 15;
            dotIv.y = 20;
            [headerView addSubview:dotIv];
            
            UILabel *label = [[UILabel alloc] init];
            label.text = @"已启用的功能";
            label.font = [UIFont systemFontOfSize:14];
            label.textColor = [UIColor grayColor];
            [headerView addSubview:label];
            [label sizeToFit];
            label.centerY = dotIv.centerY;
            label.x = CGRectGetMaxX(dotIv.frame) + 10;
            
            return headerView;
        };
        CPSectionConfig *section1Config2 = [[CPSectionConfig alloc] initWithCommonModels:@[model2, model3, model4]];
        section1Config2.headerViewBlock = ^UIView *{
            UIView *headerView = [[UIView alloc] init];
            headerView.height = 40;
            UIImageView *dotIv = [[UIImageView alloc] init];
            dotIv.image = [UIImage imageNamed:@"me_dot_gray"];
            dotIv.size = CGSizeMake(8, 8);
            dotIv.x = 15;
            dotIv.y = 20;
            [headerView addSubview:dotIv];
            
            UILabel *label = [[UILabel alloc] init];
            label.text = @"未启用的功能";
            label.font = [UIFont systemFontOfSize:14];
            label.textColor = [UIColor grayColor];
            [headerView addSubview:label];
            [label sizeToFit];
            label.centerY = dotIv.centerY;
            label.x = CGRectGetMaxX(dotIv.frame) + 10;
            
            return headerView;
        };

        _assistArr = @[section1Config1, section1Config2];
    }
    return _assistArr;
}

- (void)initTableView {
    CPTableView *tableView = [CPTableView tableViewWithDataArr:self.assistArr target:self];
    [self.view addSubview:tableView];
}

@end
