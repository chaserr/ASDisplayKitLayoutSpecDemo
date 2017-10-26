//
//  TFASDefaultTableViewItemCell.m
//  TFTableViewManager
//
//  Created by 童星 on 16/9/6.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "TFDefaultTableViewItemCellNode.h"

static CGFloat kContentHorizontalMarginSpace = 15.0;
static CGFloat kContentVerticalMarginSpace = 0.0;
static CGFloat kContentSpace = 15.0;

@interface TFDefaultTableViewItemCellNode ()

@property (nonatomic, strong) ASTextNode *textNode;

@property (nonatomic, strong) ASTextNode *detailNode;

@property (nonatomic, strong) ASImageNode *imageNode;

@end

@implementation TFDefaultTableViewItemCellNode

@dynamic tableViewItem;

+ (CGFloat)cellNodeHeightWithItem:(TFTableViewItem *)item {
    return item.cellHeight ? :44.0;
}

- (void)cellLoadSubNodes {
    [super cellLoadSubNodes];
    self.backgroundColor = [UIColor whiteColor];
    [self addSubnode:self.textNode];
    if (self.tableViewItem.image) {
        self.imageNode.image = self.tableViewItem.image;
        self.imageNode.contentMode = UIViewContentModeScaleToFill;
        [self addSubnode:self.imageNode];
    }
    NSMutableParagraphStyle *textParaStyle = [[NSMutableParagraphStyle alloc] init];
    textParaStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    NSMutableDictionary *textNodeDic = [NSMutableDictionary dictionaryWithDictionary:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:textParaStyle}];

    if (self.tableViewItem.textFont) {
        [textNodeDic setObject:self.tableViewItem.textFont forKey:NSFontAttributeName];
    }
    if (self.tableViewItem.textColor) {
        [textNodeDic setObject:self.tableViewItem.textColor forKey:NSForegroundColorAttributeName];
    }
    _textNode.attributedText = [[NSAttributedString alloc] initWithString:self.tableViewItem.text? :@"" attributes:textNodeDic];

    if (self.tableViewItem.cellStyle!=UITableViewCellStyleDefault) {
        NSMutableDictionary *detailNodeDic = [NSMutableDictionary dictionaryWithDictionary:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor lightGrayColor]}];
        NSMutableParagraphStyle *detailParaStyle = [[NSMutableParagraphStyle alloc] init];
        detailParaStyle.lineBreakMode = NSLineBreakByTruncatingTail;
        if (self.tableViewItem.detailFont) {
            [detailNodeDic setObject:self.tableViewItem.detailFont forKey:NSFontAttributeName];
        }
        if (self.tableViewItem.detailColor) {
            [detailNodeDic setObject:self.tableViewItem.detailColor forKey:NSForegroundColorAttributeName];
        }
        if (self.tableViewItem.cellStyle==UITableViewCellStyleValue1) {
            detailParaStyle.alignment = NSTextAlignmentRight;
        }
        [detailNodeDic setObject:detailParaStyle forKey:NSParagraphStyleAttributeName];
        [self addSubnode:self.detailNode];
        _detailNode.attributedText = [[NSAttributedString alloc] initWithString:self.tableViewItem.detail? :@"" attributes:detailNodeDic];
    }
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    switch (self.tableViewItem.cellStyle) {
        case UITableViewCellStyleDefault:
        {
            _textNode.flexShrink = YES;
            ASStackLayoutSpec *contentSpec = [ASStackLayoutSpec horizontalStackLayoutSpec];
            NSMutableArray *children = [NSMutableArray array];
            if (_imageNode) {

                if (_imageNode.image.size.height > constrainedSize.max.height) {
                    _imageNode.preferredFrameSize = CGSizeMake(constrainedSize.max.height, constrainedSize.max.height);
                }
               
                [children addObject:_imageNode];
            }
            [children addObject:_textNode];
            contentSpec.children = children;
            contentSpec.spacing = kContentSpace;
            contentSpec.alignItems = ASStackLayoutAlignItemsCenter;
            ASInsetLayoutSpec *insetSpec = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(kContentVerticalMarginSpace, kContentHorizontalMarginSpace, kContentVerticalMarginSpace, kContentHorizontalMarginSpace) child:contentSpec];
            return insetSpec;
        }
            break;
        case UITableViewCellStyleValue1: {
            _detailNode.flexGrow = YES;
            CGFloat textWidth = _textNode.attributedText.size.width;
            CGFloat contentWidth = constrainedSize.max.width;

            ASStackLayoutSpec *contentSpec = [ASStackLayoutSpec horizontalStackLayoutSpec];
            NSMutableArray *children = [NSMutableArray array];
            if (_imageNode) {
                if (_imageNode.image.size.height > constrainedSize.max.height) {
                    _imageNode.preferredFrameSize = CGSizeMake(constrainedSize.max.height, constrainedSize.max.height);
                }
                [children addObject:_imageNode];
                contentWidth -= constrainedSize.max.height;
            }
            if (textWidth<contentWidth) {
                _detailNode.flexShrink = YES;
            }
            else {
                _textNode.flexShrink = YES;
            }           
            [children addObject:_textNode];
            [children addObject:_detailNode];
            contentSpec.children = children;
            contentSpec.spacing = kContentSpace;
            contentSpec.alignItems = ASStackLayoutAlignItemsCenter;
            ASInsetLayoutSpec *insetSpec = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(kContentVerticalMarginSpace, kContentHorizontalMarginSpace, kContentVerticalMarginSpace, kContentHorizontalMarginSpace) child:contentSpec];
            return insetSpec;

        }
            break;
        case UITableViewCellStyleValue2: {
            @throw [NSException exceptionWithName:@"UITableViewCellStyleValue2" reason:@"UITableViewCellStyleValue2 is not support now." userInfo:nil];
            return nil;
        }
            break;
        case UITableViewCellStyleSubtitle: {

            ASStackLayoutSpec *contentVSpec = [ASStackLayoutSpec verticalStackLayoutSpec];
            contentVSpec.alignItems = ASStackLayoutAlignItemsStart;
            contentVSpec.spacing = kContentVerticalMarginSpace;
            contentVSpec.children = @[_textNode,_detailNode];
            contentVSpec.flexShrink = YES;
            NSMutableArray *children = [NSMutableArray array];
            if (_imageNode) {
                if (_imageNode.image.size.height > constrainedSize.max.height) {
                    _imageNode.preferredFrameSize = CGSizeMake(constrainedSize.max.height, constrainedSize.max.height);
                }
                [children addObject:_imageNode];
            }
            [children addObject:contentVSpec];
            ASStackLayoutSpec *contentSpec = [ASStackLayoutSpec horizontalStackLayoutSpec];
            contentSpec.alignItems = ASStackLayoutAlignItemsCenter;
            contentSpec.spacing = kContentSpace;
            contentSpec.children = children;
            
            ASInsetLayoutSpec *insetSpec = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(kContentVerticalMarginSpace, kContentHorizontalMarginSpace, kContentVerticalMarginSpace, kContentHorizontalMarginSpace) child:contentSpec];
            return insetSpec;
        }
        default:
            break;
    }
}

#pragma mark - lazy init 

- (ASTextNode *)textNode {
    if (!_textNode) {
        _textNode = [[ASTextNode alloc] init];
    }
    return _textNode;
}

- (ASTextNode *)detailNode {
    if (!_detailNode) {
        _detailNode = [[ASTextNode alloc] init];
    }
    return _detailNode;
}

- (ASImageNode *)imageNode {
    if (!_imageNode) {
        _imageNode = [[ASImageNode alloc] init];
    }
    return _imageNode;
}

@end
