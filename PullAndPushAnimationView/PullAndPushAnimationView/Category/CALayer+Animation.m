//
//  CALayer+Animation.m
//  PullAndPushAnimationView
//
//  Created by Felix Yin on 2020/5/29.
//  Copyright © 2020 Felix Yin. All rights reserved.
//

#import "CALayer+Animation.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#define kAnimationDuration 0.25
@implementation CALayer (Animation)

/**

 下拉展示效果动画 默认动画时间0.25s

 */

- (void)pullShowAnimation {
    [self pullShowAnimationWithDuration:kAnimationDuration];
}



/**

 下拉展示效果动画

 */

- (void)pullShowAnimationWithDuration:(CFTimeInterval)duration {
    CGFloat y = self.frame.origin.y;
    self.originalAnchorPoint = self.anchorPoint;
    self.originalPosition = self.position;
    self.anchorPoint = CGPointMake(0.5, 0);
    self.position = CGPointMake(self.position.x, y);
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    animation.delegate = self;
    animation.duration = duration ?: kAnimationDuration;
    animation.fromValue = @0;
    animation.toValue = @1;
    [self addAnimation:animation forKey:@"pullShowAnimation"];
}



/**

 上拉关闭动画效果 默认动画时间0.25s

 */

- (void)pushHideAnimationWithFinishBlk:(void(^)(CALayer * layer))finishBlk {
    [self pushHideAnimationWithDuration:kAnimationDuration finishBlk:finishBlk];
}



/**

 上拉关闭动画效果

 */

- (void)pushHideAnimationWithDuration:(CFTimeInterval)duration finishBlk:(void(^)(CALayer * layer))finishBlk {
    self.finishBlk = finishBlk;
    CGFloat y = self.frame.origin.y;
    self.originalAnchorPoint = self.anchorPoint;
    self.originalPosition = self.position;
    self.anchorPoint = CGPointMake(0.5, 0);
    self.position = CGPointMake(self.position.x, y);
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    animation.delegate = self;
    animation.duration = duration ?: kAnimationDuration;
    animation.fromValue = @1;
    animation.toValue = @0;
    [self addAnimation:animation forKey:@"pushHideAnimation"];
}



/**

 上拉展示动画效果 默认动画时间0.25s

 */

- (void)pushShowAnimation {
    [self pushShowAnimationWithDuration:kAnimationDuration];
}



/**

 上拉展示动画效果

 */

- (void)pushShowAnimationWithDuration:(CFTimeInterval)duration {
    CGFloat y = self.frame.origin.y + self.bounds.size.height;
    self.originalAnchorPoint = self.anchorPoint;
    self.originalPosition = self.position;
    self.anchorPoint = CGPointMake(0.5, 1);
    self.position = CGPointMake(self.position.x, y);
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    animation.delegate = self;
    animation.duration = duration ?: kAnimationDuration;
    animation.fromValue = @0;
    animation.toValue = @1;
    [self addAnimation:animation forKey:@"pushShowAnimation"];
}



/**

 下拉关闭效果动画 默认动画时间0.25s

 */

- (void)pullHideAnimationWithFinishBlk:(void(^)(CALayer * layer))finishBlk {
    [self pullHideAnimationWithDuration:kAnimationDuration finishBlk:finishBlk];
}



/**

 下拉关闭效果动画

 */

- (void)pullHideAnimationWithDuration:(CFTimeInterval)duration finishBlk:(void(^)(CALayer * layer))finishBlk {
    self.finishBlk = finishBlk;
    CGFloat y = self.frame.origin.y + self.bounds.size.height;
    self.originalAnchorPoint = self.anchorPoint;
    self.originalPosition = self.position;
    self.anchorPoint = CGPointMake(0.5, 1);
    self.position = CGPointMake(self.position.x, y);
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    animation.delegate = self;
    animation.duration = duration ?: kAnimationDuration;
    animation.fromValue = @1;
    animation.toValue = @0;
    [self addAnimation:animation forKey:@"pullHideAnimation"];
}





/**

 模仿系统弹框展示动画 默认动画时间0.25s

 */

- (void)systemAlertShowAnimation {
    [self systemAlertShowAnimationWithDuration:kAnimationDuration];
}



/**

 模仿系统弹框展示动画

 */

- (void)systemAlertShowAnimationWithDuration:(CFTimeInterval)duration {
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = duration;
    animation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    animation.keyTimes = @[@0.0f, @0.5f, @0.75f, @1.0f];
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [self addAnimation:animation forKey:@"ystemAlertShowAnimation"];
}



/**

 模仿系统弹框关闭动画 默认动画时间0.25s

 */

- (void)systemAlertHideAnimationWithFinishBlk:(void(^)(CALayer * layer))finishBlk {
    [self systemAlertHideAnimationWithDuration:kAnimationDuration finishBlk:finishBlk];
}



/**

 模仿系统弹框关闭动画

 */

- (void)systemAlertHideAnimationWithDuration:(CFTimeInterval)duration finishBlk:(void(^)(CALayer * layer))finishBlk {
    self.finishBlk = finishBlk;
    self.anchorPoint = self.anchorPoint;
    self.position = self.position;
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = duration;
    animation.values = @[
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0f, 1.0f, 1.0f)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)]
                         ];

    animation.keyTimes = @[@0.0f, @0.5f, @0.75f, @1.0f];
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    animation.delegate = self;
    [self addAnimation:animation forKey:@"systemAlertHideAnimation"];
}



//MARK:、、、、、、、、、、、、、、、、、、animationDelegate、、、、、、、、、、、、、、、

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    self.anchorPoint = self.originalAnchorPoint;
    self.position = self.originalPosition;
    !self.finishBlk?:self.finishBlk(self);
}























//////////////////////////////////////////////////////内部使用/////////////////////////////////////////////////////////

- (void)setOriginalAnchorPoint:(CGPoint)originalAnchorPoint {

    objc_setAssociatedObject(self, @selector(originalAnchorPoint), [NSValue valueWithCGPoint:originalAnchorPoint], OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}



- (CGPoint)originalAnchorPoint {

    return [objc_getAssociatedObject(self,@selector(originalAnchorPoint)) CGPointValue];

}



- (void)setOriginalPosition:(CGPoint)originalPosition {

    objc_setAssociatedObject(self, @selector(originalPosition), [NSValue valueWithCGPoint:originalPosition], OBJC_ASSOCIATION_RETAIN_NONATOMIC);



}



- (CGPoint)originalPosition {

    return [objc_getAssociatedObject(self,@selector(originalPosition)) CGPointValue];
}



- (void)setFinishBlk:(void (^)(CALayer *))finishBlk {

    objc_setAssociatedObject(self, @selector(finishBlk), finishBlk, OBJC_ASSOCIATION_COPY_NONATOMIC);

}



- (void (^)(CALayer *))finishBlk {

    return objc_getAssociatedObject(self, @selector(finishBlk));

}

@end
