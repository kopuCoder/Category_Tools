//
//  UIView+sk_tools.h
//  CategoryMethodCollections
//
//  Created by Bruce_Mac on 2020/5/10.
//  Copyright © 2020 SoulLink. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView(sk_tools)
/**
 任意view设置圆角
 使用自动布局，需要在layoutsubviews 中使用
 @param radius 圆角尺寸
 @param corner 圆角位置,0默认全部切角
 */
- (void)sk_radiusWithRadius:(CGFloat)radius corner:(UIRectCorner)corner;

@end

NS_ASSUME_NONNULL_END
