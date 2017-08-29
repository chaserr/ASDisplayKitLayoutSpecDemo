//  Created by 童星 on 16/8/8.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "ASDemoRelativeLayoutItemCellNode.h"

@interface ASDemoRelativeLayoutItemCellNode () <ASNetworkImageNodeDelegate>
{
    ASDisplayNode *_backgroundNode;
    ASNetworkImageNode *_imageNode;
    ASButtonNode *_tipNode;
}
@end

@implementation ASDemoRelativeLayoutItemCellNode
@dynamic tableViewItem;

- (void)cellLoadSubNodes {
    [super cellLoadSubNodes];
    
    self.backgroundColor = [UIColor colorWithRed:226 green:230 blue:236 alpha:1];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;

    _backgroundNode                 = [[ASDisplayNode alloc] init];
//    _backgroundNode.layerBacked     = YES;
    _backgroundNode.backgroundColor = [UIColor whiteColor];
    [self addSubnode:_backgroundNode];
    
    _imageNode                    = [[ASNetworkImageNode alloc] init];
    _imageNode.URL                = [NSURL URLWithString:self.tableViewItem.url];
    _imageNode.style.preferredSize = CGSizeMake(screenWidth - 40, 150);
    _imageNode.delegate           = self;
//    _imageNode.layerBacked        = YES;
    [self addSubnode:_imageNode];
    
    CGFloat horizonalMargin    = 5.f;
    CGFloat verticalMargin     = 2.5f;
    _tipNode                   = [[ASButtonNode alloc] init];
    _tipNode.backgroundColor   = [UIColor colorWithWhite:0.2 alpha:0.8];
    [_tipNode setAttributedTitle:[[NSAttributedString alloc] initWithString:self.tableViewItem.tip
                                                                 attributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor],
                                                                               NSFontAttributeName            : [UIFont systemFontOfSize:20] }]
                        forState:UIControlStateNormal];
    _tipNode.contentEdgeInsets = UIEdgeInsetsMake(verticalMargin, horizonalMargin, verticalMargin, horizonalMargin);
    [self addSubnode:_tipNode];
    CGSize textSize = [_tipNode layoutThatFits:ASSizeRangeMake(CGSizeZero, CGSizeMake(MAXFLOAT, MAXFLOAT))].size;
    CGSize size = CGSizeMake(textSize.width + horizonalMargin, textSize.height + verticalMargin);
    _tipNode.style.width = ASLayoutSizeMake(ASRelativeDimensionMakeWithPoints(size.width),ASRelativeDimensionMakeWithPoints(size.height)).width;
    _tipNode.style.height = ASLayoutSizeMake(ASRelativeDimensionMakeWithPoints(size.width),ASRelativeDimensionMakeWithPoints(size.height)).height;
}


/**
 *  ASRelativeLayoutSpec :用来方便描述child在父空间中边角特殊位置。例如：左上角，上边界中间，右上角，左边界中间，正中间，右边界中间，左下角，下边界中间，右下角。
    ASCenterLayoutSpec :是ASRelativeLayoutSpec的子类，专用于描述child在父空间中水平居中，垂直居中，正中。
 */
- (ASLayoutSpec *)layoutOthers:(ASSizeRange)constrainedSize {
    
    ASStaticLayoutSpec *tipStaticLayout = \
    [ASStaticLayoutSpec absoluteLayoutSpecWithSizing:(ASAbsoluteLayoutSpecSizingSizeToFit) children:@[_tipNode]];
    ASInsetLayoutSpec *tipInsetLayout = \
    [ASInsetLayoutSpec insetLayoutSpecWithInsets:self.tableViewItem.tipInset
                                           child:tipStaticLayout];
    
    ASRelativeLayoutSpec *layout = nil;
    if (!self.tableViewItem.displayCenterLayout) {
        [self updateMarkWithLine:__LINE__];
        layout =\
        [ASRelativeLayoutSpec relativePositionLayoutSpecWithHorizontalPosition:self.tableViewItem.horizontalPosition
                                                              verticalPosition:self.tableViewItem.verticalPosition
                                                                  sizingOption:ASRelativeLayoutSpecSizingOptionMinimumSize
                                                                         child:tipInsetLayout];
    }
    else {
        [self updateMarkWithLine:__LINE__];
        layout = \
        [ASCenterLayoutSpec centerLayoutSpecWithCenteringOptions:ASCenterLayoutSpecCenteringXY
                                                   sizingOptions:ASCenterLayoutSpecSizingOptionDefault
                                                           child:tipInsetLayout];
    }
    
    ASOverlayLayoutSpec *tipOverlayLayout = [ASOverlayLayoutSpec overlayLayoutSpecWithChild:_imageNode
                                                                                    overlay:layout];
    
    ASInsetLayoutSpec *imageInsetLayout = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 20, 10, 20)
                                                                                 child:tipOverlayLayout];
    
    ASBackgroundLayoutSpec *backSpec = [ASBackgroundLayoutSpec backgroundLayoutSpecWithChild:imageInsetLayout
                                                                                  background:_backgroundNode];
    return  backSpec;
}



#pragma mark - ASNetworkImageNodeDelegate
- (void)imageNode:(ASNetworkImageNode *)imageNode didLoadImage:(UIImage *)image {
    [self setNeedsLayout];
}
@end
