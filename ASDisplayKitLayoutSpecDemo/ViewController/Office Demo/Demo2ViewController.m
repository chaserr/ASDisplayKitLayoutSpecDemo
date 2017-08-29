//  Created by 童星 on 16/8/11.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "Demo2ViewController.h"
#import "Demo2Item.h"

@interface Demo2ViewController ()
@property (nonatomic, strong) ASTableNode *tableNode;

@property (nonatomic, strong) TFTableViewManager *tableViewManager;
@end

@implementation Demo2ViewController
#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubnode:self.tableNode];

    [self p_setupNavBar];
    [self p_setupItems];
}

#pragma mark - private
- (void)p_setupNavBar {
    self.title = NSLocalizedString(@"Demo2", nil);
}


- (void)p_setupItems {
    TFTableViewSection *section = [TFTableViewSection section];
    Demo2Item *item             = [[Demo2Item alloc] init];
    item.imageURL               = @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=4221744954,3276407939&fm=58&bpow=612&bpoh=763&u_exp_0=4034765850,2959640806&fm_exp_0=86";
    item.content                = @"梵高-《向日葵》\n《向日葵》系列作品是梵高的代表作。梵高共创作了11幅有关向日葵的画作.";
    [section addItem:item];
    
    
    Demo2Item *item2 = [[Demo2Item alloc] init];
    item2.imageURL = @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2861622154,3310634086&fm=58&u_exp_0=2294588539,2977328676&fm_exp_0=86&bpow=774&bpoh=491";
    item2.content = @"梵高-《向日葵》\n《向日葵》系列作品是梵高的代表作。梵高共创作了11幅有关向日葵的画作，如今作品分布在荷、英、美、日、德等国。本次合璧展将展出的是荷兰阿姆斯特丹梵高博物馆和英国伦敦国家美术馆的馆藏。梵高博物馆向英国出借的这幅《向日葵》创作于1888年，是该系列作品中最著名的一幅。伦敦国家美术馆馆藏画作由博物馆1924年直接从梵高家人手中购得，是系列作品中的第四幅，描绘了向日葵花瓣逐渐凋零、色彩逐渐褪去的形态。专家评估，这两幅画作的拍卖价格均在1亿英镑左右。值得一提的是，有关《向日葵》绘制过程和所用材料的最新研究成果也将同两幅画作一起展出。";
    [section addItem:item2];
    
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
