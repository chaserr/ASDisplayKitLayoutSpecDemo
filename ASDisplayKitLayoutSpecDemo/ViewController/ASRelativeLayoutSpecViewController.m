//  Created by 童星 on 16/8/8.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "ASRelativeLayoutSpecViewController.h"
#import "ASDemoRelativeLayoutItem.h"

@interface ASRelativeLayoutSpecViewController ()
@property (nonatomic, strong) ASTableNode *tableNode;

@property (nonatomic, strong) TFTableViewManager *tableViewManager;
@end

@implementation ASRelativeLayoutSpecViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubnode:self.tableNode];

    [self p_setupNavBar];
    [self p_setupItems];
}

#pragma mark - private
- (void)p_setupNavBar {
    self.title = NSLocalizedString(@"ASRelativeLayoutSpec", nil);
}

- (void)p_setupItems {
    TFTableViewSection *relativeSection = [TFTableViewSection section];
    
    NSArray *datas = [self datas];
    for (NSNumber *style in datas) {
        ASDemoRelativeLayoutItem *item = [ASDemoRelativeLayoutItem item];
        item.url = @"https://ss0.baidu.com/73F1bjeh1BF3odCf/it/u=3114917721,2349721725&fm=85&s=7CA48D19E232719CC82011E80300E0A0";
        item.tip = @"风景";
        item.displayCenterLayout = NO;
        item.relativeLayoutStyle = style.integerValue;
        [relativeSection addItem:item];
    }
    
    TFTableViewSection *centerSection = [TFTableViewSection section];
    ASDemoRelativeLayoutItem *centerItem = [ASDemoRelativeLayoutItem item];
    centerItem.url = @"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=579457062,1048075669&fm=26&gp=0.jpg";
    centerItem.tip = @"宋慧乔";
    centerItem.displayCenterLayout = YES;
    [centerSection addItem:centerItem];
    
    [self.tableViewManager addSection:relativeSection];
    [self.tableViewManager addSection:centerSection];
    [self.tableNode reloadData];
}

- (NSArray *)datas {
    return   @[ @(ERelativeLayoutTopLeft),
                @(ERelativeLayoutTopMiddle),
                @(ERelativeLayoutTopRight),
                @(ERelativeLayoutMiddleLeft),
                @(ERelativeLayoutMiddle),
                @(ERelativeLayoutMiddleRight),
                @(ERelativeLayoutBottomLeft),
                @(ERelativeLayoutBottomMiddle),
                @(ERelativeLayoutBottomRight) ];
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
