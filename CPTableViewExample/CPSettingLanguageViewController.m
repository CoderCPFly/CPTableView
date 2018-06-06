//
//  CPSettingLanguageViewController.m
//  CPTableViewExample
//
//  Created by 陈鹏 on 2018/6/5.
//  Copyright © 2018年 陈鹏. All rights reserved.
//

#import "CPSettingLanguageViewController.h"
#import "CPTableViewSDK.h"

@interface CPSettingLanguageViewController ()

@property (nonatomic, strong) NSArray<CPSectionConfig *>  *languageArr;
@property (nonatomic, weak) CPTableView *tableView;

@end

@implementation CPSettingLanguageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavBar];
    [self initTableView];
    self.view.backgroundColor = CPColorWithRGB(236, 234, 242, 1);
}

- (void)initNavBar {
    self.title = @"设置语言";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(complete)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    NSMutableDictionary *disabledAttrs = [NSMutableDictionary dictionary];
    disabledAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:disabledAttrs forState:UIControlStateDisabled];
}

- (NSArray *)languageArr {
    if (!_languageArr) {
        CPCellModel *model1 = [[CPCellModel alloc] init];
        model1.title = @"简体中文";
        model1.cellType = CPCellTypeAccessoryCheckmark;
        model1.showCharkMark = YES;
        
        CPCellModel *model2 = [[CPCellModel alloc] init];
        model2.title = @"繁体中文";
        model2.cellType = CPCellTypeAccessoryCheckmark;
        
        CPCellModel *model3 = [[CPCellModel alloc] init];
        model3.title = @"English";
        model3.cellType = CPCellTypeAccessoryCheckmark;
        
        CPCellModel *model4 = [[CPCellModel alloc] init];
        model4.title = @"France";
        model4.cellType = CPCellTypeAccessoryCheckmark;
        
        CPSectionConfig *section1Config1 = [[CPSectionConfig alloc] initWithCommonModels:@[model1, model2, model3, model4]];
        _languageArr = @[section1Config1];
    }
    return _languageArr;
}

- (void)dealloc {
    NSLog(@"dealloc language");
}

- (void)initTableView {
    CPTableView *tableView = [CPTableView tableViewWithDataArr:self.languageArr target:self];
    __weak typeof(self) weakSelf = self;
    tableView.didSelectRowBlock = ^(NSIndexPath *indexPath, CPSectionConfig *sectionConfig) {
        weakSelf.navigationItem.rightBarButtonItem.enabled = indexPath.row == 0 ? NO : YES;
    };
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

#pragma mark -action
- (void)cancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)complete {
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"complete");
}

@end
