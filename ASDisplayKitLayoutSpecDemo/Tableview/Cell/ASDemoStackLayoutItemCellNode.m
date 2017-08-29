//  Created by 童星 on 16/8/6.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "ASDemoStackLayoutItemCellNode.h"

@interface ASDemoStackLayoutItemCellNode () {
    ASDisplayNode *_redNode;
    ASDisplayNode *_blueNode;
    ASDisplayNode *_greenNode;
    
    ASTextNode    *_rightNode;
    ASTextNode    *_leftNode;
}

@end

@implementation ASDemoStackLayoutItemCellNode
@dynamic tableViewItem;

- (void)cellLoadSubNodes {
    [super cellLoadSubNodes];
 
    self.backgroundColor = [UIColor whiteColor];
    
//    if (self.tableViewItem.stackLayoutStyle == EStackLayoutStyleAlignItemsBaselineFirst ||
//        self.tableViewItem.stackLayoutStyle == EStackLayoutStyleAlignItemsBaselineLast) {
//        _leftNode = [[ASTextNode alloc] init];
//        _leftNode.layerBacked = YES;
//        _leftNode.backgroundColor = [UIColor redColor];
//        _leftNode.attributedText = \
//        [[NSAttributedString alloc] initWithString:@"我是leftSpec"
//                                        attributes:[AppDefaultStyle aslayoutLeftStyle]];
//        [self addSubnode:_leftNode];
//        
//        _rightNode = [[ASTextNode alloc] init];
//        _rightNode.layerBacked = YES;
//        _rightNode.backgroundColor = [UIColor yellowColor];
//        _rightNode.attributedText = \
//        [[NSAttributedString alloc] initWithString:self.tableViewItem.stackLayoutStyle == EStackLayoutStyleAlignItemsBaselineFirst ? @"我和leftSpec顶部对齐" : @"我和leftSpec底部对齐"
//                                        attributes:[AppDefaultStyle aslayoutRightStyle]];
//        [self addSubnode:_rightNode];
//        
//        return;
//    }
    
    _redNode = [[ASDisplayNode alloc] init];
    _redNode.backgroundColor = [UIColor redColor];
    _redNode.style.preferredSize = CGSizeMake(50, 50);
//    _redNode.layerBacked = YES;
    [self addSubnode:_redNode];
    
    _blueNode = [[ASDisplayNode alloc] init];
    _blueNode.backgroundColor = [UIColor blueColor];
    _blueNode.style.preferredSize = CGSizeMake(60, 60);
//    _blueNode.layerBacked = YES;
    [self addSubnode:_blueNode];
    
    _greenNode = [[ASDisplayNode alloc] init];
    _greenNode.backgroundColor = [UIColor greenColor];
    _greenNode.style.preferredSize = CGSizeMake(100, 100);
//    _greenNode.layerBacked = YES;
    [self addSubnode:_greenNode];
}

- (ASLayoutSpec *)layoutOthers:(ASSizeRange)constrainedSize {
    NSString *aSelectorName = [NSString stringWithFormat:@"layout%@", [self.tableViewItem stackLayoutStyleString]];
    ASLayoutSpec *stackLayoutSpec = [self performSelector:NSSelectorFromString(aSelectorName)];
    return stackLayoutSpec;
}

#pragma mark - Tool
- (ASStackLayoutDirection)layoutDirection {
    return self.tableViewItem.stackLayoutDirection == EStackLayoutDirectionHorizontal ? ASStackLayoutDirectionHorizontal : ASStackLayoutDirectionVertical;
}

