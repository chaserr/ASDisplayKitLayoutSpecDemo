//
//  Demo1ItemCellNode.m
//  TimeFaceDemoProject
//
//  Created by 童星 on 16/9/12.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "Demo1ItemCellNode.h"

@interface Demo1ItemCellNode ()
{
    ASNetworkImageNode *_imageNode;
    ASTextNode  *_titleNode;
    ASTextNode  *_subTitleNode;
}
@end

@implementation Demo1ItemCellNode

@dynamic tableViewItem;

- (void)cellLoadSubNodes {
    [super cellLoadSubNodes];
    
    self.backgroundColor = [UIColor whiteColor];
    
    _imageNode = [[ASNetworkImageNode alloc] init];
    _imageNode.style.preferredSize = CGSizeMake(80, 80);
    _imageNode.URL = [NSURL URLWithString:@"https://avatars1.githubusercontent.com/u/565251?v=3&s=96"];
    [self addSubnode:_imageNode];
    
    if (self.tableViewItem.hasTitle) {
        _titleNode = [[ASTextNode alloc] init];
        _titleNode.attributedText = [[NSAttributedString alloc] initWithString:@"Vancel" attributes:@{ NSForegroundColorAttributeName : [UIColor blackColor],
                                                                                                       NSFontAttributeName            : [UIFont systemFontOfSize:20] }];
//        _titleNode.layerBacked = YES;
        _titleNode.maximumNumberOfLines = 1.f;
        [self addSubnode:_titleNode];
    }
    
    _subTitleNode = [[ASTextNode alloc] init];
    _subTitleNode.attributedText = [[NSAttributedString alloc] initWithString:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat." attributes:@{ NSForegroundColorAttributeName : [UIColor blackColor],
                                                                                                                                                                                                                                                                                                                                       NSFontAttributeName            : [UIFont systemFontOfSize:20] }];
    _subTitleNode.maximumNumberOfLines = 0;
    _subTitleNode.style.flexShrink = YES;
//    _subTitleNode.layerBacked = YES;
    [self addSubnode:_subTitleNode];
    
}

#pragma mark - 布局

- (ASLayoutSpec *)layoutOthers:(ASSizeRange)constrainedSize {
    
    if (self.tableViewItem.hasTitle) {
        return [self layoutHasTitleLayoutSpec];
    }
    
    return [self layoutWithoutTitleLayoutSpec];
}

- (ASLayoutSpec *)layoutHasTitleLayoutSpec {
    [self updateMarkWithLine:__LINE__];
    [self updateAccessoryInfo:@"需要设置verticalSpec.flexShrink = YES"];
    
    ASStackLayoutSpec *verticalSpec = [ASStackLayoutSpec verticalStackLayoutSpec];
    verticalSpec.spacing = 5.f;
    verticalSpec.children = @[_titleNode, _subTitleNode];
    
    // 这里很关键，设置_subTitleNode.flexShrink = YES没有用，_subTitleNode被包装进了verticalSpec空间中，所以要对verticalSpec进行收缩，才能换行。
    verticalSpec.style.flexShrink = YES;
    
    ASStackLayoutSpec *horizonSpec = [ASStackLayoutSpec horizontalStackLayoutSpec];
    horizonSpec.spacing = 10.f;
    horizonSpec.children = @[_imageNode, verticalSpec];
    return horizonSpec;
}

- (ASLayoutSpec *)layoutWithoutTitleLayoutSpec {
    [self updateMarkWithLine:__LINE__];
    
    ASStackLayoutSpec *horizonSpec = [ASStackLayoutSpec horizontalStackLayoutSpec];
    horizonSpec.spacing = 10.f;
    horizonSpec.children = @[_imageNode, _subTitleNode];
    
    return horizonSpec;
}


@end
