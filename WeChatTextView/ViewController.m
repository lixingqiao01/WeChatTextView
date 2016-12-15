//
//  ViewController.m
//  WeChatTextView
//
//  Created by lixingqiao01@163.com on 2016/12/15.
//  Copyright © 2016年 LXQ.inc. All rights reserved.
//

#import "ViewController.h"
#import "LXQInputView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    LXQInputView *inputView = [[LXQInputView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.view.frame) - 50, self.view.frame.size.width, 50)];
    [self.view addSubview:inputView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
