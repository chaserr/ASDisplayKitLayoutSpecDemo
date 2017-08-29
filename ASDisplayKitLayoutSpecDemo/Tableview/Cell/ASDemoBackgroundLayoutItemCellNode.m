//  Created by 童星 on 16/8/7.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "ASDemoBackgroundLayoutItemCellNode.h"

@interface ASDemoBackgroundLayoutItemCellNode ()
{
    ASControlNode *_redNode;
    ASTextNode *_backgroundNode;
}
@end

@implementation ASDemoBackgroundLayoutItemCellNode
@dynamic tableViewItem;

- (void)cellLoadSubNodes {
    [super cellLoadSubNodes];
    
    self.backgroundColor = [UIColor whiteColor];
    
    _backgroundNode                 = [[ASTextNode alloc] init];
//    _backgroundNode.layerBacked     = YES;
    _backgroundNode.backgroundColor = [UIColor blueColor];
    _backgroundNode.attributedText  = [[NSAttributedString alloc] initWithString:@"我是背景"
                                                                      attributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor],
                                                                                    NSFontAttributeName            : [UIFont systemFontOfSize:20] }];
    [self addSubnode:_backgroundNode];
    
    _redNode                    = [[ASControlNode alloc] init];
    _redNode.backgroundColor    = [UIColor redColor];
    _redNode.style.preferredSize = CGSizeMake(80, 80);
    [_redNode addTarget:self action:@selector(move) forControlEvents:ASControlNodeEventTouchUpInside];
    [self addSubnode:_redNode];
}

#pragma mark - 布局
/**
 *  ASBackgroundLayoutSpec : 这种空间用来描述z轴方向上的两个空间位置关系，background空间会作为背景位于child空间正下方。整个空间的大小和background的大小由child大小决定。
 */
- (ASLayoutSpec *)layoutOthers:(ASSizeRange)constrainedSize {
    [self updateMarkWithLine:__LINE__];
    ASBackgroundLayoutSpec *backgroundSpec = \
    [ASBackgroundLayoutSpec backgroundLayoutSpecWithChild:_redNode
                                               background:_backgroundNode];
    
    ASStackLayoutSpec *stack = [ASStackLayoutSpec horizontalStackLayoutSpec];
    stack.justifyContent = ASStackLayoutJustifyContentCenter;
    stack.children = @[backgroundSpec];
    
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(20, 0, 20, 0) child:stack];
}

- (void)move {
    CABasicAnimation *moveAni = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAni.toValue = [NSValue valueWithCGPoint:CGPointMake(_redNode.position.x + 100, _redNode.position.y)];
    moveAni.duration = 3.5f;
    [_redNode.layer addAnimation:moveAni forKey:@"move"];
}

@end
