//
//  SocialAppItemCellNode.h
//  TimeFaceDemoProject
//
//  Created by 童星 on 16/9/12.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "TFTableViewItemCellNode.h"
#import "SocialAppItem.h"

@interface SocialAppItemCellNode : TFTableViewItemCellNode

// 模型对象
@property (strong, nonatomic) SocialAppItem *tableViewItem;

@end
