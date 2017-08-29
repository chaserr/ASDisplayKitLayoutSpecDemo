//
//  ASDemoLayoutItemCellNode.h
//  TimeFaceDemoProject
//
//  Created by 童星 on 16/9/12.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "TFTableViewItemCellNode.h"
#import "ASDemoLayoutItem.h"

@interface ASDemoLayoutItemCellNode : TFTableViewItemCellNode
// 模型对象
@property (strong, nonatomic) ASDemoLayoutItem *tableViewItem;

- (void)updateMarkWithLine:(NSInteger)numberOfLine;
- (void)updateAccessoryInfo:(NSString *)accessoryInfo;

- (ASLayoutSpec *)layoutOthers:(ASSizeRange)constrainedSize;
@end
