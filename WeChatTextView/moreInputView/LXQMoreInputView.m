//
//  LXQMoreInputView.m
//  WeChatTextView
//
//  Created by lixingqiao01@163.com on 2016/12/15.
//  Copyright © 2016年 LXQ.inc. All rights reserved.
//

#import "LXQMoreInputView.h"
#import "LXQMoreViewCell.h"
//#import "LXQCollectionViewFlowLayout.h"
#import "LXQCollectionViewLayout.h"

#define SCREEN_WIDTH            [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT           [UIScreen mainScreen].bounds.size.height

static NSString *MoreViewCellResulIdentifier = @"LXQMoreViewCell.h";

@interface LXQMoreInputView ()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>

@property (nonatomic, assign)   CGSize screen_size;

@property (nonatomic, strong)   CADisplayLink *displayLink;

@property (nonatomic, assign)   CGRect  tmpFrame;

@property (nonatomic, strong)   UIPageControl *pageControl;

@property (nonatomic, strong)   UICollectionView *collectionView;

@property (nonatomic, strong)   NSMutableArray      *dataArray;

//@property (nonatomic, strong)   LXQCollectionViewFlowLayout     *flowLayout;

@end

@implementation LXQMoreInputView

- (instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:1];
        [self setUI];
        [self setCollectionView];
        [self loadLocalData];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:1];
        [self setUI];
        [self setCollectionView];
        [self loadLocalData];
    }
    return self;
}

- (void)loadLocalData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MoreShareView" ofType:@"plist"];
    self.dataArray = [NSMutableArray arrayWithContentsOfFile:path];
    self.pageControl.numberOfPages = self.dataArray.count;
//    self.flowLayout.pageNum = self.dataArray.count;
    [self.collectionView reloadData];
}

- (void)setChatViewController:(UIViewController *)chatViewController{
    _chatViewController = chatViewController;
    self.frame = CGRectMake(0, CGRectGetMaxY(chatViewController.view.frame), CGRectGetWidth(chatViewController.view.frame), MOREINPUTVIEW_MAX_HEIGHT);
}

- (void)setUI{
//    self.backgroundColor = [UIColor redColor];
    self.pageControl = [[UIPageControl alloc]init];
//    self.pageControl.numberOfPages = 2;
    [self addSubview:self.pageControl];
    self.pageControl.pageIndicatorTintColor = [UIColor colorWithRed:187/255.0f green:187/255.0f blue:187/255.0f alpha:1];
    self.pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:139/255.0f green:139/255.0f blue:139/255.0f alpha:1];
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

- (void)setCollectionView{
//    self.flowLayout = [[LXQCollectionViewFlowLayout alloc]init];
//    self.flowLayout.itemSize = CGSizeMake(60, 80);
//    self.flowLayout.sectionInset = UIEdgeInsetsMake(10, 36, 10, 36);
//    self.flowLayout.minimumInteritemSpacing = 17;
//    self.flowLayout.pageNum = self.dataArray.count;
//    self.flowLayout.minimumLineSpacing = (SCREEN_WIDTH - 240 - 72)/3;
//    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    LXQCollectionViewLayout *layout = [[LXQCollectionViewLayout alloc]init];
    layout.itemSize = CGSizeMake(60, 80);
    layout.sectionInsets = UIEdgeInsetsMake(10, 36, 10, 36);
    layout.rowSpacing = (SCREEN_WIDTH - 240 - 72)/3;
    layout.lineSpacing = 17;
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.contentSize = CGSizeMake(SCREEN_WIDTH*2, 0);
    [self.collectionView registerClass:[LXQMoreViewCell class] forCellWithReuseIdentifier:MoreViewCellResulIdentifier];
    [self addSubview:self.collectionView];
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.collectionView
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1.0
                                                            constant:0];
    [self addConstraint:top];
    
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self.collectionView
                                                            attribute:NSLayoutAttributeLeft
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self
                                                            attribute:NSLayoutAttributeLeft
                                                           multiplier:1.0
                                                             constant:0];
    [self addConstraint:left];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.collectionView
                                                              attribute:NSLayoutAttributeBottom
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.pageControl
                                                              attribute:NSLayoutAttributeTop
                                                             multiplier:1.0
                                                               constant:0];
    [self addConstraint:bottom];
    
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self.collectionView
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1.0
                                                              constant:0];
    [self addConstraint:right];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.dataArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.dataArray[section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LXQMoreViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MoreViewCellResulIdentifier forIndexPath:indexPath];
    NSDictionary *dict = self.dataArray[indexPath.section][indexPath.row];
    cell.iconImageView.image = [UIImage imageNamed:[dict objectForKey:@"icon"]];
    cell.titleLabel.text = [dict objectForKey:@"name"];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"5555");

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
