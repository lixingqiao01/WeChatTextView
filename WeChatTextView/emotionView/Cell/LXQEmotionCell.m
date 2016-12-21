//
//  LXQEmotionCell.m
//  WeChatTextView
//
//  Created by lixingqiao01@163.com on 2016/12/20.
//  Copyright © 2016年 LXQ.inc. All rights reserved.
//

#import "LXQEmotionCell.h"

@implementation LXQEmotionCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor redColor];
        [self setUI];
    }
    return self;
}

- (void)setUI{
    self.emotionImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:self.emotionImageView];
    self.emotionImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.emotionImageView
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.contentView
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1.0
                                                            constant:0];
    
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self.emotionImageView
                                                            attribute:NSLayoutAttributeLeft
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.contentView
                                                            attribute:NSLayoutAttributeLeft
                                                           multiplier:1.0
                                                             constant:0];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.emotionImageView
                                                              attribute:NSLayoutAttributeBottom
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.contentView
                                                              attribute:NSLayoutAttributeBottom
                                                             multiplier:1.0
                                                               constant:0];
    
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self.emotionImageView
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.contentView
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1.0
                                                              constant:0];
    [self.contentView addConstraints:@[top,left,bottom,right]];
}

@end
