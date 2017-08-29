//  Created by 童星 on 16/8/10.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "Demo1ViewController.h"
#import "Demo1Item.h"

@interface Demo1ViewController ()
@property (nonatomic, strong) ASTableNode *tableNode;

@property (nonatomic, strong) TFTableViewManager *tableViewManager;
@end

@implementation Demo1ViewController
#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubnode:self.tableNode];

    [self p_setupNavBar];
    [self p_setupItems];
}

#pragma mark - private
- (void)p_setupNavBar {
    self.title = NSLocalizedString(@"Demo1", nil);
}

- (void)p_setupItems {
    TFTableViewSection *section = [TFTableViewSection section];
    
    Demo1Item *withoutTitleItem = [Demo1Item item];
    withoutTitleItem.hasTitle = NO;
    
    Demo1Item *hasTitleItem = [Demo1Item item];
    hasTitleItem.hasTitle = YES;
    hasTitleItem.accessoryInfo = @"需要设置verticalSpec.flexShrink = YES";
    [section addItem:withoutTitleItem];
    [section addItem:hasTitleItem];
    
    [self.tableViewManager addSection:section];
    [self.tableNode reloadData];
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

- (void)dealloc {
    
    NSLog(@"\n************\n %@ dealloc \n************", self.class);
}
@end
