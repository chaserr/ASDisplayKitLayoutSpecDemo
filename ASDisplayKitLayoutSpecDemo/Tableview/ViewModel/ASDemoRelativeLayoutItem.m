//  Created by 童星 on 16/8/8.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "ASDemoRelativeLayoutItem.h"

@interface ASDemoRelativeLayoutItem ()

@end

@implementation ASDemoRelativeLayoutItem
@dynamic model;

- (void)setRelativeLayoutStyle:(ERelativeLayoutStyle)relativeLayoutStyle {
    _relativeLayoutStyle = relativeLayoutStyle;
    
    switch (relativeLayoutStyle) {
        case ERelativeLayoutTopLeft:
        {
            _horizontalPosition = ASRelativeLayoutSpecPositionStart;
            _verticalPosition   = ASRelativeLayoutSpecPositionStart;
            _tipInset = UIEdgeInsetsMake(5, 5, 0, 0);
        }
            break;
            
        case ERelativeLayoutTopMiddle:
        {
            _horizontalPosition = ASRelativeLayoutSpecPositionCenter;
            _verticalPosition   = ASRelativeLayoutSpecPositionStart;
            _tipInset = UIEdgeInsetsMake(5, 0, 0, 0);
        }
            break;
            
        case ERelativeLayoutTopRight:
        {
            _horizontalPosition = ASRelativeLayoutSpecPositionEnd;
            _verticalPosition   = ASRelativeLayoutSpecPositionStart;
            _tipInset = UIEdgeInsetsMake(5, 0, 0, 5);
        }
            break;
            
        case ERelativeLayoutMiddleLeft:
        {
            _horizontalPosition = ASRelativeLayoutSpecPositionStart;
            _verticalPosition   = ASRelativeLayoutSpecPositionCenter;
            _tipInset = UIEdgeInsetsMake(5, 0, 0, 0);
        }
            break;
            
        case ERelativeLayoutMiddle:
        {
            _horizontalPosition = ASRelativeLayoutSpecPositionCenter;
            _verticalPosition   = ASRelativeLayoutSpecPositionCenter;
            _tipInset = UIEdgeInsetsMake(0, 0, 0, 0);
        }
            break;
            
        case ERelativeLayoutMiddleRight:
        {
            _horizontalPosition = ASRelativeLayoutSpecPositionEnd;
            _verticalPosition   = ASRelativeLayoutSpecPositionCenter;
            _tipInset = UIEdgeInsetsMake(0, 0, 0, 5);
        }
            break;
            
        case ERelativeLayoutBottomLeft:
        {
            _horizontalPosition = ASRelativeLayoutSpecPositionStart;
            _verticalPosition   = ASRelativeLayoutSpecPositionEnd;
            _tipInset = UIEdgeInsetsMake(0, 5, 5, 0);
        }
            break;
            
        case ERelativeLayoutBottomMiddle:
        {
            _horizontalPosition = ASRelativeLayoutSpecPositionCenter;
            _verticalPosition   = ASRelativeLayoutSpecPositionEnd;
            _tipInset = UIEdgeInsetsMake(0, 0, 5, 0);
        }
            break;
            
        case ERelativeLayoutBottomRight:
        {
            _horizontalPosition = ASRelativeLayoutSpecPositionEnd;
            _verticalPosition   = ASRelativeLayoutSpecPositionEnd;
            _tipInset = UIEdgeInsetsMake(0, 0, 5, 5);
        }
            break;
        default:
            break;
    }
}

@end
