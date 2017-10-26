//
//  TFDefaultTableViewItem.h
//  TFTableViewManagerDemo
//
//  Created by 童星 on 16/9/5.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "TFTableViewItem.h"

@interface TFDefaultTableViewItem : TFTableViewItem

/**
 *  @brief cell style, default is UITableViewCellStyleDefault.
 */
@property (nonatomic, assign) UITableViewCellStyle cellStyle;

/**
 *  @brief the display image of the imageView in cell.
 */
@property (nonatomic, strong) UIImage *image;

/**
 *  @brief the display text of the textLabel in cell.
 */
@property (nonatomic, strong) NSString *text;

/**
 *  @brief the display font of the textLabel in cell.
 */
@property (nonatomic, strong) UIFont *textFont;

/**
 *  @brief the display text color of the textLabel in cell.
 */
@property (nonatomic, strong) UIColor *textColor;

/**
 *  @brief the display text of the detailTextLabel in cell.
 */
@property (nonatomic, strong) NSString *detail;

/**
 *  @brief the dispaly text font of the detailTextLabel in cell.
 */
@property (nonatomic, strong) UIFont *detailFont;

/**
 *  @brief the display text color of the detailTextLabel in cell.
 */
@property (nonatomic, strong) UIColor *detailColor;

@end
