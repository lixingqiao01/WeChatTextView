//
//  LXQChatHelper.h
//  WeChatTextView
//
//  Created by lixingqiao01@163.com on 2016/12/15.
//  Copyright © 2016年 LXQ.inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LXQMoreInputView.h"
#import "LXQInputView.h"

@interface LXQChatHelper : NSObject

@property (nonatomic, weak) LXQMoreInputView            *moreInputView;

@property (nonatomic, weak) LXQInputView                *inputView;

@property (nonatomic, weak) UIViewController            *chatViewController;

+ (LXQChatHelper *)shareChatHelper;

- (void)showMoreInputView;

@end
