//  Created by 童星 on 16/8/7.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "ASRatioLayoutSpecViewController.h"
#import "ASDemoRatioLayoutItem.h"


@interface ASRatioLayoutSpecViewController ()
@property (nonatomic, strong) ASTableNode *tableNode;

@property (nonatomic, strong) TFTableViewManager *tableViewManager;
@end

@implementation ASRatioLayoutSpecViewController
#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubnode:self.tableNode];

    [self p_setupNavBar];
    [self p_setupItems];
}

#pragma mark - private
- (void)p_setupNavBar {
    self.title = NSLocalizedString(@"ASRatioLayoutSpec", nil);
}

- (void)p_setupItems {
    NSArray *datas = [self datas];
    
    TFTableViewSection *section = [TFTableViewSection section];
    [datas enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ASDemoRatioLayoutItem *item = [[ASDemoRatioLayoutItem alloc] init];
        item.url                    = obj[@"imageUrl"];
        item.content                = obj[@"content"];
        item.accessoryInfo          = @"ratio unknow";
        [section addItem:item];
    }];
    
    [self.tableViewManager addSection:section];
    [self.tableNode reloadData];
}

- (NSArray *)datas {
    return @[
             @{ @"imageUrl" : @"https://img3.doubanio.com/view/thing_review/large/public/p240713.jpg",
                @"content"  : @"多年以来，小编一直觉得在小说方面，《盗墓笔记》确实比《鬼吹灯》的观赏性强，虽然南派三叔挖坑不填，但是好歹怪力乱神，脑洞极大，而且故事的连续性也很强，不过，相比而言《鬼吹灯》的故事确实更适合电影化。" },
             
             @{ @"imageUrl" : @"https://img3.doubanio.com/view/thing_review/large/public/p243291.jpg",
                @"content"  : @"全世界最坏的穷凶极恶的危险恶徒们聚众在一起，除了成功的拯救世界外，全片只做了一件不友爱不和平的事：攻击己方队友长得吃藕。" },
             
             @{ @"imageUrl" : @"https://img3.doubanio.com/view/thing_review/large/public/p232404.jpg",
                @"content"  : @"欧维。59岁。在他的工作岗位上已经奉献了43年，性格刻板，讲原则，脾气古怪执拗，带着坚不可摧的原则、每天恪守的常规以及随时发飙的脾性在居住的小社区晃来晃去，指责邻居家的狗狗随便便便，检查垃圾是否按规定分类，将孩子们空地上的随手乱丢的玩具摆放整齐，搬动随意停放的自行车回归正常位置，诅咒身上掉了毛的喵星人，他被邻居们背地里称为“地狱来的恶邻”。" },
             
             @{ @"imageUrl" : @"https://img1.doubanio.com/view/thing_review/large/public/p215309.jpg",
                @"content"  : @"韩国电影近年来在国际影坛大放异彩，一大批兼具商业和艺术野心的佳作频出，这无疑是韩国电影最好的时代。虽然由于审查的制度的不可抗力，大陆的小伙伴们暂时还不能看到朴赞郁的新作《小姐》，但笔者有幸在香港看了提前场，感受很深，所以我们就来谈谈——我们为何期待朴赞郁的《小姐》。文内微剧透，小心慎入！" }
            ];
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
