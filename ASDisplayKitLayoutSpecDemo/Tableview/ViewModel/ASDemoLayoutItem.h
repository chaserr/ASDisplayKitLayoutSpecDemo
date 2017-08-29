//  Created by 童星 on 16/8/6.
//  Copyright © 2016年 童星. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFTableViewItem.h"

/**
 *  类描述:
 *  layoutItem 的基类
 */

@interface ASDemoLayoutItem: TFTableViewItem
/**
 *  属性名称
 */
@property (copy, nonatomic) NSString *propertyName;

/**
 *  附属信息
 */
@property (copy, nonatomic) NSString *accessoryInfo;
@end
