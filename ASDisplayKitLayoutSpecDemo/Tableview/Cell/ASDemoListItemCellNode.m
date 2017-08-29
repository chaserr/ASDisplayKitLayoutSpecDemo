//
//  ASDemoListItemCellNode.m
//  TimeFaceDemoProject
//
//  Created by 童星 on 16/9/12.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "ASDemoListItemCellNode.h"

@interface ASDemoListItemCellNode (){
    ASTextNode *_titleNode;
}

@end

@implementation ASDemoListItemCellNode

@dynamic tableViewItem;

- (void)cellLoadSubNodes {
    [super cellLoadSubNodes];
    
    self.backgroundColor = [UIColor whiteColor];
    
    _titleNode = [[ASTextNode alloc] init];
    _titleNode.attributedText = [[NSAttributedString alloc] initWithString:self.tableViewItem.demoTitle
                                                                attributes:@{ NSForegroundColorAttributeName : [UIColor blackColor],
                                                                              NSFontAttributeName            : [UIFont systemFontOfSize:20] }];
    _titleNode.maximumNumberOfLines = 1;
    [self addSubnode:_titleNode];
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) child:_titleNode];
}


@end
