//
//  TFTableViewItem.h
//  TFTableViewManagerDemo
//
//  Created by 童星 on 16/8/24.
//  Copyright © 2016年 童星. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class TFTableViewSection;
@class TFTableViewItem;

typedef void (^InsertionHandler)(__kindof TFTableViewItem *item, NSIndexPath *indexPath);
typedef void (^DeletionHandler)(__kindof TFTableViewItem *item, NSIndexPath *indexPath);
typedef void (^SelectionHandler)(__kindof TFTableViewItem *item, NSIndexPath *indexPath);
typedef void (^CellClickHandler)(__kindof TFTableViewItem *item ,NSInteger actionType, id sender);
typedef BOOL (^MoveHandler)(__kindof TFTableViewItem *item, NSIndexPath *sourceIndexPath, NSIndexPath *destinationIndexPath);
typedef void(^MoveCompletionHandler)(__kindof TFTableViewItem *item, NSIndexPath *sourceIndexPath, NSIndexPath *destinationIndexPath);

/**
 *  the table view item just like the model of the MV. Use the item can handle the common actions of the cell.
 */
@interface TFTableViewItem : NSObject

///-----------------------------
/// @name TFTableViewItem Properties.
///-----------------------------

/**
 *  @brief Section of the item.
 */
@property (weak, nonatomic) TFTableViewSection *section;

/**
 *  @brief tell current item can be edit.
 */
@property (nonatomic, assign) BOOL edit;

/**
 *  @brief Item cell editing style.
 */
@property (assign, nonatomic) UITableViewCellEditingStyle editingStyle;

/**
 *  @brief cell selection style, default is UITableViewCellSelectionStyleNone.
 */
@property (nonatomic, assign) UITableViewCellSelectionStyle selectionStyle;

/**
 *  @brief the separator line is sunk, default is YES.
 */
@property (nonatomic, assign) BOOL separatorSunk;

/**
 *  @brief cell accessory type.
 */
@property (nonatomic, assign) UITableViewCellAccessoryType accessoryType;

/**
 *  @brief cell accessory view.
 */
@property (nonatomic, strong) UIView *accessoryView;

/**
 *  @brief Item indexPath in table View.
 */
@property (strong, readonly, nonatomic) NSIndexPath *indexPath;

/**
 *  @brief when use UITableViewCell,not set it's cellIdentifier,will get it from cell class name.
 */
@property (nonatomic, copy) NSString *cellIdentifier;

/**
    @brief class name of item matched cell, if not set this value, it will be item class name append "Cell"/"CellNode".
 */
@property (nonatomic, copy) NSString *registerCellClassName;

/**
 *  @brief the model of this item.
 */
@property (nonatomic, strong) id model;

/**
 *  @brief title for delete confirmation button
 */
@property (nonatomic, strong) NSString *titleForDelete;

/**
 *  @brief edit actions for row.
 */
@property (nonatomic, strong) NSArray<UITableViewRowAction *> *editActions;

/**
 *  @brief the height of cell. when the value is not set, cell height is determined by autolayout or aslayoutspec of the cell.
 */
@property (nonatomic, assign) CGFloat cellHeight;

/**
 *  @brief handle item inset action.
 */
@property (copy, nonatomic) InsertionHandler insertionHandler;

/**
 *  @brief handle item delete action.you need delete the cell by yourself.
 */
@property (copy, nonatomic) DeletionHandler deletionHandler;

/**
 *  @brief handle item when selected.
 */
@property (copy, nonatomic) SelectionHandler selectionHandler;

/**
 *  @brief handle item when cell subview click.
 */
@property (copy, nonatomic) CellClickHandler cellClickHandler;

/**
 *  @brief handle item move action.
 *  @return move the item YES or NO.
 */
@property (copy, nonatomic) MoveHandler moveHandler;
/**
 *  @brief handle move completion action
 */
@property (copy, nonatomic) MoveCompletionHandler moveCompletionHandler;

///-----------------------------
/// @name Creating and Initializing a TFTableViewItem.
///-----------------------------

/**
 *  Creates and returns a new item.
 *
 *  @return A new item.
 */
+ (instancetype)item;

/**
 *  Creates and returns a new item with model.
 *
 *  @param model the model of the item.
 *
 *  @return A new item.
 */
+ (instancetype)itemWithModel:(id)model;

/**
 *  Creates and returns a new item with model and selection handler.
 *
 *  @param model            the model of the item.
 *  @param selectionHandler the item selection handler.
 *
 *  @return A new item.
 */
+ (instancetype)itemWithModel:(id)model
             selectionHandler:(SelectionHandler)selectionHandler;

/**
 *   Creates and returns a new item with model and CellClickHandler handler.
 *
 *  @param model            the model of the item.
 *  @param cellClickHandler the item cell click handler.
 *
 *  @return A new item.
 */
+ (instancetype)itemWithModel:(id)model
             cellClickHandler:(CellClickHandler)cellClickHandler;

/**
 *  Creates and returns a new item with model,SelectionHandler and CellClickHandler handler.
 *
 *  @param model            the model of the item.
 *  @param selectionHandler the item selection handler.
 *  @param cellClickHandler the item cell click handler.
 *
 *  @return A new item.
 */
+ (instancetype)itemWithModel:(id)model
             selectionHandler:(SelectionHandler)selectionHandler
             cellClickHandler:(CellClickHandler)cellClickHandler;

///-----------------------------
/// @name TFTableViewItem handle tableView row actions.
///-----------------------------

/**
 *  select the row.
 *
 *  @param animated use animation or not.
 */
- (void)selectRowAnimated:(BOOL)animated;

/**
 *  select the row with scroll position.
 *
 *  @param animated       use animation or not.
 *  @param scrollPosition scroll postion when after selecting the row.
 */
- (void)selectRowAnimated:(BOOL)animated scrollPosition:(UITableViewScrollPosition)scrollPosition;

/**
 *  deselect the row.
 *
 *  @param animated use animation or not.
 */
- (void)deselectRowAnimated:(BOOL)animated;

/**
 *  reload the row with UITableViewRowAnimation type.
 *
 *  @param animation A constant that indicates how the reloading is to be animated.
 */
- (void)reloadRowWithAnimation:(UITableViewRowAnimation)animation;

/**
 *  delete the row with UITableViewRowAnimation type.
 *
 *  @param animation A constant that indicates how the reloading is to be animated.
 */
- (void)deleteRowWithAnimation:(UITableViewRowAnimation)animation;


@end
