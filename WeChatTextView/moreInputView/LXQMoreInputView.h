//
//  LXQMoreInputView.h
//  WeChatTextView
//
//  Created by lixingqiao01@163.com on 2016/12/15.
//  Copyright © 2016年 LXQ.inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXQMoreInputView : UIView

/**
 聊天室Controller
 */
@property (nonatomic, weak) UIViewController *chatViewController;

/**
 开始动画
 */
- (void)startAnimation;

+ (LXQMoreInputView *)shareMoreInputView;

@end
