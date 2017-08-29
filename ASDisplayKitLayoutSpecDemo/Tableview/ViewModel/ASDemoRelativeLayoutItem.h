//  Created by 童星 on 16/8/8.
//  Copyright © 2016年 童星. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASDemoLayoutItem.h"

/**
 *  类描述:
 *  <#Description#>
 */

typedef enum : NSUInteger {
    ERelativeLayoutTopLeft,
    ERelativeLayoutTopMiddle,
    ERelativeLayoutTopRight,
    ERelativeLayoutMiddleLeft,
    ERelativeLayoutMiddle,
    ERelativeLayoutMiddleRight,
    ERelativeLayoutBottomLeft,
    ERelativeLayoutBottomMiddle,
    ERelativeLayoutBottomRight
} ERelativeLayoutStyle;

@interface ASDemoRelativeLayoutItem: ASDemoLayoutItem

@property (assign, nonatomic) ERelativeLayoutStyle relativeLayoutStyle;
@property (copy, nonatomic) NSString *url;
@property (copy, nonatomic) NSString *tip;

@property (assign, nonatomic, readonly) ASRelativeLayoutSpecPosition horizontalPosition;
@property (assign, nonatomic, readonly) ASRelativeLayoutSpecPosition verticalPosition;
@property (assign, nonatomic, readonly) UIEdgeInsets tipInset;

@property (assign, nonatomic) BOOL displayCenterLayout;
@end
