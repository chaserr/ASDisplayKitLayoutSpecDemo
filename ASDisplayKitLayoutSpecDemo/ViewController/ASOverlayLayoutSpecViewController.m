//  Created by 童星 on 16/8/7.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "ASOverlayLayoutSpecViewController.h"
#import "ASDemoOverlayLayoutItem.h"

@interface ASOverlayLayoutSpecViewController ()
@property (nonatomic, strong) ASTableNode *tableNode;

@property (nonatomic, strong) TFTableViewManager *tableViewManager;
@end

@implementation ASOverlayLayoutSpecViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubnode:self.tableNode];

    [self p_setupNavBar];
    [self p_setupItems];
}

#pragma mark - private
- (void)p_setupNavBar {
    self.title = NSLocalizedString(@"ASOverlayLayoutSpec", nil);
}

- (void)p_setupItems {
    TFTableViewSection *section = [TFTableViewSection section];
    ASDemoOverlayLayoutItem *item = [ASDemoOverlayLayoutItem item];
    [section addItem:item];
    
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
