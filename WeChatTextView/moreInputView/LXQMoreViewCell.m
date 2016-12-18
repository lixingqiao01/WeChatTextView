//
//  LXQMoreViewCell.m
//  WeChatTextView
//
//  Created by lixingqiao01@163.com on 2016/12/16.
//  Copyright © 2016年 LXQ.inc. All rights reserved.
//

#import "LXQMoreViewCell.h"

@implementation LXQMoreViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor colorWithRed:251/255.0f green:251/255.0f blue:251/255.0f alpha:1];
        [self setUI];
    }
    return self;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        
//        self.backgroundColor = [UIColor colorWithRed:251/255.0f green:251/255.0f blue:251/255.0f alpha:1];
        [self setUI];
    }
    return self;
}

- (void)setUI{
//    self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
    self.iconImageView = [UIImageView new];
    self.iconImageView.layer.masksToBounds = YES;
    self.iconImageView.layer.cornerRadius = 15;
    self.iconImageView.backgroundColor = [UIColor colorWithRed:251/255.0f green:251/255.0f blue:251/255.0f alpha:1];
    self.iconImageView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.iconImageView.layer.borderWidth = 1;
    [self.contentView addSubview:self.iconImageView];
    
    self.iconImageView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *iconTop = [NSLayoutConstraint constraintWithItem:self.iconImageView
                                                               attribute:NSLayoutAttributeTop
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.contentView
                                                               attribute:NSLayoutAttributeTop
                                                              multiplier:1.0
                                                                constant:0];
    [self.contentView addConstraint:iconTop];
    
    NSLayoutConstraint *iconLeft = [NSLayoutConstraint constraintWithItem:self.iconImageView
                                                                attribute:NSLayoutAttributeLeft
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.contentView
                                                                attribute:NSLayoutAttributeLeft
                                                               multiplier:1.0
                                                                 constant:0];
    [self.contentView addConstraint:iconLeft];
    
    NSLayoutConstraint *iconRight = [NSLayoutConstraint constraintWithItem:self.iconImageView
                                                                 attribute:NSLayoutAttributeRight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeRight
                                                                multiplier:1.0
                                                                  constant:0];
    [self.contentView addConstraint:iconRight];
    
    NSLayoutConstraint *iconHeight = [NSLayoutConstraint constraintWithItem:self.iconImageView
                                                                  attribute:NSLayoutAttributeHeight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:nil
                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                 multiplier:1.0
                                                                   constant:60];
    [self.iconImageView addConstraint:iconHeight];
    
    self.titleLabel = [UILabel new];
    self.titleLabel.textColor = [UIColor colorWithRed:136/255.0f green:136/255.0f blue:136/255.0f alpha:1];
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.titleLabel];
    
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *titleTop = [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.iconImageView
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1.0
                                                                 constant:5];
    [self.contentView addConstraint:titleTop];
    
    NSLayoutConstraint *titleLeft = [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                 attribute:NSLayoutAttributeLeft
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.iconImageView
                                                                 attribute:NSLayoutAttributeLeft
                                                                multiplier:1.0
                                                                  constant:0];
    [self.contentView addConstraint:titleLeft];
    
    NSLayoutConstraint *titleRight = [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                  attribute:NSLayoutAttributeRight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.iconImageView
                                                                  attribute:NSLayoutAttributeRight
                                                                 multiplier:1.0
                                                                   constant:0];
    [self.contentView addConstraint:titleRight];
    
    NSLayoutConstraint *titleHeight = [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                   attribute:NSLayoutAttributeHeight
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:nil
                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                  multiplier:1.0
                                                                    constant:15];
    [self.titleLabel addConstraint:titleHeight];
}

@end
