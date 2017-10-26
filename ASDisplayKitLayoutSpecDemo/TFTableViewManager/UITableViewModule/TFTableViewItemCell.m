//
//  PFUITableViewItemCell.m
//  TFTableViewManagerDemo
//
//  Created by 童星 on 16/8/26.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "TFTableViewItemCell.h"
#import "TFTableViewItem.h"

@interface TFTableViewItemCell ()

@end

@implementation TFTableViewItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (instancetype)initWithTableViewItem:(TFTableViewItem *)tableViewItem reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        self.tableViewItem = tableViewItem;
    }
    return self;
}


#pragma mark - Handling Cell Events.

+ (CGFloat)cellHeightWithItem:(TFTableViewItem *)item
{
    return item.cellHeight? :UITableViewAutomaticDimension;
}

#pragma mark - Cell life cycle

- (void)cellLoadSubViews {
    // set separator sunk.
    if (!self.tableViewItem.separatorSunk) {
        self.preservesSuperviewLayoutMargins = NO;
        UIEdgeInsets lineInsets =  UIEdgeInsetsZero;
        self.separatorInset = lineInsets;
        self.layoutMargins = lineInsets;
    }
    //add subviews at here.
}

- (void)cellWillAppear {
    //set subviews property values at here.
    
    self.selectionStyle = self.tableViewItem.selectionStyle;
    if (self.tableViewItem.accessoryView) {
        UITableViewCell *cell = (UITableViewCell *)self.tableViewItem.accessoryView.superview;
        [cell.accessoryView removeFromSuperview];
        cell.accessoryView = nil;
        self.accessoryView = self.tableViewItem.accessoryView;
    }
    else {
        self.accessoryType = self.tableViewItem.accessoryType;
    }

}

- (void)cellDidDisappear {
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
