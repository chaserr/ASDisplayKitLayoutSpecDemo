//  Created by 童星 on 16/8/8.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "SocialAppViewController.h"
#import "Post.h"
#import "SocialAppItem.h"

@interface SocialAppViewController ()
@property (nonatomic, strong) ASTableNode *tableNode;

@property (nonatomic, strong) TFTableViewManager *tableViewManager;
@end

@implementation SocialAppViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubnode:self.tableNode];

    [self p_setupNavBar];
    [self p_setupItems];
}

#pragma mark - private
- (void)p_setupNavBar {
    self.title = NSLocalizedString(@"SocialApp", nil);
    
}

- (void)p_setupItems {
    NSArray *datas = [self datas];
    
    TFTableViewSection *section = [TFTableViewSection section];
    for (Post *post in datas) {
        SocialAppItem *item = [SocialAppItem item];
        item.model = post;
        [section addItem:item];
    }
    
    [self.tableViewManager addSection:section];
    [self.tableNode reloadData];
}

- (NSArray *)datas {
    NSMutableArray *socialAppDataSource = [[NSMutableArray alloc] init];
    
    Post *newPost = [[Post alloc] init];
    newPost.name = @"Apple Guy";
    newPost.username = @"@appleguyappleguyappleguyappleguyappleguyappleguy";
    newPost.photo = @"https://avatars1.githubusercontent.com/u/565251?v=3&s=96";
    newPost.post = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";
    newPost.time = @"3s";
    newPost.media = @"";
    newPost.via = 0;
    newPost.likes = arc4random_uniform(74);
    newPost.comments = arc4random_uniform(40);
    [socialAppDataSource addObject:newPost];
    
    newPost = [[Post alloc] init];
    newPost.name = @"Huy Nguyen";
    newPost.username = @"@nguyenhuy";
    newPost.photo = @"https://avatars2.githubusercontent.com/u/587874?v=3&s=96";
    newPost.post = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
    newPost.time = @"1m";
    newPost.media = @"";
    newPost.via = 1;
    newPost.likes = arc4random_uniform(74);
    newPost.comments = arc4random_uniform(40);
    [socialAppDataSource addObject:newPost];
    
    newPost = [[Post alloc] init];
    newPost.name = @"Alex Long Name";
    newPost.username = @"@veryyyylongusername";
    newPost.photo = @"https://avatars1.githubusercontent.com/u/8086633?v=3&s=96";
    newPost.post = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
    newPost.time = @"3:02";
    newPost.media = @"http://www.ngmag.ru/upload/iblock/f93/f9390efc34151456598077c1ba44a94d.jpg";
    newPost.via = 2;
    newPost.likes = 0;
    newPost.comments = arc4random_uniform(40);
    [socialAppDataSource addObject:newPost];
    
    newPost = [[Post alloc] init];
    newPost.name = @"Vitaly Baev";
    newPost.username = @"@vitalybaev";
    newPost.photo = @"https://avatars0.githubusercontent.com/u/724423?v=3&s=96";
    newPost.post = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. https://github.com/facebook/AsyncDisplayKit Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
    newPost.time = @"yesterday";
    newPost.media = @"";
    newPost.via = 1;
    newPost.likes = arc4random_uniform(74);
    newPost.comments = arc4random_uniform(40);
    [socialAppDataSource addObject:newPost];
    
    return socialAppDataSource;
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
