//
//  TFTableViewItemCellNode.h
//  TFTableViewManagerDemo
//
//  Created by 童星 on 16/9/5.
//  Copyright © 2016年 童星. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@class TFTableViewManager;
@class TFTableViewItem;

/**
 * the table view cell node when use a table node of table manager.
 */
@interface TFTableViewItemCellNode : ASCellNode

/**
 *  @brief The `TFASTableViewManager` that needs to be managed using this `TFTableViewItemCellNode`.
 */
@property (weak, nonatomic) TFTableViewManager *tableViewManager;

/**
 *  @brief the item of the cell node.
 */
@property (strong, nonatomic) TFTableViewItem *tableViewItem;

/**
 *  the static height for the matched cell node.
 *
 *  @param item             a TFTableViewItem.
 *  @warning When implement this method, cell node height is constant, use ASLayoutSpec,can not implement this method.
 *  @return a CGFloat value of static cell node height.
 */
+ (CGFloat)cellNodeHeightWithItem:(TFTableViewItem *)item;

/**
 *  the item of the cell.
 *
 *  @param tableViewItem item.
 *
 *  @return TFTableViewItemCellNode.
 */
- (instancetype)initWithTableViewItem:(TFTableViewItem *)tableViewItem;

/**
 *  add sub nodes in this method.
 */
- (void)cellLoadSubNodes __attribute__((objc_requires_super));


@end
