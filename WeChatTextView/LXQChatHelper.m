//
//  LXQChatHelper.m
//  WeChatTextView
//
//  Created by lixingqiao01@163.com on 2016/12/15.
//  Copyright © 2016年 LXQ.inc. All rights reserved.
//

#import "LXQChatHelper.h"

@implementation LXQChatHelper

+ (LXQChatHelper *)shareChatHelper{
    static LXQChatHelper *chatHelper = nil;
    @synchronized (self) {
        if (chatHelper == nil) {
            chatHelper = [[LXQChatHelper alloc] init];
        }
    }
    return chatHelper;
}

- (void)showMoreInputView{
    [self.moreInputView startAnimation];
}

@end
