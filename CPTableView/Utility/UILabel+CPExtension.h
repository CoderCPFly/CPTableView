//
//  UILabel+CPExtension.h
//  CPCommonTableView
//
//  Created by 陈鹏 on 2018/6/1.
//  Copyright © 2018年 陈鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (CPExtension)

typedef void(^CPTexAction)(void);

@property (nonatomic, strong) NSMutableArray *clickActionArr;

- (void)cp_setTextClickRange:(NSRange)clickRange clickAction:(CPTexAction)clickAction;

@end
