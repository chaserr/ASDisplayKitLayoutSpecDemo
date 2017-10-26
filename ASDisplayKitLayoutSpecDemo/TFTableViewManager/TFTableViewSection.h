//
//  TFTableViewSection.h
//  TFTableViewManagerDemo
//
//  Created by 童星 on 16/8/24.
//  Copyright © 2016年 童星. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class TFTableViewManager;
@class ASDisplayNode;
@class TFTableViewItem;

/**
 *  the table view section handler.
 */
@interface TFTableViewSection : NSObject

///-----------------------------
/// @name TFTableViewSection Properties.
///-----------------------------

/**
 *  @brief An array of section items (rows).
 */
@property (strong, readonly, nonatomic) NSArray<__kindof TFTableViewItem *> *items;

/**
 *  @brief The title of the header of the specified section of the table view.
 */
@property (copy, nonatomic) NSString *headerTitle;

/**
 *  @brief The title of the footer of the specified section of the table view.
 */
@property (copy, nonatomic) NSString *footerTitle;

/**
 *  @brief The height of the header of the specified section of the table view.
 */
@property (assign, nonatomic) CGFloat headerHeight;

/**
 *  @brief The height of the footer of the specified section of the table view.
 */
@property (assign, nonatomic) CGFloat footerHeight;

/**
 *  @brief A view object to display in the header of the specified section of the table view.
 */
@property (strong, nonatomic) UIView *headerView;

/**
 *  @brief A node object to display in the header of the specified section of the table view.
 */
@property (strong, nonatomic) ASDisplayNode *headerNode;

/**
 *  @brief The reuse identifier when you use UITableViewHeaderFooterView to create a headerView.
 */
@property (strong, nonatomic) NSString *headerReuseIdentifier;

/**
 *  @brief A view object to display in the footer of the specified section of the table view.
 */
@property (strong, nonatomic) UIView *footerView;

/**
 *  @brief A node object to display in the footer of the specified section of the table view.
 */
@property (strong, nonatomic) ASDisplayNode *footerNode;
/**
 *  @brief The reuse identifier when you use UITableViewHeaderFooterView to create a footerView.
 */
@property (strong, nonatomic) NSString *footerReuseIdentifier;


/**
 *  @brief The table view manager of this section.
 */
@property (weak, nonatomic) TFTableViewManager *tableViewManager;

/**
 *  @brief Section index in table View.
 */
@property (assign, readonly, nonatomic) NSUInteger index;

/**
 *  @brief Section index title.
 */
@property (copy, nonatomic) NSString *indexTitle;

/**
 *  @brief tell table which section corresponds to section title/index.
 */
@property (assign, nonatomic) NSUInteger sectionIndex;


///-----------------------------
/// @name Creating and Initializing a TFTableViewSection.
///-----------------------------

/**
 *  Initializes a newly allocated section and sets header title.
 *
 *  @param headerTitle A header title.
 *
 *  @return A new section initialized with a header title.
 */
- (instancetype)initWithHeaderTitle:(NSString *)headerTitle;

/**
 *  Initializes a newly allocated section and sets footer title.
 *
 *  @param footerTitle A footer title.
 *
 *  @return A new section initialized with a footer title.
 */
- (instancetype)initWithFooterTitle:(NSString *)footerTitle;

/**
 *  Initializes a newly allocated section with header and footer titles.
 *
 *  @param headerTitle A header title.
 *  @param footerTitle A footer title.
 *
 *  @return A new section initialized with header and footer titles.
 */
- (instancetype)initWithHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle;

/**
 *  Initializes a newly allocated section containing a header view.
 *
 *  @param headerView A header view.
 *
 *  @return A new section initialized containing a header view.
 */
- (instancetype)initWithHeaderView:(UIView *)headerView;

/**
 *  Initializes a newly allocated section containing a footer view.
 *
 *  @param footerView A footer view.
 *
 *  @return A new section initialized containing a footer view.
 */
- (instancetype)initWithFooterView:(UIView *)footerView;

/**
 *  Initializes a newly allocated section containing header and footer views.
 *
 *  @param headerView A header view.
 *  @param footerView A footer view.
 *
 *  @return A new section initialized with header and footer views.
 */
