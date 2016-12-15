### 仿写一个微信输入框

在网上找了很久都没有找到一个非常符合自己心意的输入框，于是便自己动手写了一个模仿微信输入框

***

  ![未命名](未命名.gif)

***

但是还是有很多不足之处，比如不能控制动画时间等。

# 等待后续更新

### 不使用CADisplayLink来完成动画过程，使用UIView动画完成

```objective-c
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
```







