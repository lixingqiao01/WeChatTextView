//
//  LXQCollectionViewLayout.h
//  WeChatTextView
//
//  Created by lixingqiao01@163.com on 2016/12/17.
//  Copyright © 2016年 LXQ.inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXQCollectionViewLayout : UICollectionViewLayout

@property (nonatomic, assign)   CGSize              itemSize;

/**
 左右Cell之间的间距
 */
@property (nonatomic, assign)   CGFloat             rowSpacing;

/**
 上下Cell的间距
 */
@property (nonatomic, assign)   CGFloat             lineSpacing;

@property (nonatomic, assign)   UIEdgeInsets        sectionInsets;

@end
