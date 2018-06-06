//
//  CPPrivacyViewController.m
//  CPTableViewExample
//
//  Created by 陈鹏 on 2018/6/5.
//  Copyright © 2018年 陈鹏. All rights reserved.
//

#import "CPPrivacyViewController.h"
#import "CPTableViewSDK.h"
#import "CPLoginEeptViewController.h"

@interface CPPrivacyViewController ()

@property (nonatomic, strong) NSArray<CPSectionConfig *> *privacyArr;

@end

@implementation CPPrivacyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"隐私";
    [self initTableView];
    self.view.backgroundColor = CPColorWithRGB(236, 234, 242, 1);
}

- (NSArray *)privacyArr {
    if (!_privacyArr) {
        CPCellModel *model1 = [[CPCellModel alloc] init];
        model1.title = @"加我为朋友时需要验证";
        model1.cellType = CPCellTypeAccessorySwitch;
        
        CPCellModel *model2 = [[CPCellModel alloc] init];
        model2.title = @"添加我的方式";
        
        CPCellModel *model3 = [[CPCellModel alloc] init];
        model3.title = @"向我推荐通讯录朋友";
        model3.cellType = CPCellTypeAccessorySwitch;
        
        CPCellModel *model4 = [[CPCellModel alloc] init];
        model4.title = @"通讯录黑名单";
        
        CPCellModel *model5 = [[CPCellModel alloc] init];
        model5.title = @"不让他(她)看我的朋友圈";
        
        CPCellModel *model6 = [[CPCellModel alloc] init];
        model6.title = @"允许朋友查看朋友圈范围";
        model6.accessoryTitle = @"全部";
        
        CPCellModel *model7 = [[CPCellModel alloc] init];
        model7.title = @"允许陌生人查看十条朋友圈";
        model7.cellType = CPCellTypeAccessorySwitch;
        
        CPCellModel *model8 = [[CPCellModel alloc] init];
        model8.title = @"朋友圈更新提醒";
        model8.cellType = CPCellTypeAccessorySwitch;
        
        CPCellModel *model9 = [[CPCellModel alloc] init];
        model9.title = @"授权管理";
        
        
        CPSectionConfig *section1Config1 = [[CPSectionConfig alloc] initWithCommonModels:@[model1]];
        CPSectionConfig *section1Config2 = [[CPSectionConfig alloc] initWithCommonModels:@[model2, model3]];
        section1Config2.footerTitle = @"开启后，为你推荐已经开通微信的手机联系人";
        
        CPSectionConfig *section1Config3 = [[CPSectionConfig alloc] initWithCommonModels:@[model4]];
        section1Config3.headerTitle = @"朋友圈 为你推荐已经开通微信的手机联系人朋友圈 为你推荐已经开通微信的手机联系人朋友圈 为你推荐已经开通微信的手机联系人朋友圈 为你推荐已经开通微信的手机联系人";
        
        CPSectionConfig *section1Config4 = [[CPSectionConfig alloc] initWithCommonModels:@[model5, model6, model7, model8]];
        section1Config4.headerTitle = @"朋友圈 为你推荐已经开通微信的手机联系人";
        NSMutableAttributedString *attrFooterTitle = [[NSMutableAttributedString alloc] initWithString:@"朋友圈，了解更多"];
        [attrFooterTitle setAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]} range:NSMakeRange(4, 4)];
        section1Config4.footerAttrTitle = attrFooterTitle;
        [section1Config4 setTextClickRange:NSMakeRange(0, 4) header:NO clickAction:^{
            NSLog(@"click 0 4");
        }];
        [section1Config4 setTextClickRange:NSMakeRange(4, 4) header:NO clickAction:^{
            NSLog(@"click 4  4");
        }];
        [section1Config4 setTextClickRange:NSMakeRange(0, 4) header:YES clickAction:^{
            NSLog(@"header left");
        }];
        [section1Config4 setTextClickRange:NSMakeRange(6, 4) header:YES clickAction:^{
            NSLog(@"header middle");
        }];
        [section1Config4 setTextClickRange:NSMakeRange(16, 4) header:YES clickAction:^{
            NSLog(@"header right");
        }];
        
        CPSectionConfig *section1Config5 = [[CPSectionConfig alloc] initWithCommonModels:@[model9]];
        section1Config5.footerTitle = @"关闭后，有朋友发表朋友圈是，界面下方的”发现“切换按钮时不再出现红点提示";
        section1Config5.headerTitle = @"我就是你";
        _privacyArr = @[section1Config1, section1Config2, section1Config3, section1Config4, section1Config5];
    }
    return _privacyArr;
}


- (void)initTableView {
    CPTableView *tableView = [CPTableView tableViewWithDataArr:self.privacyArr target:self];
    tableView.tableFooterView = [self setupTableFooterView];
    [self.view addSubview:tableView];
}

- (UIView *)setupTableFooterView {
    UIView *footerView = [[UIView alloc] init];
    footerView.size = CGSizeMake(CPScreenWidth, 50);
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:11];
    label.textColor = [UIColor lightGrayColor];
    label.textAlignment = NSTextAlignmentCenter;
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:@"《微信软件许可及服务协议》和《微信隐私保护指引》"];
    [attrStr setAttributes:@{NSForegroundColorAttributeName : [UIColor blueColor]} range:NSMakeRange(0, 13)];
    [attrStr setAttributes:@{NSForegroundColorAttributeName : [UIColor blueColor]} range:NSMakeRange(14, 10)];
    
    label.attributedText = attrStr;
    [label cp_setTextClickRange:NSMakeRange(0, 13) clickAction:^{
        NSLog(@"社会人");
    }];
    [label cp_setTextClickRange:NSMakeRange(14, 10) clickAction:^{
        NSLog(@"隐私人");
    }];
    [label sizeToFit];
    label.center = footerView.center;
    [footerView addSubview:label];
    
    return footerView;
}


@end
