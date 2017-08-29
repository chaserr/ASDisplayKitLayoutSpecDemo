//  Created by 童星 on 16/8/7.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "ASDemoRatioLayoutItemCellNode.h"

@interface ASDemoRatioLayoutItemCellNode () <ASNetworkImageNodeDelegate>
{
    ASNetworkImageNode  *_imageNode;
    ASTextNode          *_contentNode;
}
@end

@implementation ASDemoRatioLayoutItemCellNode
@dynamic tableViewItem;

- (void)cellLoadSubNodes {
    [super cellLoadSubNodes];
    
    self.backgroundColor = [UIColor whiteColor];
    
    _imageNode             = [[ASNetworkImageNode alloc] init];
    _imageNode.URL         = [NSURL URLWithString:self.tableViewItem.url];
//    _imageNode.layerBacked = YES;
    _imageNode.delegate    = self;
    _imageNode.imageModificationBlock = ^UIImage *(UIImage *image) {
        UIImage *modifiedImage;
        CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
        
        UIGraphicsBeginImageContextWithOptions(image.size, false, [[UIScreen mainScreen] scale]);
        
        [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:20.f] addClip];
        [image drawInRect:rect];
        modifiedImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        return modifiedImage;
    };
    [self addSubnode:_imageNode];
    
    _contentNode                      = [[ASTextNode alloc] init];
    _contentNode.attributedText       = [[NSAttributedString alloc] initWithString:self.tableViewItem.content
                                                                        attributes:@{ NSForegroundColorAttributeName : [UIColor blackColor],
                                                                                      NSFontAttributeName            : [UIFont systemFontOfSize:20] }];
//    _contentNode.layerBacked          = YES;
    _contentNode.maximumNumberOfLines = 0;
    _contentNode.style.flexShrink           = YES;
    [self addSubnode:_contentNode];
}

#pragma mark - 布局
/**
 ASRatioLayoutSpec :主要用于约束空间的 高宽比。
 ratio = 0.5, 空间的宽是高的2倍。
  _ _ _ _
 |       |
 |_ _ _ _|
 
 ratio = 2.0, 空间的高是宽的2倍。
  _ _
 |   |
 |   |
 |   |
 |_ _|
 */
- (ASLayoutSpec *)layoutOthers:(ASSizeRange)constrainedSize {
    [self updateMarkWithLine:__LINE__];
    CGFloat ratio = _imageNode.image == nil ? 0.5 : _imageNode.image.size.height / _imageNode.image.size.width;
    ASRatioLayoutSpec *imageRatioSpec = [ASRatioLayoutSpec ratioLayoutSpecWithRatio:ratio
                                                                              child:_imageNode];
    
    [self updateAccessoryInfo:[NSString stringWithFormat:@"ratio = %.2f", ratio]];
    
    ASStackLayoutSpec *stackLayoutSpec =\
    [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical
                                            spacing:15.f
                                     justifyContent:ASStackLayoutJustifyContentStart
                                         alignItems:ASStackLayoutAlignItemsStart
                                           children:@[imageRatioSpec, _contentNode]];
    return stackLayoutSpec;
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 20, 10, 20) child:stackLayoutSpec];
}

#pragma mark - ASNetworkImageNodeDelegate
- (void)imageNode:(ASNetworkImageNode *)imageNode didLoadImage:(UIImage *)image {
    [self setNeedsLayout];
}
@end
