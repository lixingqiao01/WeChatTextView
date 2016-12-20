//
//  LXQEmotionView.m
//  WeChatTextView
//
//  Created by lixingqiao01@163.com on 2016/12/16.
//  Copyright © 2016年 LXQ.inc. All rights reserved.
//

#import "LXQEmotionView.h"
#import "LXQTitleEmotionCollectionViewCell.h"

static NSString *titleEmotionCollectionCellResulIdentifier = @"LXQTitleEmotionCollectionViewCell.h";

@interface LXQEmotionView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong)   UIButton                *sendButton;

@property (nonatomic, strong)   UICollectionView        *titleEmotionCollectionView;

@property (nonatomic, strong)   NSMutableArray          *titleDataArray;

@property (nonatomic, strong)   UIPageControl           *emotionPageControl;

@property (nonatomic, strong)   UICollectionView        *emotionCollectionView;

@end

@implementation LXQEmotionView

- (instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
        [self setUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
        [self setUI];
    }
    return self;
}

- (void)setUI{
    
    self.titleDataArray = [NSMutableArray array];
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [addButton setImage:[UIImage imageNamed:@"Emotion.bundle/EmotionAddBtn"] forState:UIControlStateNormal];
    addButton.backgroundColor = [UIColor whiteColor];
    addButton.tintColor = [UIColor colorWithRed:111/255.0f green:115/255.0f blue:120/255.0f alpha:1];
    [addButton addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:addButton];
    
    addButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *addLeft = [NSLayoutConstraint constraintWithItem:addButton
                                                              attribute:NSLayoutAttributeLeft
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self
                                                              attribute:NSLayoutAttributeLeft
                                                             multiplier:1.0
                                                               constant:0];
    [self addConstraint:addLeft];
    
    NSLayoutConstraint *addBottom = [NSLayoutConstraint constraintWithItem:addButton
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0
                                                                  constant:0];
    [self addConstraint:addBottom];
    
    NSLayoutConstraint *addHeight = [NSLayoutConstraint constraintWithItem:addButton
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                multiplier:1.0
                                                                  constant:37];
    [self addConstraint:addHeight];
    
    NSLayoutConstraint *addWidth = [NSLayoutConstraint constraintWithItem:addButton
                                                                attribute:NSLayoutAttributeWidth
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:45];
    [self addConstraint:addWidth];
    
    self.sendButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.sendButton setTitle:@"发送" forState:UIControlStateNormal];
    self.sendButton.tintColor = [UIColor colorWithRed:143/255.0f green:143/255.0f blue:143/255.0f alpha:1];
    self.sendButton.backgroundColor = [UIColor whiteColor];
    [self.sendButton addTarget:self action:@selector(sendButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.sendButton];
    
    self.sendButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *sendRight = [NSLayoutConstraint constraintWithItem:self.sendButton
                                                                 attribute:NSLayoutAttributeRight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self
                                                                 attribute:NSLayoutAttributeRight
                                                                multiplier:1.0
                                                                  constant:0];
    [self addConstraint:sendRight];
    
    NSLayoutConstraint *sendBottom = [NSLayoutConstraint constraintWithItem:self.sendButton
                                                                  attribute:NSLayoutAttributeBottom
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self
                                                                  attribute:NSLayoutAttributeBottom
                                                                 multiplier:1.0
                                                                   constant:0];
    [self addConstraint:sendBottom];
    
    NSLayoutConstraint *sendHeight = [NSLayoutConstraint constraintWithItem:self.sendButton
                                                                  attribute:NSLayoutAttributeHeight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:addButton
                                                                  attribute:NSLayoutAttributeHeight
                                                                 multiplier:1.0
                                                                   constant:0];
    [self addConstraint:sendHeight];
    
    NSLayoutConstraint *sendWidth = [NSLayoutConstraint constraintWithItem:self.sendButton
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:1.0
                                                                  constant:50];
    [self addConstraint:sendWidth];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(45, 37);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    
    self.titleEmotionCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.titleEmotionCollectionView.delegate = self;
    self.titleEmotionCollectionView.dataSource = self;
    self.titleEmotionCollectionView.backgroundColor = [UIColor whiteColor];
    [self.titleEmotionCollectionView registerClass:[LXQTitleEmotionCollectionViewCell class] forCellWithReuseIdentifier:titleEmotionCollectionCellResulIdentifier];
    [self addSubview:self.titleEmotionCollectionView];
    
    self.titleEmotionCollectionView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *TitleLeft = [NSLayoutConstraint constraintWithItem:self.titleEmotionCollectionView
                                                                 attribute:NSLayoutAttributeLeft
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:addButton
                                                                 attribute:NSLayoutAttributeRight
                                                                multiplier:1.0
                                                                  constant:0];
    [self addConstraint:TitleLeft];
    
    NSLayoutConstraint *titleBottom = [NSLayoutConstraint constraintWithItem:self.titleEmotionCollectionView
                                                                   attribute:NSLayoutAttributeBottom
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self
                                                                   attribute:NSLayoutAttributeBottom
                                                                  multiplier:1.0
                                                                    constant:0];
    [self addConstraint:titleBottom];
    
    NSLayoutConstraint *titleRight = [NSLayoutConstraint constraintWithItem:self.titleEmotionCollectionView
                                                                  attribute:NSLayoutAttributeRight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.sendButton
                                                                  attribute:NSLayoutAttributeLeft
                                                                 multiplier:1.0
                                                                   constant:0];
    [self addConstraint:titleRight];
    
    NSLayoutConstraint *titleHeight = [NSLayoutConstraint constraintWithItem:self.titleEmotionCollectionView
                                                                   attribute:NSLayoutAttributeHeight
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:addButton
                                                                   attribute:NSLayoutAttributeHeight
                                                                  multiplier:1.0
                                                                    constant:0];
    [self addConstraint:titleHeight];
    
    [self loadLocalData];
    [self initPageControll];
}

