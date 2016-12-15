//
//  UIButton+setImage.m
//  animation
//
//  Created by lixingqiao01@163.com on 2016/12/13.
//  Copyright © 2016年 bsj. All rights reserved.
//

#import "UIButton+setImage.h"

@implementation UIButton (setImage)

- (void)setNormalImage:(UIImage *)aImage SelectImage:(UIImage *)bImage{
    [self setImage:aImage forState:UIControlStateNormal];
    [self setImage:bImage forState:UIControlStateSelected];
}

@end
