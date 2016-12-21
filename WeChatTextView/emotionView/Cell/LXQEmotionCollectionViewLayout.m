//
//  LXQEmotionCollectionViewLayout.m
//  WeChatTextView
//
//  Created by lixingqiao01@163.com on 2016/12/20.
//  Copyright © 2016年 LXQ.inc. All rights reserved.
//

#import "LXQEmotionCollectionViewLayout.h"

@interface LXQEmotionCollectionViewLayout ()

@property (nonatomic, strong)   NSMutableArray<UICollectionViewLayoutAttributes *>              *attributesArray;

@property (nonatomic, assign)   NSInteger                                                       rowOfNumbers;

@end

@implementation LXQEmotionCollectionViewLayout

- (instancetype)init{
    self = [super init];
    if (self) {
        self.attributesArray = [NSMutableArray array];
        self.rowOfNumbers = 0;
    }
    return self;
}

- (void)prepareLayout{
    [super prepareLayout];
    
    if (self.lineNumber < 1) {
        self.lineNumber = 1;
    }
    
    CGFloat number = self.sectionInset.left + self.sectionInset.right;
    
    CGFloat showWidth = self.collectionView.frame.size.width - number;
    
    CGFloat showHeight = self.collectionView.frame.size.height - self.sectionInset.top - self.sectionInset.bottom;
    
    for (int i = 1; number<= showWidth; i ++) {
        number = self.sectionInset.left + self.sectionInset.right;
        number = number + i * self.itemSize.width + (i - 1) * self.rowSpacing;
        self.rowOfNumbers = i;
    }
    
    for (int i = 0; i < self.collectionView.numberOfSections; i++) {
        NSInteger count = [self.collectionView numberOfItemsInSection:i];
        for (int j = 0; j < count; j ++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:j inSection:i];
            
            if ([self.delegate respondsToSelector:@selector(emotionCollectionView:layout:insetForSectionAtIndex:)]) {
                self.sectionInset = [self.delegate emotionCollectionView:self.collectionView layout:self insetForSectionAtIndex:indexPath.section];
            }
            
            if ([self.delegate respondsToSelector:@selector(emotionCollectionView:layout:sizeForItemAtIndexPath:)]) {
                self.itemSize = [self.delegate emotionCollectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
            }
            
            if ([self.delegate respondsToSelector:@selector(emotionCollectionView:layout:rowSpacingForSectionAtIndex:)]) {
                self.rowSpacing = [self.delegate emotionCollectionView:self.collectionView layout:self rowSpacingForSectionAtIndex:indexPath.section];
            }
            
            if ([self.delegate respondsToSelector:@selector(emotionCollectionView:layout:lineSpacingForSectionAtIndex:)]) {
                self.lineSpacing = [self.delegate emotionCollectionView:self.collectionView layout:self lineSpacingForSectionAtIndex:indexPath.section];
            }
            
            if ([self.delegate respondsToSelector:@selector(emotionCollectionView:layout:lineNumberForSectionAtIndex:)]) {
                self.lineNumber = [self.delegate emotionCollectionView:self.collectionView layout:self lineNumberForSectionAtIndex:indexPath.section];
            }
            
            [self.attributesArray addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
        }
    }
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    NSInteger showRows = self.rowOfNumbers * self.lineNumber;
    NSLog(@"showRows == %ld",showRows);
    
    CGFloat itemX = self.sectionInset.left + (self.itemSize.width + self.rowSpacing) * (indexPath.row % self.rowOfNumbers) + self.collectionView.frame.size.width * (indexPath.row / showRows);
    
    NSInteger lineNumber = indexPath.row / self.rowOfNumbers;
    
    NSLog(@"indexPath.row = %ld",indexPath.row);
    NSLog(@"lineNUmber = %ld",lineNumber);
    NSLog(@"line = %ld",lineNumber/self.lineNumber);
    
    CGFloat itemY = self.sectionInset.top + (self.itemSize.height + self.lineSpacing) * (lineNumber % self.lineNumber);
    
    CGRect frame;
    frame.size = self.itemSize;
//    frame.origin = CGPointMake((self.sectionInset.left + (self.itemSize.width + self.rowSpacing) * (indexPath.row % self.rowOfNumbers)) + (self.collectionView.frame.size.width *indexPath.section), self.sectionInset.top + (self.itemSize.height + self.lineSpacing) * (indexPath.row / self.rowOfNumbers));
    frame.origin = CGPointMake(itemX, itemY);
    attributes.frame = frame;
    
    return attributes;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return self.attributesArray;
}

- (CGSize)collectionViewContentSize{
    return CGSizeMake(self.collectionView.frame.size.width * 4, self.collectionView.frame.size.height);
}

@end
