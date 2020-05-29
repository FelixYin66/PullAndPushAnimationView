//
//  UIView+Animation.m
//  PullAndPushAnimationView
//
//  Created by Felix Yin on 2020/5/29.
//  Copyright © 2020 Felix Yin. All rights reserved.
//

#import "UIView+Animation.h"
#import "CALayer+Animation.h"

#define kAnimationDuration 0.25

@implementation UIView (Animation)

/**

 下拉展示效果动画 默认动画时间0.25s

 */

- (void)pullShowAnimation {
    [self.layer pullShowAnimationWithDuration:kAnimationDuration];
}



/**

 上拉关闭动画效果 默认动画时间0.25s

 */

- (void)pushHideAnimationWithFinishBlk:(void(^)(UIView * view))finishBlk {
    __weak typeof(self) weakSelf = self;
    [self.layer pushHideAnimationWithDuration:kAnimationDuration finishBlk:^(CALayer *layer) {
        __strong typeof(self) strongSelf = weakSelf;
        !finishBlk?:finishBlk(strongSelf);
    }];
}



/**

 下拉展示效果动画

 */

- (void)pullShowAnimationWithDuration:(CFTimeInterval)duration {
    [self.layer pullShowAnimationWithDuration:duration];
}



/**

 上拉关闭动画效果

 */

- (void)pushHideAnimationWithDuration:(CFTimeInterval)duration finishBlk:(void(^)(UIView * view))finishBlk {
    __weak typeof(self) weakSelf = self;
    [self.layer pushHideAnimationWithDuration:duration finishBlk:^(CALayer *layer) {
        __strong typeof(self) strongSelf = weakSelf;
        !finishBlk?:finishBlk(strongSelf);
    }];
}



/**

 上拉展示动画效果 默认动画时间0.25s

 */

- (void)pushShowAnimation {
    [self.layer pushShowAnimationWithDuration:kAnimationDuration];
}



/**

 上拉展示动画效果

 */

- (void)pushShowAnimationWithDuration:(CFTimeInterval)duration {
    [self.layer pushShowAnimationWithDuration:duration];
}



/**

 下拉关闭效果动画 默认动画时间0.25s

 */

- (void)pullHideAnimationWithFinishBlk:(void(^)(UIView * view))finishBlk {
    __weak typeof(self) weakSelf = self;
    [self.layer pullHideAnimationWithDuration:kAnimationDuration finishBlk:^(CALayer *layer) {
        __strong typeof(self) strongSelf = weakSelf;
        !finishBlk?:finishBlk(strongSelf);
    }];
}



/**

 下拉关闭效果动画

 */

- (void)pullHideAnimationWithDuration:(CFTimeInterval)duration finishBlk:(void(^)(UIView * view))finishBlk {
    __weak typeof(self) weakSelf = self;
    [self.layer pullHideAnimationWithDuration:duration finishBlk:^(CALayer *layer) {
        __strong typeof(self) strongSelf = weakSelf;
        !finishBlk?:finishBlk(strongSelf);
    }];

}



/**

 模仿系统弹框展示动画 默认动画时间0.25s

 */

- (void)systemAlertShowAnimation {
    [self.layer systemAlertShowAnimationWithDuration:kAnimationDuration];
}



/**

 模仿系统弹框展示动画

 */

- (void)systemAlertShowAnimationWithDuration:(CFTimeInterval)duration {
    [self.layer systemAlertShowAnimationWithDuration:duration];
}



/**

 模仿系统弹框关闭动画 默认动画时间0.25s

 */

- (void)systemAlertHideAnimationWithFinishBlk:(void(^)(UIView * view))finishBlk {
    __weak typeof(self) weakSelf = self;
    [self.layer systemAlertHideAnimationWithDuration:kAnimationDuration finishBlk:^(CALayer *layer) {
        __strong typeof(self) strongSelf = weakSelf;
        !finishBlk?:finishBlk(strongSelf);
    }];
}



/**

 模仿系统弹框关闭动画

 */

- (void)systemAlertHideAnimationWithDuration:(CFTimeInterval)duration finishBlk:(void(^)(UIView * view))finishBlk {
    __weak typeof(self) weakSelf = self;
    [self.layer systemAlertHideAnimationWithDuration:duration finishBlk:^(CALayer *layer) {
        __strong typeof(self) strongSelf = weakSelf;
        !finishBlk?:finishBlk(strongSelf);
    }];
}

@end
