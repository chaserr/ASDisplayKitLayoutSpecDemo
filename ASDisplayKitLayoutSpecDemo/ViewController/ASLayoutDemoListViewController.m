//
//  ASLayoutDemoListViewController.m
//  TimeFaceDemoProject
//
//  Created by 童星 on 16/8/5.
//  Copyright © 2016年 童星. All rights reserved.
//


//
//                       _oo0oo_
//                      o8888888o
//                      88" . "88
//                      (| -_- |)
//                      0\  =  /0
//                    ___/`---'\___
//                  .' \\|     |// '.
//                 / \\|||  :  |||// \
//                / _||||| -:- |||||- \
//               |   | \\\  -  /// |   |
//               | \_|  ''\---/''  |_/ |
//               \  .-\__  '-'  ___/-. /
//             ___'. .'  /--.--\  `. .'___
//          ."" '<  `.___\_<|>_/___.' >' "".
//         | | :  `- \`.;`\ _ /`;.`/ - ` : | |
//         \  \ `_.   \_ __\ /__ _/   .-` /  /
//     =====`-.____`.___ \_____/___.-`___.-'=====
//                       `=---='
//
//
//     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//
//               佛祖保佑         永无BUG
//
//
//
/*******注：这个项目里引用了我们公司的一套 MVVM 框架，来自动对 tableview 的数据源和代理进行自动映射。这        里只是引用了其中一部分功能，对本地数据的处理，（还有另一部分功能是对请求的数据进行自动映射。）
    代码无需深究，大家只要去理解 ASDisplayKit 的布局代码就 OK 了
**************************/
#import "ASLayoutDemoListViewController.h"
#import "ASDemoListItem.h"

@interface ASLayoutDemoListViewController ()

@property (nonatomic, strong) ASTableNode *tableNode;

@property (nonatomic, strong) TFTableViewManager *tableViewManager;

@end

@implementation ASLayoutDemoListViewController


#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubnode:self.tableNode];
    self.tableNode.backgroundColor = [UIColor whiteColor];
    
    [self p_setupNavBar];
    [self p_setupItems];
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

#pragma mark - Private
- (void)p_setupNavBar {
    self.title = @"ASLayoutSpecDemoList";
}

- (void)p_setupItems {
    NSArray *layoutNames = @[ @"ASStackLayoutSpec",
                            @"ASBackgroundLayoutSpec",
                            @"ASOverlayLayoutSpec",
                            @"ASRatioLayoutSpec",
                            @"ASInsetLayoutSepc",
                            @"ASRelativeLayoutSpec",
//                            @"ASStaticLayoutSpec",
                            ];
    
    
    TFTableViewSection *section = [TFTableViewSection section];
    section.headerTitle = @"ASLayoutSpecs";
    section.headerHeight = 30;
    [layoutNames enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ASDemoListItem *item = [ASDemoListItem item];
        item.demoTitle       = obj;
        [section addItem:item];
        
        item.selectionHandler = ^(ASDemoListItem *demoItem,NSIndexPath *indexPath){
            NSString *classStr = [demoItem.demoTitle stringByAppendingString:@"ViewController"];
            [self.navigationController pushViewController:[[NSClassFromString(classStr) alloc] init] animated:YES];
        };
    }];
    
    NSArray *demoNames = @[ @"SocialApp", @"Demo1", @"Demo2"];
    
    TFTableViewSection *demoSection = [TFTableViewSection section];
    demoSection.headerTitle = @"Demos";
    demoSection.headerHeight = 30;
    [demoNames enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ASDemoListItem *item = [ASDemoListItem item];
        item.demoTitle       = obj;
        [demoSection addItem:item];
        
        item.selectionHandler = ^(ASDemoListItem *demoItem,NSIndexPath *indexPath){
            NSString *classStr = [demoItem.demoTitle stringByAppendingString:@"ViewController"];
            [self.navigationController pushViewController:[[NSClassFromString(classStr) alloc] init] animated:YES];
        };
    }];
    
    [self.tableViewManager addSection:section];
    [self.tableViewManager addSection:demoSection];
}

@end
