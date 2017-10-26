//
//  TFTableViewManager.h
//  TFTableViewManagerDemo
//
//  Created by 童星 on 16/8/24.
//  Copyright © 2016年 童星. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TFTableViewSection.h"

@class TFTableViewItem;

@protocol TFTableViewManagerDelegate;

/**
 *  Base table view manager.
 */
@interface TFTableViewManager : NSObject

///-----------------------------
/// @name Properties.
///-----------------------------

/**
 *  @brief The 'ASTableNode' that needs to be managed using this 'TFTableViewManager'.
 */
@property (weak, nonatomic) ASTableNode *tableNode;

/**
 *  @brief The `UITableView` that needs to be managed using this `TFTableViewManager`.
 */
@property (weak, nonatomic) UITableView *tableView;

/**
 *  @brief The object that acts as the delegate of the receiving table view.
 */
@property (weak, nonatomic) id<TFTableViewManagerDelegate> delegate;

/**
 *  @brief The array of sections. See TFTableViewSection reference for details.
 */
@property (strong, readonly, nonatomic) NSArray<TFTableViewSection *> *sections;

///-----------------------------
/// @name Creating and Initializing a TFTableViewManager.
///-----------------------------

/**
 *  Initialize a table view manager object for a specific `UITableView`.
 *
 *  @param tableView The UITableView that needs to be managed.
 *
 *  @return The pointer to the instance, or `nil` if initialization failed.
 */
- (instancetype)initWithTableView:(UITableView *)tableView;

/**
 *  Initialize a table view manager object for a specific `ASTableNode`.
 *
 *  @param tableNode The ASTableNode that needs to be managed.
 *
 *  @return The pointer to the instance, or `nil` if initialization failed.
 */
- (instancetype)initWithTableNode:(ASTableNode *)tableNode;

/**
 *  Get the item at index path.
 *
 *  @param indexPath the item index path.
 
    @return TFCollectionViewItem.

 */
- (TFTableViewItem *)itemAtIndexPath:(NSIndexPath *)indexPath;

///-----------------------------
/// @name Add and insert sections.
///-----------------------------

/**
 Inserts a given section at the end of the table view.
 
 @param section The section to add to the end of the table view. This value must not be `nil`.
 */
- (void)addSection:(TFTableViewSection *)section;

/**
 *  Adds the sections contained in another given sections array to the end of the table view.
 *
 *  @param array An array of sections to add to the end of the table view.
 */
- (void)addSectionsFromArray:(NSArray<TFTableViewSection *> *)array;

/**
 *  Inserts a given section into the table view at a given index.
 *
 *  @param section The section to add to the table view. This value must not be nil.
 *  @param index   The index in the sections array at which to insert section. This value must not be greater than the count of sections in the table view.
 */
- (void)insertSection:(TFTableViewSection *)section atIndex:(NSUInteger)index;

/**
 *  Inserts the sections in the provided array into the table view at the specified indexes.
 *
 *  @param sections An array of sections to insert into the table view.
 *  @param indexes  The indexes at which the sections in sections should be inserted. The count of locations in indexes must equal the count of sections.
 */
- (void)insertSections:(NSArray<TFTableViewSection *> *)sections atIndexes:(NSIndexSet *)indexes;

///-----------------------------
/// @name Remove Sections
///-----------------------------

/**
 *  Removes all occurrences in the table view of a given section.
 *
 *  @param section The section to remove from the table view.
 */
- (void)removeSection:(TFTableViewSection *)section;

/**
 *  Removes the section at index.
 *
 *  @param index The index from which to remove the section in the table view. The value must not exceed the bounds of the table view sections.
 */
- (void)removeSectionAtIndex:(NSUInteger)index;

/**
 *  Removes the section with the highest-valued index in the table view.
 */
- (void)removeLastSection;

/**
 *  Empties the table view of all its sections.
 */
- (void)removeAllSections;

/**
 *  Removes from the table view the sections in another given array.
 *
 *  @param array An array containing the sections to be removed from the table view.
 */
