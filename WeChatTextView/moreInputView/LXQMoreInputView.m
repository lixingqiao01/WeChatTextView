//
//  LXQMoreInputView.m
//  WeChatTextView
//
//  Created by lixingqiao01@163.com on 2016/12/15.
//  Copyright © 2016年 LXQ.inc. All rights reserved.
//

#import "LXQMoreInputView.h"
#define MOREINPUTVIEW_MAX_HEIGHT 224

@interface LXQMoreInputView ()

@property (nonatomic, assign) CGSize screen_size;

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

- (void)setUI{
    self.screen_size = [UIScreen mainScreen].bounds.size;
    self.frame = CGRectMake(0, CGRectGetMaxY(self.superview.frame), _screen_size.width, MOREINPUTVIEW_MAX_HEIGHT);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
