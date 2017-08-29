//  Created by 童星 on 16/8/11.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "Demo2ItemCellNode.h"

@interface Demo2ItemCellNode ()<ASNetworkImageNodeDelegate> {
    
    ASNetworkImageNode *_imageNode;
    ASTextNode         *_textNode;
}
@end

@implementation Demo2ItemCellNode
@dynamic tableViewItem;

- (void)cellLoadSubNodes {
    [super cellLoadSubNodes];
    
    self.backgroundColor = [UIColor whiteColor];
    
    _imageNode = [[ASNetworkImageNode alloc] init];
    _imageNode.URL = [NSURL URLWithString:self.tableViewItem.imageURL];
//    _imageNode.layerBacked = YES;
    _imageNode.delegate = self;
    [self addSubnode:_imageNode];
    
    _textNode = [[ASTextNode alloc] init];
    _textNode.attributedText = [[NSAttributedString alloc] initWithString:self.tableViewItem.content
                                                               attributes:@{ NSForegroundColorAttributeName : [UIColor blackColor],
                                                                             NSFontAttributeName            : [UIFont systemFontOfSize:16] }];
//    _textNode.layerBacked = YES;
    _textNode.maximumNumberOfLines = 0;
    _textNode.flexShrink = YES;
    _textNode.truncationMode = NSLineBreakByTruncatingTail;
    [self addSubnode:_textNode];
}

#pragma mark - 布局
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    
    CGFloat maxWidth = constrainedSize.max.width ? : [UIScreen mainScreen].bounds.size.width ;
    CGFloat imageFixedWidth = 150;
    CGFloat defaultRatio = 1.282994923857868;
    CGFloat inset = 10;
    CGFloat horizonalMargin = 10.f;
    
    // 1. imageNode的约束
    CGSize size = _imageNode.image.size;
    CGFloat ratio = _imageNode.image ? (size.height / size.width) : defaultRatio;
    ASRatioLayoutSpec *imageSpec = [ASRatioLayoutSpec ratioLayoutSpecWithRatio:ratio child:_imageNode];
    imageSpec.style.flexBasis = ASRelativeDimensionMakeWithPoints(imageFixedWidth);
    
    // 2. textNode的约束
    CGSize relativeSize = CGSizeMake(maxWidth - imageFixedWidth - 2 * inset - horizonalMargin, imageFixedWidth * ratio);
    _textNode.sizeRange = ASRelativeSizeRangeMakeWithExactCGSize(relativeSize);
    ASStaticLayoutSpec *staticTextSpec = \
    [ASStaticLayoutSpec absoluteLayoutSpecWithSizing:(ASAbsoluteLayoutSpecSizingSizeToFit) children:@[_textNode]];
    
    // 3. 主约束
    ASStackLayoutSpec *stackSpec = [ASStackLayoutSpec horizontalStackLayoutSpec];
    stackSpec.spacing = horizonalMargin;
    stackSpec.justifyContent = ASStackLayoutJustifyContentStart;
    stackSpec.children = @[imageSpec, staticTextSpec];
    
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(inset, inset, inset, inset)
                                                  child:stackSpec];
}

- (void)imageNode:(ASNetworkImageNode *)imageNode didLoadImage:(UIImage *)image {
    [self setNeedsLayout];
}

@end
