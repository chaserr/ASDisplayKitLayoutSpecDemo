//  Created by 童星 on 16/8/6.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "ASDemoStackLayoutItem.h"

@interface ASDemoStackLayoutItem ()

@end

@implementation ASDemoStackLayoutItem
@dynamic model;

- (void)setStackLayoutStyle:(EStackLayoutStyle)stackLayoutStyle {
    _stackLayoutStyle = stackLayoutStyle;
    self.propertyName = [self stackLayoutStyleString];
}

- (NSString *)stackLayoutStyleString {
    switch (self.stackLayoutStyle) {
        case EStackLayoutStyleJustifyContentStart:
            return @"JustifyContentStart";
        case EStackLayoutStyleJustifyContentCenter:
            return @"JustifyContentCenter";
        case EStackLayoutStyleJustifyContentEnd:
            return @"JustifyContentEnd";
        case EStackLayoutStyleJustifyContentSpaceBetween:
            return @"JustifyContentSpaceBetween";
        case EStackLayoutStyleJustifyContentSpaceAround:
            return @"JustifyContentSpaceAround";
            
        case EStackLayoutStyleAlignItemsStart:
            return @"AlignItemsStart";
        case EStackLayoutStyleAlignItemsEnd:
            return @"AlignItemsEnd";
        case EStackLayoutStyleAlignItemsCenter:
            return @"AlignItemsCenter";
        case EStackLayoutStyleAlignItemsStretch:
            return @"AlignItemsStretch";
        case EStackLayoutStyleAlignItemsBaselineFirst:
            return @"AlignItemsBaselineFirst";
        case EStackLayoutStyleAlignItemsBaselineLast:
            return @"AlignItemsBaselineLast";
        
        case EStackLayoutStyleAlignSelfAuto:
            return @"AlignSelfAuto";
        case EStackLayoutStyleAlignSelfStart:
            return @"AlignSelfStart";
        case EStackLayoutStyleAlignSelfEnd:
            return @"AlignSelfEnd";
        case EStackLayoutStyleAlignSelfCenter:
            return @"AlignSelfCenter";
        case EStackLayoutStyleAlignSelfStretch:
            return @"AlignSelfStretch";
            
        case EStackLayoutStyleFlexGrow:
            return @"FlexGrow";
        case EStackLayoutStyleFlexShink:
            return @"FlexShink";
        case EStackLayoutStyleSpaceBeforeAndAfter:
            return @"SpaceBeforeAndAfter";
        default:
            break;
    }
}

- (NSString *)stackLayoutDirectionString {
    switch (self.stackLayoutDirection) {
        case EStackLayoutDirectionVertical:
            return @"Vertical";
        case EStackLayoutDirectionHorizontal:
            return @"Horizontal";
    }
}

@end
