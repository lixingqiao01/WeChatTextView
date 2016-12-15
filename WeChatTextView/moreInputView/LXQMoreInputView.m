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

@property (nonatomic, assign)   CGSize screen_size;

@property (nonatomic, strong)   CADisplayLink *displayLink;

@property (nonatomic, assign)   CGRect  tmpFrame;

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

- (void)setUI{
//    [self startListenFrame];
    self.backgroundColor = [UIColor redColor];
}

#pragma mark 动画
- (void)startAnimation{
    NSLog(@"%@",self.superview);
    self.frame = CGRectMake(0, CGRectGetMaxY(self.superview.frame), self.superview.frame.size.width, MOREINPUTVIEW_MAX_HEIGHT);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = self.frame;
        rect.origin.y -= MOREINPUTVIEW_MAX_HEIGHT;
        self.frame = rect;
    }];
}

#pragma mark 监听frame的改变
- (void)startListenFrame{
    [self stopListenFrame];
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(listenFrame)];
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)stopListenFrame{
    [self.displayLink invalidate];
    self.displayLink  = nil;
    [self listenFrame];
}

- (void)listenFrame{
    CALayer *presentationLayer = self.layer.presentationLayer;
    if (presentationLayer.frame.origin.y != self.tmpFrame.origin.y) {
        NSLog(@"%g",presentationLayer.frame.origin.y);
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithFloat:presentationLayer.frame.origin.x],@"x",
                              [NSNumber numberWithFloat:presentationLayer.frame.origin.y],@"y",
                              [NSNumber numberWithFloat:presentationLayer.frame.size.height],@"height",
                              [NSNumber numberWithFloat:presentationLayer.frame.size.width],@"width",
                              nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"LXQNotificationMoreInputView" object:nil userInfo:dict];
    }
    self.tmpFrame = presentationLayer.frame;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