- (void)removeSectionsInArray:(NSArray<TFTableViewSection *> *)array;

/**
 *  Removes from the table view each of the sections within a given range.
 *
 *  @param range The range of the sections to remove from the table view.
 */
- (void)removeSectionsInRange:(NSRange)range;

/**
 *  Removes all occurrences within a specified range in the table view of a given section.
 *
 *  @param section The section to remove from the table view.
 *  @param range   The range from which to remove section.
 */
- (void)removeSection:(TFTableViewSection *)section inRange:(NSRange)range;

/**
 *  Removes the sections at the specified indexes from the table view.
 *
 *  @param indexes The indexes of the sections to remove from the table view. The locations specified by indexes must lie within the bounds of the table view sections.
 */
- (void)removeSectionsAtIndexes:(NSIndexSet *)indexes;

///-----------------------------
/// @name Replace Sections.
///-----------------------------

/**
 *  Replaces the section at index with `section`.
 *
 *  @param index   The index of the section to be replaced. This value must not exceed the bounds of the table view sections.
 *  @param section The section with which to replace the section at index `index` in the sections array. This value must not be `nil`.
 */
- (void)replaceSectionAtIndex:(NSUInteger)index withSection:(TFTableViewSection *)section;

/**
 *  Replaces the sections in the table view with all of the sections from a given array.
 *
 *  @param array The array of sections from which to select replacements for the sections.
 */
- (void)replaceSectionsWithSectionsFromArray:(NSArray<TFTableViewSection *> *)array;

/**
 *  Replaces the sections in the table view at specified locations specified with the sections from a given array.
 *
 *  @param indexes  The indexes of the sections to be replaced.
 *  @param sections The sections with which to replace the sections in the table view at the indexes specified by indexes. The count of locations in indexes must equal the count of sections.
 */
- (void)replaceSectionsAtIndexes:(NSIndexSet *)indexes withSections:(NSArray<TFTableViewSection *> *)sections;

/**
 *  Replaces the sections in the table view specified by a given range with all of the sections from a given array.
 *
 *  @param range The range of sections to replace in (or remove from) the table view.
 *  @param array The array of sections from which to select replacements for the sections in range.
 */
- (void)replaceSectionsInRange:(NSRange)range withSectionsFromArray:(NSArray<TFTableViewSection *> *)array;

///-----------------------------
/// @name Rearranging Sections.
///-----------------------------

/**
 *  Exchanges the sections in the table view at given indices.
 *
 *  @param idx1 The index of the section with which to replace the section at index idx2.
 *  @param idx2 The index of the section with which to replace the section at index idx1.
 */
- (void)exchangeSectionAtIndex:(NSUInteger)idx1 withSectionAtIndex:(NSUInteger)idx2;

/**
 *  Sorts the sections in ascending order as defined by the comparison function compare.
 *
 *  @param compare The comparison function to use to compare two sections at a time.
 *  @param context The context argument to pass to the compare function.
 */
- (void)sortSectionsUsingFunction:(NSInteger (*)(id, id, void *))compare context:(void *)context;

/**
 *  Sorts the sections in ascending order, as determined by the comparison method specified by a given selector.
 *
 *  @param comparator A selector that specifies the comparison method to use to compare sections in the table view.
 */
- (void)sortSectionsUsingSelector:(SEL)comparator;

///-----------------------------
/// @name Row and section insertion/deletion/reloading.
///-----------------------------

/**
 *  Insert sections with a given animation effect.
 *
 *  @param sections  an array of TFTableViewSection.
 *  @param indexSet  the index set of sections.
 *  @param animation A constant that indicates how the insert is to be animated.
 */
- (void)insertSections:(NSArray<TFTableViewSection *> *)sections atIndexes:(NSIndexSet *)indexSet withRowAnimation:(UITableViewRowAnimation)animation;


/**
 *  Insert sections with a given animation effect in the end of section array.
 *
 *  @param sections  an array of TFTableViewSection.
 *  @param animation A constant that indicates how the insert is to be animated.
 */
