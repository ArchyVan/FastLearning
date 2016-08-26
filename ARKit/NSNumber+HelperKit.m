//
//  NSNumber+HelperKit.m
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import "NSNumber+HelperKit.h"

@implementation NSNumber (HelperKit)

- (NSString *)ar_toString
{
    return [NSString stringWithFormat:@"%@",self];
}

- (NSString *)ar_toMicrometerString
{
    int count = 0;
    long long int a = self.longLongValue;
    while (a != 0)
    {
        count++;
        a /= 10;
    }
    if ([self ar_toString]) {
        NSMutableString *string = [NSMutableString stringWithString:[self ar_toString]];
        NSMutableString *newstring = [NSMutableString string];
        while (count > 3) {
            count -= 3;
            NSRange rang = NSMakeRange(string.length - 3, 3);
            NSString *str = [string substringWithRange:rang];
            [newstring insertString:str atIndex:0];
            [newstring insertString:@"," atIndex:0];
            [string deleteCharactersInRange:rang];
        }
        [newstring insertString:string atIndex:0];
        return newstring;
    } else {
        return @"";
    }

}

@end
