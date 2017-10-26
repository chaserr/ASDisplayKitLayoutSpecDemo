//
//  TFTableViewItemCellNode.m
//  TFTableViewManagerDemo
//
//  Created by 童星 on 16/9/5.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "TFTableViewItemCellNode.h"
#import "TFTableViewItem.h"

@implementation TFTableViewItemCellNode

+ (CGFloat)cellNodeHeightWithItem:(TFTableViewItem *)item {
    return item.cellHeight? :0.0;
}

- (instancetype)initWithTableViewItem:(TFTableViewItem *)tableViewItem {
    self = [super init];
    if (self) {
        self.tableViewItem = tableViewItem;
    }
    [self cellLoadSubNodes];
    return self;
}

- (void)cellLoadSubNodes {
    self.selectionStyle = self.tableViewItem.selectionStyle;
    self.accessoryType = self.tableViewItem.accessoryType;
//    if (self.tableViewItem.accessoryView) {
//        self.accessoryView = self.tableViewItem.accessoryView;
//    }
//    self.separatorSunk = self.tableViewItem.separatorSunk;
}


@end
