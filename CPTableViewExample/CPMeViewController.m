//
//  CPMeViewController.m
//  CPTableViewExample
//
//  Created by 陈鹏 on 2018/6/5.
//  Copyright © 2018年 陈鹏. All rights reserved.
//

#import "CPMeViewController.h"
#import "CPTableViewSDK.h"
#import "CPSettingViewController.h"
#import "CPPersonalInfoViewController.h"

@interface CPMeViewController ()

@property (nonatomic, strong) NSArray<CPSectionConfig *> *meArr;

@end

@implementation CPMeViewController

static NSString * const MeCellID = @"MeCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我";
    [self initTableView];
    self.view.backgroundColor = CPColorWithRGB(240, 239, 245, 1);
}

- (NSArray *)meArr {
    if (!_meArr) {
        CPCellModel *model1 = [[CPCellModel alloc] init];
        model1.title = @"钱包";
        model1.icon = @"MoreMyBankCard";
        
        CPCellModel *model2 = [[CPCellModel alloc] init];
        model2.title = @"收藏";
        model2.icon = @"MoreMyFavorites";
        
        CPCellModel *model3 = [[CPCellModel alloc] init];
        model3.title = @"相册";
        model3.icon = @"MoreMyAlbum";
        
        CPCellModel *model4 = [[CPCellModel alloc] init];
        model4.title = @"卡包";
        model4.icon = @"MyCardPackageIcon";
        
        CPCellModel *model5 = [[CPCellModel alloc] init];
        model5.title = @"表情";
        model5.icon = @"emoticon";
        model5.modelClickBlock = ^{
            NSLog(@"model5 click");
        };
        
        CPCellModel *model6 = [[CPCellModel alloc] init];
        model6.title = @"设置";
        model6.icon = @"MoreSetting";
        model6.destinationVcClass = [CPSettingViewController class];
        
        CPSectionConfig *section1Config1 = [[CPSectionConfig alloc] initWithCommonModels:@[model1]];
        CPSectionConfig *section1Config2 = [[CPSectionConfig alloc] initWithCommonModels:@[model2, model3, model4, model5]];
        CPSectionConfig *section1Config3 = [[CPSectionConfig alloc] initWithCommonModels:@[model6]];
        _meArr = @[section1Config1, section1Config2, section1Config3];
    }
    return _meArr;
}


- (void)initTableView {
    CPTableView *tableView = [CPTableView tableViewWithDataArr:self.meArr target:self];
    tableView.separatorType = 6;
    tableView.tableHeaderView = [self setupHeaderView];
    [self.view addSubview:tableView];
}

- (UIView *)setupHeaderView {
    UIView *headerView  = [[UIView alloc] init];
    headerView.backgroundColor = CPColorWithRGB(240, 239, 245, 1);
    headerView.height = 115;
    headerView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headerViewClick)];
    [headerView addGestureRecognizer:tap];
    
    UIView *centerView = [[UIView alloc] init];
    centerView.backgroundColor = [UIColor whiteColor];
    [headerView addSubview:centerView];
    centerView.frame = CGRectMake(0, 15, CPScreenWidth, 90);
    
    UIImageView *avator = [[UIImageView alloc] init];
    avator.image = [UIImage imageNamed:@"me_avator"];
    avator.layer.cornerRadius = 5;
    avator.layer.masksToBounds = YES;
    [centerView addSubview:avator];
    CGFloat avatorWH = 70;
    avator.frame = CGRectMake([CPGlobalConfig sharedInstance].leftMargin, (centerView.height - avatorWH) * 0.5, avatorWH, avatorWH);
    
    UILabel *nickNameLabel = [[UILabel alloc] init];
    nickNameLabel.font = [UIFont systemFontOfSize:16];
    nickNameLabel.textColor = [UIColor blackColor];
    nickNameLabel.text = @"狗不理包子馒头";
    [centerView addSubview:nickNameLabel];
    [nickNameLabel sizeToFit];
    nickNameLabel.x = CGRectGetMaxX(avator.frame) + 10;
    
    UILabel *weixinNumLabel = [[UILabel alloc] init];
    weixinNumLabel.font = [UIFont systemFontOfSize:14];
    weixinNumLabel.textColor = [UIColor blackColor];
    weixinNumLabel.text = @"微信号：CP123456789";
    [centerView addSubview:weixinNumLabel];
    [weixinNumLabel sizeToFit];
    weixinNumLabel.x = nickNameLabel.x;
    nickNameLabel.y = (centerView.height - weixinNumLabel.height - nickNameLabel.height - 10) * 0.5;
    weixinNumLabel.y = CGRectGetMaxY(nickNameLabel.frame) + 10;
    
    UIImageView *arrowIv = [[UIImageView alloc] init];
    arrowIv.image = [UIImage imageNamed:@"RightArrowGray"];
    [centerView addSubview:arrowIv];
    arrowIv.frame = CGRectMake(CPScreenWidth - 8 - [CPGlobalConfig sharedInstance].rightMargin, (centerView.height - 13) * 0.5, 8, 13);
    
    
    UIImageView *QRCodeIv = [[UIImageView alloc] init];
    QRCodeIv.image = [UIImage imageNamed:@"setting_myQR"];
    [centerView addSubview:QRCodeIv];
    CGFloat QRCodeWH = 16;
    QRCodeIv.frame = CGRectMake(arrowIv.x - QRCodeWH - 10, (centerView.height - QRCodeWH) * 0.5, QRCodeWH, QRCodeWH);

    
    return headerView;
}

- (void)headerViewClick {
    CPPersonalInfoViewController *vc = [[CPPersonalInfoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
