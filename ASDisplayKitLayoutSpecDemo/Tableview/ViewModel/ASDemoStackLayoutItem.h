//  Created by 童星 on 16/8/6.
//  Copyright © 2016年 童星. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASDemoLayoutItem.h"

/**
 *  类描述:
 *  <#Description#>
 */

typedef enum : NSUInteger {
    EStackLayoutStyleJustifyContentStart,
    EStackLayoutStyleJustifyContentCenter,
    EStackLayoutStyleJustifyContentEnd,
    EStackLayoutStyleJustifyContentSpaceBetween,
    EStackLayoutStyleJustifyContentSpaceAround,
    
    EStackLayoutStyleAlignItemsStart,
    EStackLayoutStyleAlignItemsEnd,
    EStackLayoutStyleAlignItemsCenter,
    EStackLayoutStyleAlignItemsStretch,
    EStackLayoutStyleAlignItemsBaselineFirst,
    EStackLayoutStyleAlignItemsBaselineLast,
    
    EStackLayoutStyleAlignSelfAuto,
    EStackLayoutStyleAlignSelfStart,
    EStackLayoutStyleAlignSelfEnd,
    EStackLayoutStyleAlignSelfCenter,
    EStackLayoutStyleAlignSelfStretch,
    
    EStackLayoutStyleFlexGrow,
    EStackLayoutStyleFlexShink,
    EStackLayoutStyleSpaceBeforeAndAfter
} EStackLayoutStyle;

typedef enum : NSUInteger {
    EStackLayoutDirectionHorizontal,
    EStackLayoutDirectionVertical
} EStackLayoutDirection;

@interface ASDemoStackLayoutItem: ASDemoLayoutItem

@property (assign, nonatomic) EStackLayoutStyle     stackLayoutStyle;
@property (assign, nonatomic) EStackLayoutDirection stackLayoutDirection;

- (NSString *)stackLayoutStyleString;
- (NSString *)stackLayoutDirectionString;
@end
