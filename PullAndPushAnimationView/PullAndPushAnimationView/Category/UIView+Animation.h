//
//  UIView+Animation.h
//  PullAndPushAnimationView
//
//  Created by Felix Yin on 2020/5/29.
//  Copyright © 2020 Felix Yin. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Animation)



/**

 下拉展示效果动画 默认动画时间0.25s

 */

- (void)pullShowAnimation;



/**

 上拉关闭动画效果 默认动画时间0.25s

 */

- (void)pushHideAnimationWithFinishBlk:(void(^)(UIView * view))finishBlk;



/**

 下拉展示效果动画

 */

- (void)pullShowAnimationWithDuration:(CFTimeInterval)duration;



/**

 上拉关闭动画效果

 */

- (void)pushHideAnimationWithDuration:(CFTimeInterval)duration finishBlk:(void(^)(UIView * view))finishBlk;



/**

 上拉展示动画效果 默认动画时间0.25s

 */

- (void)pushShowAnimation;



/**

 上拉展示动画效果

 */

- (void)pushShowAnimationWithDuration:(CFTimeInterval)duration;



/**

 下拉关闭效果动画 默认动画时间0.25s

 */

- (void)pullHideAnimationWithFinishBlk:(void(^)(UIView * view))finishBlk;



/**

 下拉关闭效果动画

 */

- (void)pullHideAnimationWithDuration:(CFTimeInterval)duration finishBlk:(void(^)(UIView * view))finishBlk;



/**

 模仿系统弹框展示动画 默认动画时间0.25s

 */

- (void)systemAlertShowAnimation;



/**

 模仿系统弹框展示动画

 */

- (void)systemAlertShowAnimationWithDuration:(CFTimeInterval)duration;



/**

 模仿系统弹框关闭动画 默认动画时间0.25s

 */

- (void)systemAlertHideAnimationWithFinishBlk:(void(^)(UIView * view))finishBlk;



/**

 模仿系统弹框关闭动画

 */

- (void)systemAlertHideAnimationWithDuration:(CFTimeInterval)duration finishBlk:(void(^)(UIView * view))finishBlk;


@end

NS_ASSUME_NONNULL_END
