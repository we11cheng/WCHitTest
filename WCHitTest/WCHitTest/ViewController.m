//
//  ViewController.m
//  WCHitTest
//
//  Created by gwc on 14/01/2018.
//  Copyright © 2018 gwc. All rights reserved.
//

#import "ViewController.h"
#import "WCFirstView.h"
#import "WCSecView.h"

#define kScreenW [[UIScreen mainScreen] bounds].size.width

@interface ViewController ()

@property (nonatomic, strong) WCFirstView *firstView;
@property (nonatomic, strong) WCSecView *secondView;

@end

@implementation ViewController

- (WCFirstView *)firstView {
    if (_firstView == nil) {
        _firstView = [[WCFirstView alloc] initWithFrame:CGRectMake((kScreenW -200)/2, 200, 200, 200)];
    }
    return _firstView;
}

- (WCSecView *)secondView {
    if (_secondView == nil) {
        _secondView = [[WCSecView alloc] initWithFrame:CGRectMake((kScreenW -200)/2, 100, 200, 200)];
    }
    return _secondView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor  yellowColor];
    [self.view addSubview:self.firstView];
    [self.view addSubview:self.secondView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
