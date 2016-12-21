//
//  LXQEmotionCollectionViewLayout.h
//  WeChatTextView
//
//  Created by lixingqiao01@163.com on 2016/12/20.
//  Copyright © 2016年 LXQ.inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LXQEmotionCollectionViewLayout;

@protocol LXQEmotionCollectionViewLayoutDelegate <NSObject>
@optional

- (NSInteger)emotionCollectionView:(UICollectionView *)collectionView layout:(LXQEmotionCollectionViewLayout *)layout lineNumberForSectionAtIndex:(NSInteger)section;
- (UIEdgeInsets)emotionCollectionView:(UICollectionView *)collectionView layout:(LXQEmotionCollectionViewLayout *)layout insetForSectionAtIndex:(NSInteger)section;
- (CGFloat)emotionCollectionView:(UICollectionView *)collectionView layout:(LXQEmotionCollectionViewLayout *)layout rowSpacingForSectionAtIndex:(NSInteger)section;
- (CGFloat)emotionCollectionView:(UICollectionView *)collectionView layout:(LXQEmotionCollectionViewLayout *)layout lineSpacingForSectionAtIndex:(NSInteger)section;
- (CGSize)emotionCollectionView:(UICollectionView *)collectionView layout:(LXQEmotionCollectionViewLayout *)layout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface LXQEmotionCollectionViewLayout : UICollectionViewLayout

@property (nonatomic, assign)   NSInteger           lineNumber;

@property (nonatomic, assign)   UIEdgeInsets        sectionInset;

@property (nonatomic, assign)   CGFloat             rowSpacing;

@property (nonatomic, assign)   CGFloat             lineSpacing;

@property (nonatomic, assign)   CGSize              itemSize;

@property (nonatomic, assign)   id<LXQEmotionCollectionViewLayoutDelegate>          delegate;

@end
