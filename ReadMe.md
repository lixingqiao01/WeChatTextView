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

使用animation可以使整个动画过程是可控的，避免使用CADisplayLine带来的动画不可控过程

**感想**

**在仿写微信输入框的时候总是吧输入框的实现过程想得很复杂，从什么设置约束到动画，在到关键帧动画，再到CADisplayLink。从简单到复杂，越来越乱，越来越复杂，虽然最后都实现了想要的结果，虽然前面一直纠结这个这个实现过程，也走了不少的弯路，不过在编码的过程中自己也收获了不少，比如什么CADisplayLine的用法、UIView关键帧动画，等等，总之这个过程很享受**

***

## Bug

1.当输入超过最大高度后，全选删除inputView过于小的问题

2.当输入的文字超过textView的显示范围后删除一部分出现的问题

**textView实际的减少量应该是**

```objective-c
count = _textView.contentSize.height - _textView.frame.size.height;
```

**而非**

```objective-c
count = contentSize.height - self.tmpHeight;
```

***

## 添加moreInputView

* 监听MoreInputView frame的改变

  ```objective-c
  - (void)startListenFrame{
      [self stopListenFrame];
      self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(listenFrame)];
      [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
  }

  - (void)stopListenFrame{
      [self.displayLink invalidate];
      self.displayLink  = nil;
      [self listenFrame];
  }

  - (void)listenFrame{
      CALayer *presentationLayer = self.layer.presentationLayer;
      if (presentationLayer.frame.origin.y != self.tmpFrame.origin.y) {
          NSLog(@"%g",presentationLayer.frame.origin.y);
          NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                                [NSNumber numberWithFloat:presentationLayer.frame.origin.x],@"x",
                                [NSNumber numberWithFloat:presentationLayer.frame.origin.y],@"y",
                                [NSNumber numberWithFloat:presentationLayer.frame.size.height],@"height",
                                [NSNumber numberWithFloat:presentationLayer.frame.size.width],@"width",
                                nil];
          [[NSNotificationCenter defaultCenter] postNotificationName:@"LXQNotificationMoreInputView" object:nil userInfo:dict];
      }
      self.tmpFrame = presentationLayer.frame;
  }
  ```

  监听 frame 的改变，实现类似于键盘一样的弹出效果，只需要监听LXQNotificationMoreInputView，就能获取frame的改变

  **虽然这样可以实现，但是动画效果并不理想，在inputView升高的过程中明显有一个延迟，这个延迟很让人难受，因此打算更换方法**

* **第二种解决办法**

  通过增加Helper类，集中处理inputView的各种动画，

  > LXQChatHelper.h

  ```objective-c
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
  ```

  ​

  ​