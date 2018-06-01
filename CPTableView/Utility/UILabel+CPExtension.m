//
//  UILabel+CPExtension.m
//  CPCommonTableView
//
//  Created by 陈鹏 on 2018/6/1.
//  Copyright © 2018年 陈鹏. All rights reserved.
//

#import "UILabel+CPExtension.h"
#import <objc/runtime.h>

@implementation UILabel (CPExtension)

- (void)cp_setTextClickRange:(NSRange)clickRange clickAction:(CPTexAction)clickAction {
    self.userInteractionEnabled = YES;
    NSDictionary *dic = @{@"clickRange" : [NSValue valueWithRange:clickRange], @"clickAction" : clickAction};
    [self.clickActionArr addObject:dic];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.clickActionArr.count > 0) {
        CGFloat characterW = self.frame.size.width / self.text.length;
        CGPoint point = [[touches anyObject] locationInView:self];
        for (NSDictionary *dic in self.clickActionArr) {
            NSRange clickRange = [dic[@"clickRange"] rangeValue];
            CPTexAction clickAction = dic[@"clickAction"];
            CGFloat startX = characterW * clickRange.location;
            CGFloat endX = characterW * clickRange.length + startX;
            if (point.x >= startX && point.x <= endX) {
                clickAction();
                break;
            }
        }
    }
}

#pragma mark - property
static char const  CPClickActionArr = 'A';

- (NSMutableArray *)clickActionArr {
    NSMutableArray *targets = objc_getAssociatedObject(self, &CPClickActionArr);
    if (!targets) {
        targets = [NSMutableArray array];
        objc_setAssociatedObject(self, &CPClickActionArr, targets, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return targets;
}

- (void)setClickActionArr:(NSMutableArray *)clickActionArr {
    objc_setAssociatedObject(self, &CPClickActionArr, clickActionArr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
