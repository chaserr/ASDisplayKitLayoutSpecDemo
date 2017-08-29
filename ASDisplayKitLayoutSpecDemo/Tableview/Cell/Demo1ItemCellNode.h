//
//  Demo1ItemCellNode.h
//  TimeFaceDemoProject
//
//  Created by 童星 on 16/9/12.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "ASDemoLayoutItemCellNode.h"
#import "Demo1Item.h"

@interface Demo1ItemCellNode : ASDemoLayoutItemCellNode
// 模型对象
@property (strong, nonatomic) Demo1Item *tableViewItem;
@end