/**
    ASStackLayoutSpec :主要用于描述空间之间左右或者上下位置关系。
 *  Stack空间分为2个轴，主轴 和 十字轴，主轴的方向和ASStackLayoutDirection平行。
        如果ASStackLayoutDirection是水平方向，则主轴方向自左向右，十字轴方向自上向下。
        如果ASStackLayoutDirection是垂直方向，则主轴方向自上向下，十字轴方向自左向右。
 
    ASStackLayoutJustifyContent :这个属性，用于描述主轴方向上子空间的排列方式。
        ASStackLayoutJustifyContentStart : 在主轴方向上，在父空间中居左排列。
        ASStackLayoutJustifyContentCenter : 在主轴方向上，在父空间中居中排列。
        ASStackLayoutJustifyContentEnd : 在主轴方向上，在父空间中居右排列。
        ASStackLayoutJustifyContentSpaceBetween : 在主轴方向上，在父空间中等间距排列，
        ASStackLayoutJustifyContentSpaceAround : 在主轴方向上，在父空间中每个空间左右间距相等排列。
    
    ASStackLayoutAlignItems :这个属性，用于描述主轴方向上子空间的排列方式。
        ASStackLayoutAlignItemsStart : 在十字轴方向上，居顶排列
        ASStackLayoutAlignItemsEnd   : 在十字轴方向上，居底排列
        ASStackLayoutAlignItemsCenter ：在十字轴方向上，居中排列
        ASStackLayoutAlignItemsStretch : 在十字轴方向上，填充满父空间。
 */
- (ASLayoutSpec *)layoutJustifyContentStart {
    [self updateMarkWithLine:__LINE__];
    
    _redNode.style.preferredSize = CGSizeMake(50, 50);
    _blueNode.style.preferredSize = CGSizeMake(50, 50);
    _greenNode.style.preferredSize = CGSizeMake(50, 50);
    
    ASStackLayoutSpec *stackLayoutSpec =\
    [ASStackLayoutSpec stackLayoutSpecWithDirection:[self layoutDirection]
                                            spacing:5.f
                                     justifyContent:ASStackLayoutJustifyContentStart
                                         alignItems:ASStackLayoutAlignItemsStart
                                           children:@[_redNode, _blueNode, _greenNode]];
    return stackLayoutSpec;
}

- (ASLayoutSpec *)layoutJustifyContentCenter {
    [self updateMarkWithLine:__LINE__];
    
    _redNode.style.preferredSize = CGSizeMake(50, 50);
    _blueNode.style.preferredSize = CGSizeMake(50, 50);
    _greenNode.style.preferredSize = CGSizeMake(50, 50);
    
    ASStackLayoutSpec *stackLayoutSpec =\
    [ASStackLayoutSpec stackLayoutSpecWithDirection:[self layoutDirection]
                                            spacing:5.f
                                     justifyContent:ASStackLayoutJustifyContentCenter
                                         alignItems:ASStackLayoutAlignItemsStart
                                           children:@[_redNode, _blueNode, _greenNode]];
    return stackLayoutSpec;
}

- (ASLayoutSpec *)layoutJustifyContentEnd {
    [self updateMarkWithLine:__LINE__];
    
    _redNode.style.preferredSize = CGSizeMake(50, 50);
    _blueNode.style.preferredSize = CGSizeMake(50, 50);
    _greenNode.style.preferredSize = CGSizeMake(50, 50);
    
    ASStackLayoutSpec *stackLayoutSpec =\
    [ASStackLayoutSpec stackLayoutSpecWithDirection:[self layoutDirection]
                                            spacing:5.f
                                     justifyContent:ASStackLayoutJustifyContentEnd
                                         alignItems:ASStackLayoutAlignItemsStart
                                           children:@[_redNode, _blueNode, _greenNode]];
    return stackLayoutSpec;
}

- (ASLayoutSpec *)layoutJustifyContentSpaceBetween {
    [self updateMarkWithLine:__LINE__];
    
    _redNode.style.preferredSize = CGSizeMake(50, 50);
    _blueNode.style.preferredSize = CGSizeMake(50, 50);
    _greenNode.style.preferredSize = CGSizeMake(50, 50);
    
    ASStackLayoutSpec *stackLayoutSpec =\
    [ASStackLayoutSpec stackLayoutSpecWithDirection:[self layoutDirection]
                                            spacing:5.f
                                     justifyContent:ASStackLayoutJustifyContentSpaceBetween
                                         alignItems:ASStackLayoutAlignItemsStart
                                           children:@[_redNode, _blueNode, _greenNode]];
    return stackLayoutSpec;
}

