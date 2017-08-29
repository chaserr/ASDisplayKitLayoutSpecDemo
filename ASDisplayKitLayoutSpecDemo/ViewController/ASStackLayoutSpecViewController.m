//
//  ASStackLayoutSpecViewController.m
//  TimeFaceDemoProject
//
//  Created by 童星 on 16/8/5.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "ASStackLayoutSpecViewController.h"
#import "ASDemoStackLayoutItem.h"

@interface ASStackLayoutSpecViewController ()
@property (nonatomic, strong) ASTableNode *tableNode;

@property (nonatomic, strong) TFTableViewManager *tableViewManager;
@end

@implementation ASStackLayoutSpecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubnode:self.tableNode];

    [self p_setupNavBar];
    [self p_setupItems];
}

#pragma mark - Private
- (void)p_setupNavBar {
    self.title = @"ASStackLayoutSpec";
}

- (void)p_setupItems {
    
    NSArray *datas = [self datas];
    
    [datas enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        TFTableViewSection *section = [TFTableViewSection section];
        section.headerHeight = 10.f;
        [self.tableViewManager addSection:section];
        
        ASDemoStackLayoutItem *horizontalStackItem = [ASDemoStackLayoutItem item];
        horizontalStackItem.stackLayoutStyle       = obj.integerValue;
        horizontalStackItem.stackLayoutDirection   = EStackLayoutDirectionHorizontal;
        horizontalStackItem.accessoryInfo          = @"Horizontal";
        [section addItem:horizontalStackItem];
        
        if (obj.integerValue == EStackLayoutStyleAlignItemsBaselineFirst ||
            obj.integerValue == EStackLayoutStyleAlignItemsBaselineLast  ||
            obj.integerValue == EStackLayoutStyleFlexGrow                ||
            obj.integerValue == EStackLayoutStyleFlexShink) {
            return;
        }
        
        ASDemoStackLayoutItem *verticalStackItem = [ASDemoStackLayoutItem item];
        verticalStackItem.stackLayoutStyle       = obj.integerValue;
        verticalStackItem.stackLayoutDirection   = EStackLayoutDirectionVertical;
        verticalStackItem.accessoryInfo          = @"Vertical";
        [section addItem:verticalStackItem];
    }];
    
    [self.tableNode reloadData];
}

- (NSArray *)datas {
    return @[ @(EStackLayoutStyleJustifyContentStart),
              @(EStackLayoutStyleJustifyContentCenter),
              @(EStackLayoutStyleJustifyContentEnd),
              @(EStackLayoutStyleJustifyContentSpaceBetween),
              @(EStackLayoutStyleJustifyContentSpaceAround),
              
              @(EStackLayoutStyleAlignItemsStart),
              @(EStackLayoutStyleAlignItemsEnd),
              @(EStackLayoutStyleAlignItemsCenter),
              @(EStackLayoutStyleAlignItemsStretch),
//              @(EStackLayoutStyleAlignItemsBaselineFirst),
//              @(EStackLayoutStyleAlignItemsBaselineLast),
              
              @(EStackLayoutStyleAlignSelfAuto),
              @(EStackLayoutStyleAlignSelfStart),
              @(EStackLayoutStyleAlignSelfEnd),
              @(EStackLayoutStyleAlignSelfCenter),
              @(EStackLayoutStyleAlignSelfStretch),
              
              @(EStackLayoutStyleFlexGrow),
              @(EStackLayoutStyleFlexShink),
              @(EStackLayoutStyleSpaceBeforeAndAfter) ];
}

- (ASTableNode *)tableNode {
    if (!_tableNode) {
        _tableNode = [[ASTableNode alloc] init];
        _tableNode.frame = self.view.bounds;
    }
    return _tableNode;
}

- (TFTableViewManager *)tableViewManager{
    
    if (!_tableViewManager) {
        _tableViewManager = [[TFTableViewManager alloc] initWithTableNode:self.tableNode];
    }
    return _tableViewManager;
}

@end
