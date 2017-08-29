//  Created by 童星 on 16/8/8.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "ASDemoInsetLayoutItemCellNode.h"

@interface ASDemoInsetLayoutItemCellNode ()
{
    ASDisplayNode *_backgroundNode;
    ASDisplayNode *_redNode;
}
@end

@implementation ASDemoInsetLayoutItemCellNode
@dynamic tableViewItem;

- (void)cellLoadSubNodes {
    [super cellLoadSubNodes];
    
    self.backgroundColor = [UIColor whiteColor];
    
    _backgroundNode = [[ASDisplayNode alloc] init];
    _backgroundNode.backgroundColor = [UIColor lightGrayColor];
    [self addSubnode:_backgroundNode];
    
    _redNode = [[ASDisplayNode alloc] init];
    _redNode.backgroundColor = [UIColor redColor];
    _redNode.style.preferredSize = CGSizeMake(80, 80);
    [self addSubnode:_redNode];
}

/**
 *  ASLayoutSpec :用来改变子空间的大小，该空间的大小由子空间大小 + UIEdgeInsets四个方向上的数值。该空间的位置保持子空间的位置不变。
 */
- (ASLayoutSpec *)layoutOthers:(ASSizeRange)constrainedSize {
    [self updateMarkWithLine:__LINE__];
    ASLayoutSpec *layoutSpec = nil;
    if (self.tableViewItem.insetBefore) {
        layoutSpec = (ASLayoutSpec *)_redNode;
    }
    else {
        layoutSpec = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(20, 20, 20, 20) child:_redNode];
    }
    
    ASBackgroundLayoutSpec *backgroundSpec = \
    [ASBackgroundLayoutSpec backgroundLayoutSpecWithChild:layoutSpec
                                               background:_backgroundNode];
    
    ASStackLayoutSpec *stack = \
    [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
                                            spacing:0
                                     justifyContent:ASStackLayoutJustifyContentCenter
                                         alignItems:ASStackLayoutAlignItemsStart
                                           children:@[backgroundSpec]];
    
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(20, 0, 20, 0) child:stack];
}

@end