- (void)addSections:(NSArray<TFTableViewSection *> *)sections withRowAnimation:(UITableViewRowAnimation)animation;

/**
 *  Delete sections with index set of section and a given animation effect.
 *
 *  @param indexSet  the index set of sections.
 *  @param animation A constant that indicates how the insert is to be animated.
 */
- (void)deleteSectionsAtIndexSet:(NSIndexSet *)indexSet withRowAnimation:(UITableViewRowAnimation)animation;

/**
 *  Delete sections with an array of sections and a given animation effect.
 *
 *  @param sections  an array of TFTableViewSection.
 *  @param animation A constant that indicates how the insert is to be animated.
 */
- (void)deleteSections:(NSArray<TFTableViewSection *> *)sections withRowAnimation:(UITableViewRowAnimation)animation;


/**
 *  Reload sections with a given animation effect.
 *
 *  @param indexSet  the index set of sections.
 *  @param animation A constant that indicates how the insert is to be animated.
 */
- (void)reloadSectionsAtIndexSet:(NSIndexSet *)indexSet withRowAnimation:(UITableViewRowAnimation)animation;


/**
 *  Reload sections with a given animation effect.
 *
 *  @param sections  an array of TFTableViewSection.
 *  @param animation A constant that indicates how the insert is to be animated.
 */
- (void)reloadSections:(NSArray<TFTableViewSection *> *)sections withRowAnimation:(UITableViewRowAnimation)animation;

/**
 *  Reload sections with a given animation effect.
 *
 *  @param animation A constant that indicates how the insert is to be animated.
 */
- (void)reloadAllSectionsWithRowAnimation:(UITableViewRowAnimation)animation;


/**
 *  Move section to a new section.
 *
 *  @param section    old section.
 *  @param newSection new section.
 */
- (void)moveSection:(NSInteger)section toSection:(NSInteger)newSection;

/**
 *  Reload rows with an array of indexPaths and a given animation effect.
 *
 *  @param indexPaths             an array of NSIndexPath.
 *  @param animation              A constant that indicates how the insert is to be animated.
 */
- (void)reloadRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;

/**
 *  Insert rows with an array of indexPaths and a given animation effect.
 *
 *  @param indexPaths an array of NSIndexPath.
 *  @param animation  A constant that indicates how the insert is to be animated.
 */
- (void)insertRows:(NSArray<TFTableViewItem *> *)rows atIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;

/**
 *  Delete rows with an array of indexPaths and a given animation effect.
 *
 *  @param indexPaths an array of NSIndexPath.
 *  @param animation  A constant that indicates how the delete is to be animated.
 */
- (void)deleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;

/**
 *  Move row at index path to a new index path.
 *
 *  @param indexPath    old index path.
 *  @param newIndexPath new index path.
 */
- (void)moveRowAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath;

/**
 *  Select row at index path.
 *
 *  @param indexPath      the row index path.
 *  @param animated       using animation.
 *  @param scrollPosition scroll position type.
 */
- (void)selectRowAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated scrollPosition:(UITableViewScrollPosition)scrollPosition;

/**
 *  Deselect row at index path.
 *
 *  @param indexPath the row index path.
 *  @param animated  using animation.
 */
- (void)deselectRowAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated;


@end

/**
 *  the table view manager delegate. support UITableViewDelegate and ASTableDelegate.
 */
@protocol TFTableViewManagerDelegate <UITableViewDelegate,ASTableDelegate>

@optional;

/**
 *  Tells the delegate the table view has created a cell for a particular row and made it reusable.
 *
 *  @param tableView The table-view object informing the delegate of this impending event.
 *  @param cell       A table-view cell object that tableView is going to use when drawing the row.
 *  @param indexPath  An index path locating the row in tableView.
 *  @warning only UITableView support.
 */
- (void)tableView:(UITableView *)tableView didLoadCellSubViews:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;


@end



