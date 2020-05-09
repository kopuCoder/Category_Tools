//
//  UIView+sk_tools.m
//  CategoryMethodCollections
//
//  Created by Bruce_Mac on 2020/5/10.
//  Copyright © 2020 SoulLink. All rights reserved.
//

#import "UIView+sk_tools.h"

@implementation UIView(sk_tools)

/**
 任意view设置圆角
 使用自动布局，需要在layoutsubviews 中使用
 @param radius 圆角尺寸
 @param corner 圆角位置,0默认全部切角
 */
- (void)sk_radiusWithRadius:(CGFloat)radius corner:(UIRectCorner)corner {
    
    CGRect descF = self.bounds;
    if(radius == 0){
        radius = MIN(descF.size.height, descF.size.width);
    }
    if(corner == 0){
        corner = UIRectCornerAllCorners;
    }
    
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:descF byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = path.CGPath;
    self.layer.mask = maskLayer;
}

@end


