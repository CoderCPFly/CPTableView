//
//  CPCellModel.m
//  CPCommonTableView
//
//  Created by 陈鹏 on 2018/6/1.
//  Copyright © 2018年 陈鹏. All rights reserved.
//

#import "CPCellModel.h"

@implementation CPCellModel
- (instancetype)init {
    if (self = [super init]) {
        self.cellType = CPCellTypeAccessoryArrow;
        self.signleConfig = [[CPSignleConfig alloc] init];
    }
    return self;
}
@end