- (instancetype)initWithHeaderView:(UIView *)headerView footerView:(UIView *)footerView;

/**
 *  Creates and returns a new section.
 *
 *  @return A new section.
 */
+ (instancetype)section;

/**
 *  Creates and returns a new section with predefined header title.
 *
 *  @param headerTitle A header title.
 *
 *  @return A new section with defined header title.
 */
+ (instancetype)sectionWithHeaderTitle:(NSString *)headerTitle;

/**
 *  Creates and returns a new section with predefined footer title.
 *
 *  @param headerTitle A footer title.
 *
 *  @return A new section with defined footer title.
 */
+ (instancetype)sectionWithFooterTitle:(NSString *)footerTitle;

/**
 *  Creates and returns a new section with predefined header and footer titles.
 *
 *  @param headerTitle A header title.
 *  @param footerTitle A footer title.
 *
 *  @return A new section with header and footer titles.
 */
+ (instancetype)sectionWithHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle;

/**
 *  Creates and returns a new section containing a header view.
 *
 *  @param headerView A header view.
 *
 *  @return A new section containing a header view.
 */
+ (instancetype)sectionWithHeaderView:(UIView *)headerView;

/**
 *  Creates and returns a new section containing a footer view.
 *
 *  @param footerView A footer view.
 *
 *  @return A new section containing a footer view.
 */
+ (instancetype)sectionWithFooterView:(UIView *)footerView;

/**
 *  Creates and returns a new section containing header and footer views.
 *
 *  @param headerView A header view.
 *  @param footerView A footer view.
 *
 *  @return A new section containing header and footer views.
 */
+ (instancetype)sectionWithHeaderView:(UIView *)headerView footerView:(UIView *)footerView;

///-----------------------------
/// @name Add and insert Items.
///-----------------------------

/**
 *  Adds a given item at the end of the section.
 *
 *  @param item The item to add to the end of the section. This value must not be `nil`.
 */
- (void)addItem:(id)item;

/**
 *  Adds the items contained in another given array to the end of the section.
 *
 *  @param array An array of items to add to the end of the section.
 */
- (void)addItemsFromArray:(NSArray<TFTableViewItem *> *)array;

/**
 *  Inserts a given item into the section at a given index.
 *
 *  @param item  The item to add to the section. This value must not be `nil`.
 *  @param index The index in the section at which to insert item. This value must not be greater than the count of items in the section.
 */
- (void)insertItem:(id)item atIndex:(NSUInteger)index;

/**
 *  Inserts the items in the provided items array into the section at the specified indexes.
 *
 *  @param items   An array of items to insert into the section.
 *  @param indexes The indexes at which the items should be inserted.
 */
- (void)insertItems:(NSArray<TFTableViewItem *> *)items atIndexes:(NSIndexSet *)indexes;

///-----------------------------
/// @name Removing Items.
///-----------------------------

/**
 *  Removes all occurrences in the section of a given item.
 *
 *  @param item The item to remove from the section.
 */
- (void)removeItem:(id)item;

/**
 *  Removes the item with the highest-valued index in the section.
 */
- (void)removeLastItem;

/**
 *  Removes the item at index.
 *
 *  @param index The index from which to remove the item in the section. The value must not exceed the bounds of the section.
 */
- (void)removeItemAtIndex:(NSUInteger)index;

/**
 *  Removes the items at the specified indexes from the section.
 *
 *  @param indexes The indexes of the items to remove from the section. The locations specified by indexes must lie within the bounds of the section.
 */
- (void)removeItemsAtIndexes:(NSIndexSet *)indexes;

/**
 *  Removes from the section the items in another given array.
 *
 *  @param array An array containing the items to be removed from the section.
 */
- (void)removeItemsInArray:(NSArray<TFTableViewItem *> *)array;

/**
 *  Removes from the section each of the items within a given range.
 *
 *  @param range The range of the items to remove from the section.
 */
- (void)removeItemsInRange:(NSRange)range;

/**
 *  Removes all occurrences within a specified range in the section of a given item.
 *
 *  @param item  The item to remove from the section.
 *  @param range The range from which to remove item.
 */
- (void)removeItem:(id)item inRange:(NSRange)range;

