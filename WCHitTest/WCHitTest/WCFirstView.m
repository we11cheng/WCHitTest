//
//  WCFirstView.m
//  WCHitTest
//
//  Created by gwc on 14/01/2018.
//  Copyright © 2018 gwc. All rights reserved.
//

#import "WCFirstView.h"

@interface WCFirstView () {
    
}

@property (nonatomic, strong) UIButton *buttonFirst;

@end

@implementation WCFirstView

- (UIButton *)buttonFirst {
    if (_buttonFirst == nil) {
        _buttonFirst = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonFirst.frame = CGRectMake(50, 40, 100, 50);
        [_buttonFirst setTitle:@"first" forState:UIControlStateNormal];
        [_buttonFirst setBackgroundColor:[UIColor orangeColor]];
        [_buttonFirst setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_buttonFirst addTarget:self action:@selector(actionButtonFirstClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonFirst;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.buttonFirst];
        self.backgroundColor = [UIColor cyanColor];
    }
    return self;
}


- (void)actionButtonFirstClick:(id)sender {
    NSLog(@"first button click");
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    // 当touch point是在self.buttonFirst上，则hitTest返回self.buttonFirst
    CGPoint btnPointInA = [self.buttonFirst convertPoint:point fromView:self];
    if ([self.buttonFirst pointInside:btnPointInA withEvent:event]) {
        return self.buttonFirst;
    }
    // 否则，返回默认处理
    return [super hitTest:point withEvent:event];
    
}

@end