- (void)initPageControll{
    self.emotionPageControl = [[UIPageControl alloc]init];
    self.emotionPageControl.numberOfPages = 4;
    [self addSubview:self.emotionPageControl];
    
    self.emotionPageControl.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self.emotionPageControl
                                                            attribute:NSLayoutAttributeLeft
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self
                                                            attribute:NSLayoutAttributeLeft
                                                           multiplier:1.0
                                                             constant:0];
    [self addConstraint:left];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.emotionPageControl
                                                              attribute:NSLayoutAttributeBottom
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.titleEmotionCollectionView
                                                              attribute:NSLayoutAttributeTop
                                                             multiplier:1.0
                                                               constant:-5];
    [self addConstraint:bottom];
    
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self.emotionPageControl
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1.0
                                                              constant:0];
    [self addConstraint:right];
    
    NSLayoutConstraint *heoght = [NSLayoutConstraint constraintWithItem:self.emotionPageControl
                                                              attribute:NSLayoutAttributeHeight
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:nil
                                                              attribute:NSLayoutAttributeNotAnAttribute
                                                             multiplier:1.0
                                                               constant:10];
    [self addConstraint:heoght];
}

- (void)initEmotionCollection{
    
}

- (void)loadLocalData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Emotions" ofType:@"plist"];
    [self.titleDataArray addObjectsFromArray:[NSMutableArray arrayWithContentsOfFile:path]];
//    NSLog(@"%@",self.titleDataArray);
    [self.titleEmotionCollectionView reloadData];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    if (collectionView == self.titleEmotionCollectionView) {
        return self.titleDataArray.count;
//    }
//    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LXQTitleEmotionCollectionViewCell *titleCell = [collectionView dequeueReusableCellWithReuseIdentifier:titleEmotionCollectionCellResulIdentifier forIndexPath:indexPath];
    titleCell.titleImage = [UIImage imageNamed:[self.titleDataArray[indexPath.row] objectForKey:@"groupicon"]];
    return titleCell;
}

- (void)addButtonClick:(UIButton *)sender{
    
}

- (void)sendButtonClick:(UIButton *)sender{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
