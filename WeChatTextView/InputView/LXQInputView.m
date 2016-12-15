//
//  LXQInputView.m
//  animation
//
//  Created by lixingqiao01@163.com on 2016/12/13.
//  Copyright © 2016年 bsj. All rights reserved.
//

#import "LXQInputView.h"
#import "UIButton+setImage.h"

#define INPUTVIEW_MAX_HEIGHT 132

@interface LXQInputView ()<UITextViewDelegate>{
    UIButton *moreButton;
    UIButton *emotionButton;
    CADisplayLink *_displayLink;
    int count;
}
@property (nonatomic, assign) CGFloat tmpHeight;
@property (nonatomic, strong) UIButton *voiceButton;

@end

@implementation LXQInputView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:245/255.0f green:245/255.0f blue:246/255.0f alpha:1];
        self.autoresizesSubviews = YES;
        [self setupUI:frame];
    }
    return self;
}

- (void)setLineLayer{
    CGSize size = [UIScreen mainScreen].bounds.size;
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    CGMutablePathRef ref = CGPathCreateMutable();
    CGPathMoveToPoint(ref, nil, 0, 0);
    CGPathAddLineToPoint(ref, nil, size.width, 0);
    
}

- (void)setupUI:(CGRect)frame{
    self.voiceButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    self.voiceButton.frame = CGRectMake(4, 7, 35, 35);
    self.voiceButton.tintColor = [UIColor lightGrayColor];
    [self.voiceButton setImage:[UIImage imageNamed:@"chatInput.bundle/ToolViewKeyboard"] forState:UIControlStateNormal];
    [self.voiceButton setImage:[UIImage imageNamed:@"chatInput.bundle/ToolViewKeyboardHL"] forState:UIControlStateSelected];
    [self.voiceButton addTarget:self action:@selector(voiceButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.voiceButton];
    self.voiceButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *voiceButtonLeft = [NSLayoutConstraint constraintWithItem:self.voiceButton
                                                                       attribute:NSLayoutAttributeLeft
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self
                                                                       attribute:NSLayoutAttributeLeft
                                                                      multiplier:1.0
                                                                        constant:4];
    [self addConstraint:voiceButtonLeft];
    
    NSLayoutConstraint *voiceButtonBottom = [NSLayoutConstraint constraintWithItem:self.voiceButton
                                                                         attribute:NSLayoutAttributeBottom
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self
                                                                         attribute:NSLayoutAttributeBottom
                                                                        multiplier:1.0
                                                                          constant:-7];
    [self addConstraint:voiceButtonBottom];
    
    NSLayoutConstraint *voiceButtonHeight = [NSLayoutConstraint constraintWithItem:self.voiceButton
                                                                         attribute:NSLayoutAttributeHeight
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:nil
                                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                                        multiplier:1.0
                                                                          constant:35];
    [self.voiceButton addConstraint:voiceButtonHeight];
    
    NSLayoutConstraint *voiceButtonWidth = [NSLayoutConstraint constraintWithItem:self.voiceButton
                                                                        attribute:NSLayoutAttributeWidth
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:35];
    [self.voiceButton addConstraint:voiceButtonWidth];
    
    moreButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    moreButton.frame = CGRectMake(CGRectGetWidth(frame) - 43, 7, 35, 35);
    moreButton.tintColor = [UIColor lightGrayColor];
    [moreButton setNormalImage:[UIImage imageNamed:@"chatInput.bundle/TypeSelectorBtn_Black"] SelectImage:[UIImage imageNamed:@"chatInput.bundle/TypeSelectorBtnHL_Black"]];
    [moreButton addTarget:self action:@selector(moreButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:moreButton];
    moreButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *moreButtonRight = [NSLayoutConstraint constraintWithItem:moreButton
                                                                       attribute:NSLayoutAttributeRight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self
                                                                       attribute:NSLayoutAttributeRight
                                                                      multiplier:1.0
                                                                        constant:-4];
    [self addConstraint:moreButtonRight];
    
    NSLayoutConstraint *moreButtonBottom = [NSLayoutConstraint constraintWithItem:moreButton
                                                                        attribute:NSLayoutAttributeBottom
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self
                                                                        attribute:NSLayoutAttributeBottom
                                                                       multiplier:1.0
                                                                         constant:-7];
    [self addConstraint:moreButtonBottom];
    
    NSLayoutConstraint *moreButtonHeight = [NSLayoutConstraint constraintWithItem:moreButton
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:35];
    [moreButton addConstraint:moreButtonHeight];
    
    NSLayoutConstraint *moreButtonWidth = [NSLayoutConstraint constraintWithItem:moreButton
                                                                       attribute:NSLayoutAttributeWidth
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:1.0
                                                                        constant:35];
    [moreButton addConstraint:moreButtonWidth];
    
    emotionButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    emotionButton.frame = CGRectMake(moreButton.frame.origin.x - 43, 7, 35, 35);
    emotionButton.tintColor = [UIColor lightGrayColor];
    [emotionButton setNormalImage:[UIImage imageNamed:@"chatInput.bundle/ToolViewEmotion"] SelectImage:[UIImage imageNamed:@"chatInput.bundle/ToolViewEmotionHL"]];
    [emotionButton addTarget:self action:@selector(emotionButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:emotionButton];
    emotionButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *emotionRight = [NSLayoutConstraint constraintWithItem:emotionButton
                                                                   attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:moreButton
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1.0
                                                                     constant:-4];
    [self addConstraint:emotionRight];
    
    NSLayoutConstraint *emotionBottom = [NSLayoutConstraint constraintWithItem:emotionButton
                                                                     attribute:NSLayoutAttributeBottom
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:moreButton
                                                                     attribute:NSLayoutAttributeBottom
                                                                    multiplier:1.0
                                                                      constant:0];
    [self addConstraint:emotionBottom];
    
    NSLayoutConstraint *emotionHeight = [NSLayoutConstraint constraintWithItem:emotionButton
                                                                     attribute:NSLayoutAttributeHeight
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:nil
                                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                                    multiplier:1.0
                                                                      constant:35];
    [emotionButton addConstraint:emotionHeight];
    
    NSLayoutConstraint *emotionWidth = [NSLayoutConstraint constraintWithItem:emotionButton
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:nil
                                                                    attribute:NSLayoutAttributeNotAnAttribute
                                                                   multiplier:1.0
                                                                     constant:35];
    [emotionButton addConstraint:emotionWidth];
    
//    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(43, 7, frame.size.width - 43 - 82 - 4, 35)];
    self.textView = [[UITextView alloc]init];
    _textView.returnKeyType = UIReturnKeySend;
    _textView.layer.masksToBounds = YES;
    _textView.layer.cornerRadius = 5;
    _textView.delegate = self;
    _textView.font = [UIFont systemFontOfSize:18];
    _textView.layer.borderColor = [[UIColor colorWithRed:221/255.0f green:221/255.0f blue:221/255.0f alpha:1]CGColor];
    _textView.layer.borderWidth = 1;
    [self addSubview:_textView];
    _textView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *textTop = [NSLayoutConstraint constraintWithItem:self.textView
                                                               attribute:NSLayoutAttributeTop
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self
                                                               attribute:NSLayoutAttributeTop
                                                              multiplier:1.0
                                                                constant:7];
    [self addConstraint:textTop];
    
    NSLayoutConstraint *textLeft = [NSLayoutConstraint constraintWithItem:self.textView
                                                                attribute:NSLayoutAttributeLeft
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.voiceButton
                                                                attribute:NSLayoutAttributeRight
                                                               multiplier:1.0
                                                                 constant:4];
    [self addConstraint:textLeft];
    
    NSLayoutConstraint *textBottom = [NSLayoutConstraint constraintWithItem:self.textView
                                                                  attribute:NSLayoutAttributeBottom
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self
                                                                  attribute:NSLayoutAttributeBottom
                                                                 multiplier:1.0
                                                                   constant:-7];
    [self addConstraint:textBottom];
    
    NSLayoutConstraint *textRight = [NSLayoutConstraint constraintWithItem:self.textView
                                                                 attribute:NSLayoutAttributeRight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:emotionButton
                                                                 attribute:NSLayoutAttributeLeft
                                                                multiplier:1.0
                                                                  constant:-4];
    [self addConstraint:textRight];
    
    //监听键盘
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWasShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHideNotification) name:UIKeyboardWillHideNotification object:nil];
    
//    [self startListenFrame];
}

- (void)voiceButtonClick:(UIButton *)sender{
    
}

- (void)moreButtonClick:(UIButton *)sender{
    
}

- (void)emotionButtonClick:(UIButton *)sender{
    
    
}

- (void)textViewDidChange:(UITextView *)textView{
    CGSize contentSize = textView.contentSize;
    if (contentSize.height > self.tmpHeight && self.tmpHeight != 0) {
        count = contentSize.height - self.tmpHeight;
        if (self.frame.size.height < INPUTVIEW_MAX_HEIGHT) {
            [_textView scrollRangeToVisible:NSMakeRange(0, 0)];
            [self animationWithDisplace:count];
        }
        
    } else if (contentSize.height < self.tmpHeight && self.tmpHeight != 0) {
        count = contentSize.height - self.tmpHeight;
        if (_textView.contentSize.height <= _textView.frame.size.height) {
            [self animationWithDisplace:count];
        }
    }
    self.tmpHeight = contentSize.height;
}

- (void)animationWithDisplace:(CGFloat)displace{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = self.frame;
        //inputViewFame
        rect.origin.y -= displace;
        rect.size.height += displace;
        self.frame = rect;
        
        //vioceButton frame
        rect = self.voiceButton.frame;
        rect.origin.y += displace;
        self.voiceButton.frame = rect;
        
        //moreButton frame
        rect = moreButton.frame;
        rect.origin.y += displace;
        moreButton.frame = rect;
        
        //emotionButton frame
        rect = emotionButton.frame;
        rect.origin.y += displace;
        emotionButton.frame = rect;
        
        //textView frame
        rect = _textView.frame;
        rect.size.height += displace;
        _textView.frame = rect;
    }];
}

#pragma mark - 键盘监听
- (void)keyboardWasShow:(NSNotification *)notification{
    self.frame = CGRectMake(0, [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].origin.y - 50, self.frame.size.width, 50);
    self.tableView.frame = CGRectMake(self.tableView.frame.origin.x, self.tableView.frame.origin.y, self.tableView.frame.size.width, [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].origin.y - 64 - 50);
}

- (void)keyboardWillHideNotification{
    NSLog(@"键盘收回");
    CGRect WinRect = [UIScreen mainScreen].bounds;
    self.frame = CGRectMake(0, WinRect.size.height - 50, WinRect.size.width, 50);
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
