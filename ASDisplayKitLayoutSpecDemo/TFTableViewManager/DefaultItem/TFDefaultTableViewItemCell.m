//
//  TFUIDefaultTableViewItemCell.m
//  TFTableViewManager
//
//  Created by 童星 on 16/9/6.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "TFDefaultTableViewItemCell.h"

@implementation TFDefaultTableViewItemCell

@dynamic tableViewItem;

+ (CGFloat)heightWithItem:(TFDefaultTableViewItem *)item tableViewManager:(TFTableViewManager *)tableViewManager {
    return item.cellHeight ? :44.0;
}

- (instancetype)initWithTableViewItem:(TFDefaultTableViewItem *)tableViewItem reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:tableViewItem.cellStyle reuseIdentifier:reuseIdentifier];
    if (self) {
        self.tableViewItem = tableViewItem;
    }
    return self;
}

- (void)cellLoadSubViews {
    [super cellLoadSubViews];
}

- (void)cellWillAppear {
    [super cellWillAppear];

    if (self.tableViewItem.image) {
        self.imageView.image = self.tableViewItem.image;
    }
    self.textLabel.text = self.tableViewItem.text;
    if (self.tableViewItem.textFont) {
        self.textLabel.font = self.tableViewItem.textFont;
    }
    if (self.tableViewItem.textColor) {
        self.textLabel.textColor = self.tableViewItem.textColor;
    }
    if (self.detailTextLabel) {
        self.detailTextLabel.text = self.tableViewItem.detail;
        if (self.tableViewItem.detailFont) {
            self.detailTextLabel.font = self.tableViewItem.detailFont;
        }
        if (self.tableViewItem.detailColor) {
            self.detailTextLabel.textColor = self.tableViewItem.detailColor;
        }
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