/**
 *  Empties the section of all its items.
 */
- (void)removeAllItems;

///-----------------------------
/// @name Replacing Items
///-----------------------------

/**
 *  Replaces the item at index with another item.
 *
 *  @param index The index of the item to be replaced. This value must not exceed the bounds of the section.
 *  @param item  The item with which to replace the item at index index in the section. This value must not be `nil`.
 */
- (void)replaceItemAtIndex:(NSUInteger)index withItem:(id)item;

/**
 *  Replaces the items in the section with all of the items from a given array.
 *
 *  @param array The array of items from which to select replacements for the items.
 */
- (void)replaceItemsWithItemsFromArray:(NSArray<TFTableViewItem *> *)array;

/**
 *  Replaces the items in the section at specified locations specified with the items from a given array.
 *
 *  @param indexes The indexes of the items to be replaced.
 *  @param items   The items with which to replace the items in the section at the indexes specified by `indexes`. The count of locations in indexes must equal the count of items.
 */
- (void)replaceItemsAtIndexes:(NSIndexSet *)indexes withItems:(NSArray<TFTableViewItem *> *)items;

/**
 *  Replaces the items in the section specified by a given range with all of the items from a given array.
 *
 *  @param range The range of items to replace in (or remove from) the section.
 *  @param array The array of items from which to select replacements for the items in range.
 */
- (void)replaceItemsInRange:(NSRange)range withItemsFromArray:(NSArray<TFTableViewItem *> *)array;

///-----------------------------
/// @name Rearranging Items
///-----------------------------

/**
 *  Exchanges the items in the section at given indices.
 *
 *  @param idx1 The index of the item with which to replace the item at index idx2.
 *  @param idx2 The index of the item with which to replace the item at index idx1.
 */
- (void)exchangeItemAtIndex:(NSUInteger)idx1 withItemAtIndex:(NSUInteger)idx2;

/**
 *  Sorts the items in ascending order as defined by the comparison function compare.
 *
 *  @param compare The comparison function to use to compare two items at a time.
 *  @param context The context argument to pass to the compare function.
 */
- (void)sortItemsUsingFunction:(NSInteger (*)(id, id, void *))compare context:(void *)context;
- (void)sortItemsUsingSelector:(SEL)comparator;


///-----------------------------
/// @name TFTableViewSection handle tableView section actions.
///-----------------------------

/**
 *  Reloads the `section` using a given animation effect.
 *
 *  @param animation A constant that indicates how the reloading is to be animated.
 */
- (void)reloadSectionWithAnimation:(UITableViewRowAnimation)animation;

/**
 *  Delete the `section` using a given animation effect.
 *
 *  @param animation A constant that indicates how the reloading is to be animated.
 */
- (void)deleteSectionWithAnimation:(UITableViewRowAnimation)animation;

/**
 *  Reload rows at index set.
 *
 *  @param indexSet the index set of reload rows.
 */
- (void)reloadRowsAtIndexes:(NSIndexSet *)indexSet withAnimation:(UITableViewRowAnimation)animation;

/**
 *  Insert rows with items array and indexes.
 *
 *  @param rows      an array of items
 *  @param indexSet  index set.
 *  @param animation A constant that indicates how the delete is to be animated.
 */
- (void)insertRows:(NSArray<TFTableViewItem *> *)rows atIndexes:(NSIndexSet *)indexSet withRowAnimation:(UITableViewRowAnimation)animation;


- (void)addRows:(NSArray<TFTableViewItem *> *)rows withRowAnimation:(UITableViewRowAnimation)animation;
/**
 *  Delete rows with the indexes of rows and a given animation effect.
 *
 *  @param indexSet  the index set.
 *  @param animation A constant that indicates how the delete is to be animated.
 */
- (void)deleteRowsAtIndexes:(NSIndexSet *)indexSet withAnimation:(UITableViewRowAnimation)animation;

/**
 *  Delete rows with items of rows and a given animation effect.
 *
 *  @param indexSet  the index set.
 *  @param animation A constant that indicates how the delete is to be animated.
 */
- (void)deleteRows:(NSArray<TFTableViewItem *> *)items withAnimation:(UITableViewRowAnimation)animation;

@end
