//
//  LXQCollectionViewLayout.m
//  WeChatTextView
//
//  Created by lixingqiao01@163.com on 2016/12/17.
//  Copyright © 2016年 LXQ.inc. All rights reserved.
//

#import "LXQCollectionViewLayout.h"

@interface LXQCollectionViewLayout ()

@property (nonatomic, assign)   int         rowOfNumber;

@property (nonatomic, strong)   NSMutableArray          *attributesArray;

@end

@implementation LXQCollectionViewLayout

- (instancetype)init{
    self = [super init];
    if (self) {
        self.attributesArray = [NSMutableArray array];
    }
    return self;
}

- (void)prepareLayout{
    [super prepareLayout];
    
    CGFloat number = self.sectionInsets.left + self.sectionInsets.right;
    
    CGFloat showRect = self.collectionView.frame.size.width - number;
    
    for (int i = 1; number <= showRect; i ++) {
        number = self.sectionInsets.left + self.sectionInsets.right;
        number = number + i * self.itemSize.width + (i - 1) * self.rowSpacing;
        self.rowOfNumber = i;
    }
    
    for (int i = 0; i < self.collectionView.numberOfSections; i++) {
        NSInteger count = [self.collectionView numberOfItemsInSection:i];
        for (int j = 0; j < count; j ++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:j inSection:i];
            [self.attributesArray addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
        }
    }
    
    NSLog(@"5555 = %lu == %d",self.collectionView.numberOfSections,self.rowOfNumber);
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    CGRect frame;
    frame.size = self.itemSize;
    frame.origin = CGPointMake((self.sectionInsets.left + (self.itemSize.width + self.rowSpacing) * (indexPath.row % self.rowOfNumber)) + (self.collectionView.frame.size.width *indexPath.section), self.sectionInsets.top + (self.itemSize.height + self.lineSpacing) * (indexPath.row / self.rowOfNumber));
    attributes.frame = frame;
    return attributes;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return self.attributesArray;
}

- (CGSize)collectionViewContentSize{
    return CGSizeMake(self.collectionView.frame.size.width * self.collectionView.numberOfSections, self.collectionView.frame.size.height);
}

@end