- (ASLayoutSpec *)layoutJustifyContentSpaceAround {
    [self updateMarkWithLine:__LINE__];
    
    
    _redNode.style.preferredSize = CGSizeMake(50, 50);
    _blueNode.style.preferredSize = CGSizeMake(50, 50);
    _greenNode.style.preferredSize = CGSizeMake(50, 50);
    
    ASStackLayoutSpec *stackLayoutSpec =\
    [ASStackLayoutSpec stackLayoutSpecWithDirection:[self layoutDirection]
                                            spacing:5.f
                                     justifyContent:ASStackLayoutJustifyContentSpaceAround
                                         alignItems:ASStackLayoutAlignItemsStart
                                           children:@[_redNode, _blueNode, _greenNode]];
    return stackLayoutSpec;
}

/**
 *  十字轴对齐方式
 */
- (ASLayoutSpec *)layoutAlignItemsStart {
    [self updateMarkWithLine:__LINE__];
    ASStackLayoutSpec *stackLayoutSpec =\
    [ASStackLayoutSpec stackLayoutSpecWithDirection:[self layoutDirection]
                                            spacing:5.f
                                     justifyContent:ASStackLayoutJustifyContentStart
                                         alignItems:ASStackLayoutAlignItemsStart
                                           children:@[_redNode, _blueNode, _greenNode]];
    return stackLayoutSpec;
}

- (ASLayoutSpec *)layoutAlignItemsEnd {
    [self updateMarkWithLine:__LINE__];
    ASStackLayoutSpec *stackLayoutSpec =\
    [ASStackLayoutSpec stackLayoutSpecWithDirection:[self layoutDirection]
                                            spacing:5.f
                                     justifyContent:ASStackLayoutJustifyContentStart
                                         alignItems:ASStackLayoutAlignItemsEnd
                                           children:@[_redNode, _blueNode, _greenNode]];
    return stackLayoutSpec;
}

- (ASLayoutSpec *)layoutAlignItemsCenter {
    [self updateMarkWithLine:__LINE__];
    ASStackLayoutSpec *stackLayoutSpec =\
    [ASStackLayoutSpec stackLayoutSpecWithDirection:[self layoutDirection]
                                            spacing:5.f
                                     justifyContent:ASStackLayoutJustifyContentStart
                                         alignItems:ASStackLayoutAlignItemsCenter
                                           children:@[_redNode, _blueNode, _greenNode]];
    return stackLayoutSpec;
}

- (ASLayoutSpec *)layoutAlignItemsStretch {
    [self updateMarkWithLine:__LINE__];
    ASStackLayoutSpec *stackLayoutSpec =\
    [ASStackLayoutSpec stackLayoutSpecWithDirection:[self layoutDirection]
                                            spacing:5.f
                                     justifyContent:ASStackLayoutJustifyContentStart
                                         alignItems:ASStackLayoutAlignItemsStretch
                                           children:@[_redNode, _blueNode, _greenNode]];
    return stackLayoutSpec;
}


// ---------------
//- (ASLayoutSpec *)layoutAlignItemsBaselineFirst {
//    [self updateMarkWithLine:__LINE__];
//    ASStackLayoutSpec *stackLayoutSpec =\
//    [ASStackLayoutSpec stackLayoutSpecWithDirection:[self layoutDirection]
//                                            spacing:5.f
//                                     justifyContent:ASStackLayoutJustifyContentStart
//                                         alignItems:ASStackLayoutAlignItemsBaselineFirst
//                                           children:@[_leftNode, _rightNode]];
//    return stackLayoutSpec;
//}
//
//- (ASLayoutSpec *)layoutAlignItemsBaselineLast {
//    [self updateMarkWithLine:__LINE__];
//    ASStackLayoutSpec *stackLayoutSpec =\
//    [ASStackLayoutSpec stackLayoutSpecWithDirection:[self layoutDirection]
//                                            spacing:5.f
//                                     justifyContent:ASStackLayoutJustifyContentStart
//                                         alignItems:ASStackLayoutAlignItemsBaselineLast
//                                           children:@[_leftNode, _rightNode]];
//    return stackLayoutSpec;
//}
// -----------------

