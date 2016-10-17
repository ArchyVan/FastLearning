//
//  ViewController.m
//  TestReactiveCocoa
//
//  Created by Objective-C on 2016/10/13.
//  Copyright © 2016年 Archy Van. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController () <UIScrollViewDelegate,TestViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) NSArray *mainArray;
@property (strong, nonatomic) UITableView *mainTable;
@property (strong, nonatomic) TestView *testView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib
    // Demo Code
    
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardWillShowNotification object:nil] subscribeNext:^(id x) {
        NSLog(@"键盘弹出");
    }];

    RACSignal *validEmailSignal = [self.textField.rac_textSignal map:^id(NSString *value) {
        return @([value rangeOfString:@"@"].location != NSNotFound);
    }];
    
    RAC(self.button, enabled) = validEmailSignal;
    
    RAC(self.textField, textColor) = [validEmailSignal map:^id(id value) {
        if ([value boolValue]) {
            return [UIColor greenColor];
        } else {
            return [UIColor redColor];
        }
    }];

    self.button.rac_command = [[RACCommand alloc] initWithEnabled:validEmailSignal signalBlock:^RACSignal *(id input) {
        NSLog(@"Button was pressed.");
        return [RACSignal empty];
    }];
    
    [[self.button rac_valuesAndChangesForKeyPath:@"enabled" options:NSKeyValueObservingOptionNew observer:nil] subscribeNext:^(id x) {
        NSLog(@"Button Enabled:%@",x);
    }];
    
    @weakify(self);
    [RACObserve(self, mainArray) subscribeNext:^(id x) {
        @strongify(self);
        [self.mainTable reloadData];
    }];
    
    self.testView = [[TestView alloc] initWithFrame:CGRectMake(10, 300, ScreenWidth - 20, 100)];
    self.testView.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.1];
    self.testView.delegate = self;
    [[self.testView rac_signalForSelector:@selector(_buttonAction:)] subscribeNext:^(id x) {
        NSLog(@"点击按钮");
    }];
    [self.view addSubview:self.testView];

    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}

- (void)testViewDidClickButton:(TestView *)testView
{
    NSLog(@"点击按钮代理");
}


- (void)testRACSignal
{
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@1];
        [subscriber sendCompleted];
        
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"信号被销毁");
        }];
    }];
    
    [signal subscribeNext:^(id x) {
        NSLog(@"接受到数据：%@",x);
    }];
}


- (void)testRACSubjectandRACReplaySubject
{
//    RACSubject *subject = [RACSubject subject];
//    
//    [subject subscribeNext:^(id x) {
//        NSLog(@"第一个订阅者%@",x);
//    }];
//
//    [subject subscribeNext:^(id x) {
//        NSLog(@"第二个订阅者%@",x);
//    }];
//    
//    [subject sendNext:@1];
    
    RACReplaySubject *replaySubject = [RACReplaySubject subject];
    
    [replaySubject sendNext:@1];
    [replaySubject sendNext:@2];
    
    [replaySubject subscribeNext:^(id x) {
        NSLog(@"第一个订阅者接收到的数据%@",x);
    }];

    [replaySubject subscribeNext:^(id x) {
        NSLog(@"第二个订阅者接收到的数据%@",x);
    }];

}

- (void)testRACSequenceAndRACTuple
{
    NSArray *numbers = @[@1,@2,@3];
    
    [numbers.rac_sequence.signal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
    NSDictionary *dict = @{@"name":@"xmg",@"age":@18};
    [dict.rac_sequence.signal subscribeNext:^(RACTuple *x) {
        RACTupleUnpack(NSString *key, NSString *value) = x;
        NSLog(@"%@ %@",key, value);
    }];
    
    NSArray *powNumbers = [[numbers.rac_sequence map:^id(id value) {
        return @(pow([value integerValue], 2));
    }] array];
    
    NSLog(@"%@",powNumbers);

    NSArray *sortNumbers = [[numbers.rac_sequence filter:^BOOL(id value) {
        return [value integerValue] > 2;
    }] array];
    
    NSLog(@"%@",sortNumbers);
}

- (void)testRACCommand
{
    RACCommand *command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        NSLog(@"执行命令");
        
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [subscriber sendNext:@"请求数据"];
            [subscriber sendCompleted];
            return nil;
        }];
    }];
    
    [command.executionSignals subscribeNext:^(id x) {
       [x subscribeNext:^(id x) {
           NSLog(@"%@",x);
       }];
    }];
    
    [[command.executing skip:1] subscribeNext:^(id x) {
        if ([x boolValue]) {
            NSLog(@"正在执行");
        } else {
            NSLog(@"执行完成");
        }
    }];
    
    [command execute:@1];
}

- (void)testRACMulticastConnection
{
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"发送请求");
        return nil;
    }];
//
//    [signal subscribeNext:^(id x) {
//        NSLog(@"接收数据");
//    }];
//    
//    [signal subscribeNext:^(id x) {
//        NSLog(@"接收数据");
//    }];
    
    RACMulticastConnection *connection = [signal publish];
    
    [connection.signal subscribeNext:^(id x) {
        NSLog(@"订阅者一信号");
    }];
    
    [connection.signal subscribeNext:^(id x) {
        NSLog(@"订阅者二信号");
    }];

    [connection connect];
}

- (void)testRACUI
{
    RACSignal *request1 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"发送请求1"];
        return nil;
    }];
    
    RACSignal *request2 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"发送请求2"];
        return nil;
    }];
    
    [self rac_liftSelector:@selector(updateUIWithR1:r2:) withSignalsFromArray:@[request1,request2]];

}

- (void)updateUIWithR1:(id)data r2:(id)dataTwo
{
    NSLog(@"更新UI%@ %@",data,dataTwo);
}



@end
