//  Created by 童星 on 16/8/8.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "ASDemoOverlayLayoutItemCellNode.h"

@interface ASDemoOverlayLayoutItemCellNode ()
{
    ASControlNode *_redNode;
    ASTextNode    *_overlayNode;
}
@end

@implementation ASDemoOverlayLayoutItemCellNode
@dynamic tableViewItem;
- (void)cellLoadSubNodes {
    [super cellLoadSubNodes];
    
    self.backgroundColor = [UIColor whiteColor];
    
    
    _redNode                    = [[ASControlNode alloc] init];
    _redNode.backgroundColor    = [UIColor redColor];
    _redNode.style.preferredSize = CGSizeMake(80, 80);
    [self addSubnode:_redNode];
    
    _overlayNode                 = [[ASTextNode alloc] init];
    _overlayNode.backgroundColor = [UIColor blueColor];
    _overlayNode.attributedText  = [[NSAttributedString alloc] initWithString:@"我是覆盖物"
                                                                   attributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor],
                                                                                 NSFontAttributeName            : [UIFont systemFontOfSize:20] }];
    
    [_overlayNode addTarget:self action:@selector(move) forControlEvents:ASControlNodeEventTouchUpInside];
    [self addSubnode:_overlayNode];
}

#pragma mark - 布局
/**
 *  ASOverlayLayoutSpec : 这种空间用来描述z轴方向上的两个空间的位置关系，overlay空间会覆盖于child空间正上方。整个空间的大小和overlay的大小由child大小决定。
 */
- (ASLayoutSpec *)layoutOthers:(ASSizeRange)constrainedSize {
    [self updateMarkWithLine:__LINE__];
    ASOverlayLayoutSpec *overlaySpec = \
    [ASOverlayLayoutSpec overlayLayoutSpecWithChild:_redNode
                                            overlay:_overlayNode];
    
    ASStackLayoutSpec *stack = [ASStackLayoutSpec horizontalStackLayoutSpec];
    stack.justifyContent = ASStackLayoutJustifyContentCenter;
    stack.children = @[overlaySpec];
    
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(20, 0, 20, 0) child:stack];
}

- (void)move {
    CABasicAnimation *moveAni = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAni.toValue = [NSValue valueWithCGPoint:CGPointMake(_overlayNode.position.x + 100, _overlayNode.position.y)];
    moveAni.duration = 3.5f;
    [_overlayNode.layer addAnimation:moveAni forKey:@"move"];
}


@end