/**
 *  AlignSelf :用于调整单个空间在十字轴上的对齐方式。
 */
- (ASLayoutSpec *)layoutAlignSelfAuto {
    [self updateMarkWithLine:__LINE__];
    
    _redNode.style.alignSelf = ASStackLayoutAlignSelfAuto;
    ASStackLayoutSpec *stackLayoutSpec =\
    [ASStackLayoutSpec stackLayoutSpecWithDirection:[self layoutDirection]
                                            spacing:5.f
                                     justifyContent:ASStackLayoutJustifyContentStart
                                         alignItems:ASStackLayoutAlignItemsStart
                                           children:@[_redNode, _blueNode, _greenNode]];
    return stackLayoutSpec;
}

- (ASLayoutSpec *)layoutAlignSelfStart {
    
    [self updateMarkWithLine:__LINE__];
    
    _redNode.style.alignSelf = ASStackLayoutAlignSelfStart;
    
    ASStackLayoutSpec *stackLayoutSpec =\
    [ASStackLayoutSpec stackLayoutSpecWithDirection:[self layoutDirection]
                                            spacing:5.f
                                     justifyContent:ASStackLayoutJustifyContentStart
                                         alignItems:ASStackLayoutAlignItemsEnd
                                           children:@[_redNode, _blueNode, _greenNode]];
    return stackLayoutSpec;
}

- (ASLayoutSpec *)layoutAlignSelfEnd {
    [self updateMarkWithLine:__LINE__];
    
    _redNode.style.alignSelf = ASStackLayoutAlignSelfEnd;
    
    ASStackLayoutSpec *stackLayoutSpec =\
    [ASStackLayoutSpec stackLayoutSpecWithDirection:[self layoutDirection]
                                            spacing:5.f
                                     justifyContent:ASStackLayoutJustifyContentStart
                                         alignItems:ASStackLayoutAlignItemsStart
                                           children:@[_redNode, _blueNode, _greenNode]];
    return stackLayoutSpec;
}

- (ASLayoutSpec *)layoutAlignSelfCenter {
    [self updateMarkWithLine:__LINE__];
    
    _redNode.style.alignSelf = ASStackLayoutAlignSelfCenter;
    
    ASStackLayoutSpec *stackLayoutSpec =\
    [ASStackLayoutSpec stackLayoutSpecWithDirection:[self layoutDirection]
                                            spacing:5.f
                                     justifyContent:ASStackLayoutJustifyContentStart
                                         alignItems:ASStackLayoutAlignItemsStart
                                           children:@[_redNode, _blueNode, _greenNode]];
    return stackLayoutSpec;
}

- (ASLayoutSpec *)layoutAlignSelfStretch {
    [self updateMarkWithLine:__LINE__];
    
    _redNode.style.alignSelf = ASStackLayoutAlignSelfStretch;
    
    ASStackLayoutSpec *stackLayoutSpec =\
    [ASStackLayoutSpec stackLayoutSpecWithDirection:[self layoutDirection]
                                            spacing:5.f
                                     justifyContent:ASStackLayoutJustifyContentStart
                                         alignItems:ASStackLayoutAlignItemsStart
                                           children:@[_redNode, _blueNode, _greenNode]];
    return stackLayoutSpec;
}

/**
 *  该属性表示，当该空间比父空间小时，则可以在当前栈方向上扩展自身，直至在当前方向上填满父空间。
 */
