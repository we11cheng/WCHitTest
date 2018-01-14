//
//  WCSecView.m
//  WCHitTest
//
//  Created by gwc on 14/01/2018.
//  Copyright © 2018 gwc. All rights reserved.
//

#import "WCSecView.h"

@interface WCSecView () {
    
}

@property (nonatomic, strong) UIButton *buttonSecond;

@end

@implementation WCSecView

- (UIButton *)buttonSecond {
    if (_buttonSecond == nil) {
        _buttonSecond = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonSecond.frame = CGRectMake(50, 80, 100, 50);
        [_buttonSecond setBackgroundColor:[UIColor redColor]];
        [_buttonSecond setTitle:@"second" forState:UIControlStateNormal];
        [_buttonSecond setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_buttonSecond addTarget:self action:@selector(actionButtonSecondClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonSecond;
}

- (void)actionButtonSecondClick:(id)sender {
    NSLog(@"second button click");
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.buttonSecond];
        self.backgroundColor = [UIColor purpleColor];
    }
    return self;
}

/*
 打开下方注释代码。点中第一个View中buttonFirst按钮（被第二个View遮住了,可以查看视图层级获取位置）。第一个按钮可以响应事件。
*/

/*
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *hitView = [super hitTest:point withEvent:event];
    if (hitView == self) {
        return nil;//此处返回nil，表示当前视图不是hit-TestView
    }
    else {
        return hitView;
    }
}
 */

@end
