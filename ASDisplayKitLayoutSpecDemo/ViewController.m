//
//  ViewController.m
//  ASDISPlayKitLayoutSpecDemo
//
//  Created by 童星 on 2017/8/28.
//  Copyright © 2017年 童星. All rights reserved.
//

#import "ViewController.h"
#import "ASLayoutDemoListViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [self.navigationController pushViewController:[[ASLayoutDemoListViewController alloc] init] animated:YES];
}


@end