- (ASLayoutSpec *)layoutFlexGrow {
    [self updateMarkWithLine:__LINE__];
    
    _redNode.style.preferredSize = CGSizeMake(50, 50);
    _blueNode.style.preferredSize = CGSizeMake(50, 50);
    _greenNode.style.preferredSize = CGSizeMake(50, 50);
    
    _redNode.style.flexGrow = YES;
    _blueNode.style.flexGrow = YES;
    
    ASStackLayoutSpec *stackLayoutSpec =\
    [ASStackLayoutSpec stackLayoutSpecWithDirection:[self layoutDirection]
                                            spacing:5.f
                                     justifyContent:ASStackLayoutJustifyContentStart
                                         alignItems:ASStackLayoutAlignItemsBaselineLast
                                           children:@[_redNode, _blueNode, _greenNode]];
    return stackLayoutSpec;
}

/**
 *  该属性表示，当该空间比父空间大时，则可以在当前栈方向上缩小自己，直至在当前方向上填满父空间。
 */
- (ASLayoutSpec *)layoutFlexShink {
    [self updateMarkWithLine:__LINE__];
    
    _blueNode.style.preferredSize = CGSizeMake(50, 50);
    _greenNode.style.preferredSize = CGSizeMake(50, 50);
    _redNode.style.preferredSize = CGSizeMake(500, 50);
    _redNode.style.flexShrink = YES;
    
    ASStackLayoutSpec *stackLayoutSpec =\
    [ASStackLayoutSpec stackLayoutSpecWithDirection:[self layoutDirection]
                                            spacing:5.f
                                     justifyContent:ASStackLayoutJustifyContentStart
                                         alignItems:ASStackLayoutAlignItemsBaselineLast
                                           children:@[_redNode, _blueNode, _greenNode]];
    return stackLayoutSpec;
}

/**
 *  spacingAfter 和 spacingBefore 与栈方向有关：
    如果是水平方向，before表示前面的间距，after表示后面的间距。
    如果是垂直方向，before表示上面的间距，after表示下面的间距。
 */
- (ASLayoutSpec *)layoutSpaceBeforeAndAfter {
    [self updateMarkWithLine:__LINE__];
    
    _redNode.style.spacingAfter = 50.f;
    _greenNode.style.spacingBefore = 20.f;
    
    ASStackLayoutSpec *stackLayoutSpec =\
    [ASStackLayoutSpec stackLayoutSpecWithDirection:[self layoutDirection]
                                            spacing:5.f
                                     justifyContent:ASStackLayoutJustifyContentStart
                                         alignItems:ASStackLayoutAlignItemsBaselineLast
                                           children:@[_redNode, _blueNode, _greenNode]];
    return stackLayoutSpec;
}

#pragma mark - Tool
//- (void)addRedTitleNode:(NSString *)title {
//    ASTextNode *redTitleNode = [[ASTextNode alloc] init];
//    redTitleNode.attributedText = \
//    [[NSAttributedString alloc] initWithString:title
//                                    attributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor],
//                                                  NSFontAttributeName            : [UIFont systemFontOfSize:14]}];
//    redTitleNode.maximumNumberOfLines = 1;
//    [_redNode addSubnode:redTitleNode];
//
//    _redNode.layoutSpecBlock = ^ ASLayoutSpec *(ASDisplayNode * _Nonnull node, ASSizeRange constrainedSize) {
//        return [ASCenterLayoutSpec centerLayoutSpecWithCenteringOptions:ASCenterLayoutSpecCenteringXY
//                                                          sizingOptions:ASCenterLayoutSpecSizingOptionMinimumY
//                                                                  child:redTitleNode];
//    };
//    
////    CGSize size = CGSizeMake(50, 50);
//    // 固定redNode 的大小
//    ASRelativeSize min = ASRelativeSizeMake(ASRelativeDimensionMakeWithPoints(50),ASRelativeDimensionMakeWithPoints(50));
//    ASRelativeSize max = ASRelativeSizeMake(ASRelativeDimensionMakeWithPoints(50),ASRelativeDimensionMakeWithPoints(50));
//    _redNode.sizeRange = ASRelativeSizeRangeMake(min, max);
//}

@end
