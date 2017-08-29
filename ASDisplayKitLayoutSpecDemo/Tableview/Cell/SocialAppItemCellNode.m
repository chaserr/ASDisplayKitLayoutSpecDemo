//
//  SocialAppItemCellNode.m
//  TimeFaceDemoProject
//
//  Created by 童星 on 16/9/12.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "SocialAppItemCellNode.h"
#import "LikesNode.h"
#import "CommentsNode.h"

@interface SocialAppItemCellNode () <ASNetworkImageNodeDelegate, ASTextNodeDelegate>
{
    ASNetworkImageNode  *_avatarNode;
    ASTextNode          *_nameNode;
    ASTextNode          *_userNameNode;
    ASImageNode         *_viaNode;
    ASTextNode          *_timeNode;
    ASTextNode          *_postNode;
    ASNetworkImageNode  *_mediaNode;
    LikesNode           *_likesNode;
    CommentsNode        *_commentNode;
    ASImageNode         *_optionNode;
}
@end

@implementation SocialAppItemCellNode

@dynamic tableViewItem;

- (void)cellLoadSubNodes {
    [super cellLoadSubNodes];
    
    self.backgroundColor = [UIColor whiteColor];
    
    _avatarNode = [[ASNetworkImageNode alloc] init];
    _avatarNode.backgroundColor = ASDisplayNodeDefaultPlaceholderColor();
    _avatarNode.URL = [NSURL URLWithString:self.tableViewItem.model.photo];
    _avatarNode.style.preferredSize = CGSizeMake(44.f, 44.f);
    _avatarNode.cornerRadius = 22.f;
    _avatarNode.imageModificationBlock = ^ UIImage * (UIImage *image){
        
        UIImage *modifiedImage;
        CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
        
        UIGraphicsBeginImageContextWithOptions(image.size, false, [[UIScreen mainScreen] scale]);
        
        [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:44.0] addClip];
        [image drawInRect:rect];
        modifiedImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        return modifiedImage;
        
    };
    [self addSubnode:_avatarNode];
    
    _nameNode = [[ASTextNode alloc] init];
    _nameNode.attributedText = [[NSAttributedString alloc] initWithString:self.tableViewItem.model.name
                                                               attributes:@{
                                                                            NSFontAttributeName : [UIFont boldSystemFontOfSize:15.0],
                                                                            NSForegroundColorAttributeName: [UIColor blackColor]
                                                                            }];
    _nameNode.maximumNumberOfLines = 1;
    [self addSubnode:_nameNode];
    
    _userNameNode = [[ASTextNode alloc] init];
    _userNameNode.attributedText = [[NSAttributedString alloc] initWithString:self.tableViewItem.model.username
                                                                   attributes:@{
                                                                                NSFontAttributeName : [UIFont systemFontOfSize:13.0],
                                                                                NSForegroundColorAttributeName: [UIColor lightGrayColor]
                                                                                }];
    _userNameNode.maximumNumberOfLines = 1;
    _userNameNode.style.flexShrink = YES;
    _userNameNode.truncationMode = NSLineBreakByTruncatingTail;
    [self addSubnode:_userNameNode];
    
    if (self.tableViewItem.model.via > 0) {
        _viaNode = [[ASImageNode alloc] init];
        _viaNode.image = self.tableViewItem.model.via == 1 ?  [UIImage imageNamed:@"icon_ios.png"] : [UIImage imageNamed:@"icon_android.png"];
        [self addSubnode:_viaNode];
    }
    
    _timeNode = [[ASTextNode alloc] init];
    _timeNode.attributedText = [[NSAttributedString alloc] initWithString:self.tableViewItem.model.time
                                                               attributes:@{
                                                                            NSFontAttributeName : [UIFont systemFontOfSize:13.0],
                                                                            NSForegroundColorAttributeName: [UIColor grayColor]
                                                                            }];
    _timeNode.maximumNumberOfLines = 1;
    [self addSubnode:_timeNode];
    
    
    if (self.tableViewItem.model.post.length) {
        _postNode = [[ASTextNode alloc] init];
        _postNode.maximumNumberOfLines = 0;
        _postNode.style.flexShrink = YES;
        NSString *kAttrbuteLinkName = @"kAttrbuteLinkName";
        
        NSMutableAttributedString *attributeString = \
        [[NSMutableAttributedString alloc] initWithString:self.tableViewItem.model.post
                                               attributes:@{
                                                            NSFontAttributeName : [UIFont systemFontOfSize:15.0],
                                                            NSForegroundColorAttributeName: [UIColor blackColor]
                                                            }];
        
        NSDataDetector *detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:nil];
        [detector enumerateMatchesInString:self.tableViewItem.model.post
                                   options:kNilOptions
                                     range:NSMakeRange(0, self.tableViewItem.model.post.length)
                                usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
                                    if (result.resultType == NSTextCheckingTypeLink) {
                                        NSMutableDictionary *linkAttribte = @{
                                                                              NSFontAttributeName : [UIFont systemFontOfSize:15.0],
                                                                              NSForegroundColorAttributeName: [UIColor colorWithRed:59.0/255.0 green:89.0/255.0 blue:152.0/255.0 alpha:1.0],
                                                                              NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)
                                                                              }.mutableCopy;
                                        linkAttribte[kAttrbuteLinkName] = result.URL;
                                        [attributeString addAttributes:linkAttribte range:result.range];
                                    }
                                }];
        _postNode.attributedText = attributeString;
        _postNode.delegate = self;
        _postNode.passthroughNonlinkTouches = YES;
        _postNode.linkAttributeNames = @[ kAttrbuteLinkName ];
        _postNode.userInteractionEnabled = YES;
        [self addSubnode:_postNode];
    }
    
    
    if (self.tableViewItem.model.media.length) {
        _mediaNode = [[ASNetworkImageNode alloc] init];
        _mediaNode.backgroundColor = ASDisplayNodeDefaultPlaceholderColor();
        _mediaNode.URL = [NSURL URLWithString:self.tableViewItem.model.media];
        _mediaNode.cornerRadius = 8.f;
        _mediaNode.delegate = self;
        _mediaNode.imageModificationBlock = ^ UIImage * (UIImage *image){
            UIImage *modifiedImage;
            CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
            UIGraphicsBeginImageContextWithOptions(image.size, false, [[UIScreen mainScreen] scale]);
            [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:8.0] addClip];
            [image drawInRect:rect];
            modifiedImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            return modifiedImage;
        };
        [self addSubnode:_mediaNode];
    }
    
    _likesNode = [[LikesNode alloc] initWithLikesCount:self.tableViewItem.model.likes];
    [self addSubnode:_likesNode];
    
    _commentNode = [[CommentsNode alloc] initWithCommentsCount:self.tableViewItem.model.comments];
    [self addSubnode:_commentNode];
    
    _optionNode = [[ASImageNode alloc] init];
    _optionNode.image = [UIImage imageNamed:@"icon_more"];
    [self addSubnode:_optionNode];
}

