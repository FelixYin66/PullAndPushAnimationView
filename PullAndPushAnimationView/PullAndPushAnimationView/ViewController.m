//
//  ViewController.m
//  PullAndPushAnimationView
//
//  Created by Felix Yin on 2020/5/29.
//  Copyright © 2020 Felix Yin. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Animation.h"

@interface ViewController ()

@property(nonatomic,strong) UIView *view1;
@property(nonatomic,assign) NSInteger number;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.view1];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.number++;
    if (self.number%2 == 0) {
        [self.view1 pullHideAnimationWithFinishBlk:^(UIView * _Nonnull view) {
            NSLog(@"Hidden === %zd",self.number);
//            self.view1.hidden = YES;
        }];
    }else{
        NSLog(@"Show === %zd",self.number);
        self.view1.hidden = NO;
        [self.view1 pullShowAnimation];
    }
    
    
}

//    MARK: Lazy Loading

- (UIView *)view1{
    if (!_view1) {
        _view1 = [[UIView alloc] init];
        _view1.frame = CGRectMake(100, 100, 200, 150);
        _view1.backgroundColor = [UIColor redColor];
        _view1.hidden = YES;
    }
    return _view1;
}


@end
