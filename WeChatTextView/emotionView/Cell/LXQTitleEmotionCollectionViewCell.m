//
//  LXQTitleEmotionCollectionViewCell.m
//  WeChatTextView
//
//  Created by lixingqiao01@163.com on 2016/12/18.
//  Copyright © 2016年 LXQ.inc. All rights reserved.
//

#import "LXQTitleEmotionCollectionViewCell.h"

#define TITLEEMOTIONIMAGEVIEW_MAX_HEIGHT        25

@interface LXQTitleEmotionCollectionViewCell ()


@end

@implementation LXQTitleEmotionCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    self.titleEmotionImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:self.titleEmotionImageView];
    
    self.titleEmotionImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *titleCenterX = [NSLayoutConstraint constraintWithItem:self.titleEmotionImageView
                                                                    attribute:NSLayoutAttributeCenterX
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.contentView
                                                                    attribute:NSLayoutAttributeCenterX
                                                                   multiplier:1.0
                                                                     constant:0];
    [self.contentView addConstraint:titleCenterX];
    
    NSLayoutConstraint *titleCenterY = [NSLayoutConstraint constraintWithItem:self.titleEmotionImageView
                                                                    attribute:NSLayoutAttributeCenterY
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.contentView
                                                                    attribute:NSLayoutAttributeCenterY
                                                                   multiplier:1.0
                                                                     constant:0];
    [self.contentView addConstraint:titleCenterY];
    
    NSLayoutConstraint *titleHeight = [NSLayoutConstraint constraintWithItem:self.titleEmotionImageView
                                                                   attribute:NSLayoutAttributeHeight
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:nil
                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                  multiplier:1.0
                                                                    constant:25];
    [self.contentView addConstraint:titleHeight];
    
    NSLayoutConstraint *titleWidth = [NSLayoutConstraint constraintWithItem:self.titleEmotionImageView
                                                                  attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:nil
                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                 multiplier:1.0
                                                                   constant:25];
    [self.contentView addConstraint:titleWidth];
}

- (void)setTitleImage:(UIImage *)titleImage{
    NSLog(@"%@",titleImage);
    self.titleEmotionImageView.image = titleImage;
}

@end