#pragma mark - 布局
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    
    ASLayoutSpec *spacer = [[ASLayoutSpec alloc] init];
    spacer.style.flexGrow = YES;
    
    ASInsetLayoutSpec *insetSpace = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsZero child:spacer];
    //    insetSpace.flexGrow = YES;
    
    NSMutableArray *nameSpecs = @[_nameNode, _userNameNode, insetSpace].mutableCopy;
    if (self.tableViewItem.model.via > 0) {
        [nameSpecs addObject:_viaNode];
    }
    [nameSpecs addObject:_timeNode];
    
    ASStackLayoutSpec *nameStack = [ASStackLayoutSpec horizontalStackLayoutSpec];
    nameStack.justifyContent = ASStackLayoutJustifyContentStart;
    nameStack.alignItems = ASStackLayoutAlignItemsCenter;
    nameStack.spacing = 3.f;
    nameStack.children = nameSpecs;
    nameStack.style.alignSelf = ASStackLayoutAlignSelfStretch;
    
    ASLayoutSpec *toolSpec = [self toolSpec];
    
    NSMutableArray *mainSpecs = @[nameStack, _postNode].mutableCopy;
    if (self.tableViewItem.model.media.length) {
        ASLayoutSpec *imageSpec = [self imageSpec];
        imageSpec.style.spacingBefore = 5.f;
        imageSpec.style.spacingAfter = 5.f;
        [mainSpecs addObject:imageSpec];
    }
    [mainSpecs addObject:toolSpec];
    
    ASStackLayoutSpec *mainStack = [ASStackLayoutSpec verticalStackLayoutSpec];
    mainStack.justifyContent = ASStackLayoutJustifyContentStart;
    mainStack.alignItems = ASStackLayoutAlignItemsStretch;
    mainStack.spacing = 5.f;
    mainStack.children = mainSpecs;
    mainStack.style.flexShrink = YES;
    
    
    ASStackLayoutSpec *avaterStack = [ASStackLayoutSpec horizontalStackLayoutSpec];
    avaterStack.justifyContent = ASStackLayoutJustifyContentStart;
    avaterStack.alignItems = ASStackLayoutAlignItemsStart;
    avaterStack.spacing = 8.f;
    avaterStack.children = @[_avatarNode, mainStack];
    
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(5, 10, 10, 10) child:avaterStack];
}

- (ASLayoutSpec *)toolSpec {
    ASStackLayoutSpec *stack = [ASStackLayoutSpec horizontalStackLayoutSpec];
    stack.justifyContent = ASStackLayoutJustifyContentStart;
    stack.alignItems = ASStackLayoutAlignItemsStart;
    stack.children = @[_likesNode, _commentNode, _optionNode];
    return stack;
}

- (ASLayoutSpec *)imageSpec {
    CGSize size = _mediaNode.image.size;
    CGFloat ratio = _mediaNode.image ? (size.height / size.width) : 0.5;
    return [ASRatioLayoutSpec ratioLayoutSpecWithRatio:ratio child:_mediaNode];
}

#pragma mark - ASTextNodeDelegte
// 高亮文字是否可以点
- (BOOL)textNode:(ASTextNode *)textNode shouldHighlightLinkAttribute:(NSString *)attribute value:(id)value atPoint:(CGPoint)point {
    return YES;
}

// 点击高亮文字的回调
- (void)textNode:(ASTextNode *)textNode tappedLinkAttribute:(NSString *)attribute value:(id)value atPoint:(CGPoint)point textRange:(NSRange)textRange {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[value absoluteString]] options:@{} completionHandler:nil];
}

//- (BOOL)textNode:(ASTextNode *)textNode shouldLongPressLinkAttribute:(NSString *)attribute value:(id)value atPoint:(CGPoint)point {
//    return YES;
//}

#pragma mark - ASNetworkImageNodeDelegate

- (void)imageNode:(ASNetworkImageNode *)imageNode didLoadImage:(UIImage *)image
{
    [self setNeedsLayout];
}


@end
