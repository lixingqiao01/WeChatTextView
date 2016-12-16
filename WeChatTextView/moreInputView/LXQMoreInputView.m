//
//  LXQMoreInputView.m
//  WeChatTextView
//
//  Created by lixingqiao01@163.com on 2016/12/15.
//  Copyright © 2016年 LXQ.inc. All rights reserved.
//

#import "LXQMoreInputView.h"

@interface LXQMoreInputView ()

@property (nonatomic, assign)   CGSize screen_size;

@property (nonatomic, strong)   CADisplayLink *displayLink;

@property (nonatomic, assign)   CGRect  tmpFrame;

@property (nonatomic, strong)   UIPageControl *pageControl;

@end

@implementation LXQMoreInputView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

+ (LXQMoreInputView *)shareMoreInputView{
    static LXQMoreInputView *moreInputView = nil;
    @synchronized (self) {
        if (moreInputView == nil) {
            moreInputView = [[LXQMoreInputView alloc]init];
        }
    }
    return moreInputView;
}

- (void)setChatViewController:(UIViewController *)chatViewController{
    _chatViewController = chatViewController;
    self.frame = CGRectMake(0, CGRectGetMaxY(chatViewController.view.frame), CGRectGetWidth(chatViewController.view.frame), MOREINPUTVIEW_MAX_HEIGHT);
}

- (void)setUI{
    self.backgroundColor = [UIColor redColor];
    self.pageControl = [[UIPageControl alloc]init];
    self.pageControl.numberOfPages = 2;
    [self addSubview:self.pageControl];
    self.pageControl.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *pageLeft = [NSLayoutConstraint constraintWithItem:self.pageControl
                                                                attribute:NSLayoutAttributeLeft
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self
                                                                attribute:NSLayoutAttributeLeft
                                                               multiplier:1.0
                                                                 constant:10];
    [self addConstraint:pageLeft];
    
    NSLayoutConstraint *pageBottom = [NSLayoutConstraint constraintWithItem:self.pageControl
                                                                  attribute:NSLayoutAttributeBottom
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self
                                                                  attribute:NSLayoutAttributeBottom
                                                                 multiplier:1.0
                                                                   constant:-15];
    [self addConstraint:pageBottom];
    
    NSLayoutConstraint *pageRight = [NSLayoutConstraint constraintWithItem:self.pageControl
                                                                 attribute:NSLayoutAttributeRight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self
                                                                 attribute:NSLayoutAttributeRight
                                                                multiplier:1.0
                                                                  constant:-10];
    [self addConstraint:pageRight];
    
    NSLayoutConstraint *pageHeight = [NSLayoutConstraint constraintWithItem:self.pageControl
                                                                  attribute:NSLayoutAttributeHeight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:nil
                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                 multiplier:1.0
                                                                   constant:10];
    [self addConstraint:pageHeight];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
