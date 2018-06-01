//
//  CPConst.h
//  CPCommonTableView
//
//  Created by 陈鹏 on 2018/6/1.
//  Copyright © 2018年 陈鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define CPScreenWidth      [UIScreen mainScreen].bounds.size.width
#define CPScreenHeight     [UIScreen mainScreen].bounds.size.height
#define CPStatusBarHeight  [[UIApplication sharedApplication] statusBarFrame].size.height
#define CPNavigationBarHeight 44.0f

//color
#define CPColorWithRGB(R,G,B,A)     [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define CPRandomColor CPColorWithRGB(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255), 1)
