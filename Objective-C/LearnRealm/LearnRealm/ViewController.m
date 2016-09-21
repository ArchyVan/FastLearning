//
//  ViewController.m
//  LearnRealm
//
//  Created by Objective-C on 2016/9/21.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import "ViewController.h"
#import "Dog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [[NSFileManager defaultManager] removeItemAtURL:[RLMRealmConfiguration defaultConfiguration].fileURL error:nil];
    
    Dog *mydog = [[Dog alloc] init];
    
    mydog.name = @"Rex";
    mydog.age = 9;
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm transactionWithBlock:^{
        [realm addObject:mydog];
    }];
    
    RLMResults *results = [Dog objectsInRealm:realm where:@"name contains 'x'"];
    
    RLMResults *results2 = [results objectsWhere:@"age > 8"];
    
    NSLog(@"%@ %@",results,results2);
    
    Person *owner = [[Person alloc] init];
    owner.name = @"Tim";
    [owner.dogs addObject:mydog];
    
    [realm transactionWithBlock:^{
        [realm addObject:owner];
    }];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        RLMRealm *otherRealm = [RLMRealm defaultRealm];
        RLMResults *otherResults = [Dog objectsInRealm:otherRealm where:@"name contains 'Rex'"];
        NSLog(@"Number of dogs: %li", (unsigned long)otherResults.count);
    });

}

@end
