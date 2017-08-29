//
//  ASDemoLayoutItemCellNode.m
//  TimeFaceDemoProject
//
//  Created by 童星 on 16/9/12.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "ASDemoLayoutItemCellNode.h"

@interface ASDemoLayoutItemCellNode (){
    ASTextNode *_propertyNameNode;
    ASTextNode *_markNode;
    ASTextNode *_accessoryInfoNode;
}
@end

@implementation ASDemoLayoutItemCellNode
@dynamic tableViewItem;


- (void)cellLoadSubNodes {
    [super cellLoadSubNodes];
    
    if (![self isEmpty:self.tableViewItem.propertyName]) {
        _propertyNameNode                      = [[ASTextNode alloc] init];
//        _propertyNameNode.layerBacked          = YES;
        _propertyNameNode.maximumNumberOfLines = 1;
        _propertyNameNode.attributedText       = \
        [[NSAttributedString alloc] initWithString:self.tableViewItem.propertyName
                                        attributes:@{ NSForegroundColorAttributeName : [UIColor blackColor],
                                                      NSFontAttributeName            : [UIFont fontWithName:@"Menlo-Italic" size:16] }];
        [self addSubnode:_propertyNameNode];
    }
    
    if (![self isEmpty:self.tableViewItem.accessoryInfo]) {
        _accessoryInfoNode                = [[ASTextNode alloc] init];
//        _accessoryInfoNode.layerBacked    = YES;
        _accessoryInfoNode.attributedText = [[NSAttributedString alloc] initWithString:self.tableViewItem.accessoryInfo
                                                                            attributes:@{ NSForegroundColorAttributeName : [UIColor redColor],
                                                                                          NSFontAttributeName            : [UIFont systemFontOfSize:12] }];
        [self addSubnode:_accessoryInfoNode];
    }
    
    _markNode                      = [[ASTextNode alloc] init];
//    _markNode.layerBacked          = YES;
    _markNode.maximumNumberOfLines = 1;
    _markNode.style.alignSelf            = ASStackLayoutAlignSelfEnd;
    _markNode.backgroundColor      = [UIColor groupTableViewBackgroundColor];
    _markNode.cornerRadius         = 3;
    _markNode.clipsToBounds        = YES;
    [self addSubnode:_markNode];
    
}

#pragma mark - Public
- (void)updateMarkWithLine:(NSInteger)numberOfLine {
    NSString *markString = [NSString stringWithFormat:@"%@.m - %zd行", self.class ,numberOfLine];
    _markNode.attributedText = \
    [[NSAttributedString alloc] initWithString:markString
                                    attributes:@{ NSForegroundColorAttributeName : [UIColor grayColor],
                                                  NSFontAttributeName            : [UIFont fontWithName:@"Menlo-Italic" size:12] }];
}

- (void)updateAccessoryInfo:(NSString *)accessoryInfo {
    _accessoryInfoNode.attributedText = \
    [[NSAttributedString alloc] initWithString:accessoryInfo
                                    attributes:@{ NSForegroundColorAttributeName : [UIColor redColor],
                                                  NSFontAttributeName            : [UIFont systemFontOfSize:12] }];
}

- (ASLayoutSpec *)layoutOthers:(ASSizeRange)constrainedSize {
    NSAssert(1, @"此方法必须由子类重写");
    return nil;
}

#pragma mark - 布局
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    
    NSMutableArray *stacks = @[].mutableCopy;
    
    if (![self isEmpty:self.tableViewItem.propertyName] && ![self isEmpty:self.tableViewItem.accessoryInfo]) {
        
        ASLayoutSpec *spacer = [[ASLayoutSpec alloc] init];
        spacer.style.flexGrow = YES;
        
        ASStackLayoutSpec *properyLayout = [ASStackLayoutSpec horizontalStackLayoutSpec];
        properyLayout.justifyContent = ASStackLayoutJustifyContentStart;
        properyLayout.alignItems = ASStackLayoutAlignItemsBaselineLast;
        properyLayout.children = @[_propertyNameNode, spacer, _accessoryInfoNode];
        //        properyLayout.flexGrow = YES;
        [stacks addObject:properyLayout];
    }
    else if (![self isEmpty:self.tableViewItem.propertyName]) {
        [stacks addObject:_propertyNameNode];
    }
    else if (![self isEmpty:self.tableViewItem.accessoryInfo]) {
        [stacks addObject:_accessoryInfoNode];
    }
    ASLayoutSpec* spec = [self layoutOthers:constrainedSize];
    spec.style.flexGrow = YES;
    [stacks addObject:spec];
    [stacks addObject:_markNode];
    
    ASStackLayoutSpec *stack = [ASStackLayoutSpec verticalStackLayoutSpec];
    stack.justifyContent = ASStackLayoutJustifyContentStart;
    stack.alignItems = ASStackLayoutAlignItemsStretch;
    stack.style.flexGrow = YES;
    stack.spacing = 5.f;
    stack.children = stacks;
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) child:stack];
}

- (void)layout {
    [super layout];
    
}

#pragma mark - Tool
- (BOOL)isEmpty:(NSString *)string {
    return string == nil || string.length == 0;
}

@end
