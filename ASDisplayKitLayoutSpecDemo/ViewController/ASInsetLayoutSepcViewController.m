//  Created by 童星 on 16/8/8.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "ASInsetLayoutSepcViewController.h"
#import "ASDemoInsetLayoutItem.h"

@interface ASInsetLayoutSepcViewController ()
@property (nonatomic, strong) ASTableNode *tableNode;

@property (nonatomic, strong) TFTableViewManager *tableViewManager;
@end

@implementation ASInsetLayoutSepcViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubnode:self.tableNode];

    [self p_setupNavBar];
    [self p_setupItems];
}

#pragma mark - private
- (void)p_setupNavBar {
    self.title = NSLocalizedString(@"ASInsetLaoutSepc", nil);
}

- (void)p_setupItems {
    TFTableViewSection *section = [TFTableViewSection section];
    
    for (int i = 1; i >= 0; i--) {
        ASDemoInsetLayoutItem *item = [ASDemoInsetLayoutItem item];
        item.insetBefore = i;
        item.accessoryInfo = i ? @"使用Inset之前" : @"使用Inset之后";
        [self.view addSubnode:self.tableNode];
        [section addItem:item];
    }
    
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
