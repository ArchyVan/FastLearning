//
//  NSFileManager+HelperKit.m
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import "NSFileManager+HelperKit.h"
#import "NSDictionary+HelperKit.h"

@implementation NSFileManager (HelperKit)

- (BOOL)ar_isFileAtPath:(NSString *)filePath hasTimeOut:(NSTimeInterval)timeout {
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSError *error = nil;
        NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath
                                                                                    error:&error];
        if (error) {
            return YES;
        }
        
        if ([attributes isKindOfClass:[NSDictionary class]] && attributes) {
            NSString *createDate = [attributes objectForKey:@"NSFileModificationDate"];
            createDate = [NSString stringWithFormat:@"%@", createDate];
            if (createDate.length >= 19) {
                createDate = [createDate substringToIndex:19];
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
                
                NSDate *sinceDate = [formatter dateFromString:createDate];
                NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:sinceDate];
                BOOL isTimeOut = (long)interval > timeout;
                
                return isTimeOut;
            }
        }
    }
    
    return YES;
}

- (NSDictionary *)ar_fileAttributesAtPath:(NSString *)path {
    NSError *error = nil;
    NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfItemAtPath:path
                                                                           error:&error];
    if (error) {
        return nil;
    }
    
    return attrs;
}

- (unsigned long long)ar_fileSizeAtPath:(NSString *)path {
    NSDictionary *attrs = [self ar_fileAttributesAtPath:path];
    
    if (attrs == nil) {
        return 0;
    }
    
    return [attrs ar_unsignedLongLongValue:NSFileSize];
}

@end
