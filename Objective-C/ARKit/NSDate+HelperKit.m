//
//  NSDate+HelperKit.m
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import "NSDate+HelperKit.h"

@implementation NSDate (HelperKit)

- (NSUInteger)ar_day {
    return [NSDate ar_day:self];
}

- (NSUInteger)ar_month {
    return [NSDate ar_month:self];
}

- (NSUInteger)ar_year {
    return [NSDate ar_year:self];
}

- (NSUInteger)ar_hour {
    return [NSDate ar_hour:self];
}

- (NSUInteger)ar_minute {
    return [NSDate ar_minute:self];
}

- (NSUInteger)ar_second {
    return [NSDate ar_second:self];
}

+ (NSUInteger)ar_day:(NSDate *)ar_date {
    return [[self ar_dateComponentsWithDate:ar_date] day];
}

+ (NSUInteger)ar_month:(NSDate *)ar_date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMonth)fromDate:ar_date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSMonthCalendarUnit)fromDate:ar_date];
#endif
    
    return [dayComponents month];
}

+ (NSUInteger)ar_year:(NSDate *)ar_date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitYear)fromDate:ar_date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSYearCalendarUnit)fromDate:ar_date];
#endif
    
    return [dayComponents year];
}

+ (NSUInteger)ar_hour:(NSDate *)ar_date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitHour)fromDate:ar_date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSHourCalendarUnit)fromDate:ar_date];
#endif
    
    return [dayComponents hour];
}

+ (NSUInteger)ar_minute:(NSDate *)ar_date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMinute)fromDate:ar_date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSMinuteCalendarUnit)fromDate:ar_date];
#endif
    
    return [dayComponents minute];
}

+ (NSUInteger)ar_second:(NSDate *)ar_date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitSecond)fromDate:ar_date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSSecondCalendarUnit)fromDate:ar_date];
#endif
    
    return [dayComponents second];
}

- (NSUInteger)ar_daysInYear {
    return [NSDate ar_daysInYear:self];
}

+ (NSUInteger)ar_daysInYear:(NSDate *)ar_date {
    return [self ar_isLeapYear:ar_date] ? 366 : 365;
}

- (BOOL)ar_isLeapYear {
    return [NSDate ar_isLeapYear:self];
}

+ (BOOL)ar_isLeapYear:(NSDate *)ar_date {
    int year = (int)[ar_date ar_year];
    return [self ar_isLeapYearWithYear:year];
}

+ (BOOL)ar_isLeapYearWithYear:(int)year {
    if ((year % 4  == 0 && year % 100 != 0) || year % 400 == 0) {
        return YES;
    }
    
    return NO;
}

- (NSString *)ar_toStringWithFormatYMD {
    return [NSDate ar_toStringWithFormatYMD:self];
}

+ (NSString *)ar_toStringWithFormatYMD:(NSDate *)ar_date {
    return [NSString stringWithFormat:@"%ld-%02ld-%02ld",
            (long)[ar_date ar_year],
            (long)[ar_date ar_month],
            (long)[ar_date ar_day]];
}

- (NSUInteger)ar_howManyWeeksOfMonth {
    return [NSDate ar_howManyWeeksOfMonth:self];
}

+ (NSUInteger)ar_howManyWeeksOfMonth:(NSDate *)ar_date {
    return [[ar_date ar_lastDayOfMonth] ar_weekOfYear] - [[ar_date ar_beginDayOfMonth] ar_weekOfYear] + 1;
}

- (NSUInteger)ar_weekOfYear {
    return [NSDate ar_weekOfYear:self];
}

+ (NSUInteger)ar_weekOfYear:(NSDate *)ar_date {
    NSUInteger i;
    NSUInteger year = [ar_date ar_year];
    
    NSDate *lastdate = [ar_date ar_lastDayOfMonth];
    
    for (i = 1;[[lastdate ar_dateAfterDay:-7 * i] ar_year] == year; i++) {
        
    }
    
    return i;
}

- (NSDate *)ar_dateAfterDay:(NSUInteger)ar_day {
    return [NSDate ar_dateAfterDate:self day:ar_day];
}

+ (NSDate *)ar_dateAfterDate:(NSDate *)ar_date day:(NSInteger)ar_day {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setDay:ar_day];
    
    NSDate *dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:ar_date options:0];
    
    return dateAfterDay;
}

- (NSDate *)ar_dateAfterMonth:(NSUInteger)ar_month {
    return [NSDate ar_dateAfterDate:self month:ar_month];
}

+ (NSDate *)ar_dateAfterDate:(NSDate *)ar_date month:(NSInteger)ar_month {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setMonth:ar_month];
    NSDate *dateAfterMonth = [calendar dateByAddingComponents:componentsToAdd toDate:ar_date options:0];
    
    return dateAfterMonth;
}

- (NSDate *)ar_beginDayOfMonth {
    return [NSDate ar_beginDayOfMonth:self];
}

+ (NSDate *)ar_beginDayOfMonth:(NSDate *)ar_date {
    return [self ar_dateAfterDate:ar_date day:-[ar_date ar_day] + 1];
}

- (NSDate *)ar_lastDayOfMonth {
    return [NSDate ar_lastDayOfMonth:self];
}

+ (NSDate *)ar_lastDayOfMonth:(NSDate *)ar_date {
    NSDate *lastDate = [self ar_beginDayOfMonth:ar_date];
    return [[lastDate ar_dateAfterMonth:1] ar_dateAfterDay:-1];
}

- (NSUInteger)ar_daysAgo {
    return [NSDate ar_daysAgo:self];
}

+ (NSUInteger)ar_daysAgo:(NSDate *)ar_date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    NSDateComponents *components = [calendar components:(NSCalendarUnitDay)
                                               fromDate:ar_date
                                                 toDate:[NSDate date]
                                                options:0];
#else
    NSDateComponents *components = [calendar components:(NSDayCalendarUnit)
                                               fromDate:ar_date
                                                 toDate:[NSDate date]
                                                options:0];
#endif
    
    return [components day];
}

- (NSInteger)ar_weekday {
    return [NSDate ar_weekday:self];
}

+ (NSInteger)ar_weekday:(NSDate *)ar_date {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday) fromDate:ar_date];
    NSInteger weekday = [comps weekday];
    
    return weekday;
}

- (NSString *)ar_dayFromWeekday {
    return [NSDate ar_dayFromWeekday:self];
}

+ (NSString *)ar_dayFromWeekday:(NSDate *)ar_date {
    switch([ar_date ar_weekday]) {
        case 1:
            return @"星期天";
            break;
        case 2:
            return @"星期一";
            break;
        case 3:
            return @"星期二";
            break;
        case 4:
            return @"星期三";
            break;
        case 5:
            return @"星期四";
            break;
        case 6:
            return @"星期五";
            break;
        case 7:
            return @"星期六";
            break;
        default:
            break;
    }
    return @"";
}

- (BOOL)ar_isSameDate:(NSDate *)ar_anotherDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components1 = [calendar components:(NSCalendarUnitYear
                                                          | NSCalendarUnitMonth
                                                          | NSCalendarUnitDay)
                                                fromDate:self];
    NSDateComponents *components2 = [calendar components:(NSCalendarUnitYear
                                                          | NSCalendarUnitMonth
                                                          | NSCalendarUnitDay)
                                                fromDate:ar_anotherDate];
    return ([components1 year] == [components2 year]
            && [components1 month] == [components2 month]
            && [components1 day] == [components2 day]);
}

- (BOOL)ar_isToday {
    return [self ar_isSameDate:[NSDate date]];
}

- (NSDate *)ar_dateByAddingDays:(NSUInteger)ar_days {
    NSDateComponents *c = [[NSDateComponents alloc] init];
    c.day = ar_days;
    return [[NSCalendar currentCalendar] dateByAddingComponents:c toDate:self options:0];
}

/**
 *  Get the month as a localized string from the given month number
 *
 *  @param month The month to be converted in string
 *  [1 - January]
 *  [2 - February]
 *  [3 - March]
 *  [4 - April]
 *  [5 - May]
 *  [6 - June]
 *  [7 - July]
 *  [8 - August]
 *  [9 - September]
 *  [10 - October]
 *  [11 - November]
 *  [12 - December]
 *
 *  @return Return the given month as a localized string
 */
+ (NSString *)ar_monthWithMonthNumber:(NSInteger)ar_month {
    switch(ar_month) {
        case 1:
            return @"January";
            break;
        case 2:
            return @"February";
            break;
        case 3:
            return @"March";
            break;
        case 4:
            return @"April";
            break;
        case 5:
            return @"May";
            break;
        case 6:
            return @"June";
            break;
        case 7:
            return @"July";
            break;
        case 8:
            return @"August";
            break;
        case 9:
            return @"September";
            break;
        case 10:
            return @"October";
            break;
        case 11:
            return @"November";
            break;
        case 12:
            return @"December";
            break;
        default:
            break;
    }
    return @"";
}

+ (NSString *)ar_stringWithDate:(NSDate *)ar_date format:(NSString *)ar_format {
    return [ar_date ar_stringWithFormat:ar_format];
}

- (NSString *)ar_stringWithFormat:(NSString *)ar_format {
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:ar_format];
    [outputFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    NSString *retStr = [outputFormatter stringFromDate:self];
    
    return retStr;
}

+ (NSDate *)ar_dateWithString:(NSString *)ar_string format:(NSString *)ar_format {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:ar_format];
    [inputFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    NSDate *date = [inputFormatter dateFromString:ar_string];
    
    return date;
}

- (NSUInteger)ar_daysInMonth:(NSUInteger)ar_month {
    return [NSDate ar_daysInMonth:self month:ar_month];
}

+ (NSUInteger)ar_dayInYear:(NSUInteger)year month:(NSUInteger)month {
    switch (month) {
        case 1: case 3: case 5: case 7: case 8: case 10: case 12:
            return 31;
        case 2:
            return [self ar_isLeapYearWithYear:(int)year] ? 29 : 28;
    }
    
    return 30;
}

+ (NSUInteger)ar_daysInMonth:(NSDate *)ar_date month:(NSUInteger)ar_month {
    switch (ar_month) {
        case 1: case 3: case 5: case 7: case 8: case 10: case 12:
            return 31;
        case 2:
            return [ar_date ar_isLeapYear] ? 29 : 28;
    }
    return 30;
}

- (NSUInteger)ar_daysInMonth {
    return [NSDate ar_daysInMonth:self];
}

+ (NSUInteger)ar_daysInMonth:(NSDate *)ar_date {
    return [self ar_daysInMonth:ar_date month:[ar_date ar_month]];
}

- (NSString *)ar_timeInfo {
    return [NSDate ar_timeInfoWithDate:self];
}

+ (NSString *)ar_timeInfoWithDate:(NSDate *)ar_date {
    return [self ar_timeInfoWithDateString:[self ar_stringWithDate:ar_date format:[self ar_ymdHmsFormat]]];
}

+ (NSString *)ar_timeInfoWithDateString:(NSString *)ar_dateString {
    NSDate *date = [self ar_dateWithString:ar_dateString format:[self ar_ymdHmsFormat]];
    
    NSDate *curDate = [NSDate date];
    NSTimeInterval time = -[date timeIntervalSinceDate:curDate];
    
    int month = (int)([curDate ar_month] - [date ar_month]);
    int year = (int)([curDate ar_year] - [date ar_year]);
    int day = (int)([curDate ar_day] - [date ar_day]);
    
    NSTimeInterval retTime = 1.0;
    if (time < 3600) { // 小于一小时
        retTime = time / 60;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        return [NSString stringWithFormat:@"%.0f分钟前", retTime];
    } else if (time < 3600 * 24) { // 小于一天，也就是今天
        retTime = time / 3600;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        return [NSString stringWithFormat:@"%.0f小时前", retTime];
    } else if (time < 3600 * 24 * 2) {
        return @"昨天";
    }
    // 第一个条件是同年，且相隔时间在一个月内
    // 第二个条件是隔年，对于隔年，只能是去年12月与今年1月这种情况
    else if ((abs(year) == 0 && abs(month) <= 1)
             || (abs(year) == 1 && [curDate ar_month] == 1 && [date ar_month] == 12)) {
        int retDay = 0;
        if (year == 0) { // 同年
            if (month == 0) { // 同月
                retDay = day;
            }
        }
        
        if (retDay <= 0) {
            // 获取发布日期中，该月有多少天
            int totalDays = (int)[self ar_daysInMonth:date month:[date ar_month]];
            
            // 当前天数 + （发布日期月中的总天数-发布日期月中发布日，即等于距离今天的天数）
            retDay = (int)[curDate ar_day] + (totalDays - (int)[date ar_day]);
        }
        
        return [NSString stringWithFormat:@"%d天前", (abs)(retDay)];
    } else  {
        if (abs(year) <= 1) {
            if (year == 0) { // 同年
                return [NSString stringWithFormat:@"%d个月前", abs(month)];
            }
            
            // 隔年
            int month = (int)[curDate ar_month];
            int preMonth = (int)[date ar_month];
            if (month == 12 && preMonth == 12) {// 隔年，但同月，就作为满一年来计算
                return @"1年前";
            }
            return [NSString stringWithFormat:@"%d个月前", (abs)(12 - preMonth + month)];
        }
        
        return [NSString stringWithFormat:@"%d年前", abs(year)];
    }
    
    return @"1小时前";
}

- (NSString *)ar_ymdFormat {
    return [NSDate ar_ymdFormat];
}

- (NSString *)ar_hmsFormat {
    return [NSDate ar_hmsFormat];
}

- (NSString *)ar_ymdHmsFormat {
    return [NSDate ar_ymdHmsFormat];
}

+ (NSString *)ar_ymdFormat {
    return @"yyyy-MM-dd";
}

+ (NSString *)ar_hmsFormat {
    return @"HH:mm:ss";
}

+ (NSString *)ar_ymdHmsFormat {
    return [NSString stringWithFormat:@"%@ %@", [self ar_ymdFormat], [self ar_hmsFormat]];
}

- (NSDate *)ar_offsetYears:(int)ar_numYears {
    return [NSDate ar_offsetYears:ar_numYears fromDate:self];
}

+ (NSDate *)ar_offsetYears:(int)ar_numYears fromDate:(NSDate *)ar_fromDate {
    if (ar_fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear:ar_numYears];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:ar_fromDate
                                     options:0];
}

- (NSDate *)ar_offsetMonths:(int)ar_numMonths {
    return [NSDate ar_offsetMonths:ar_numMonths fromDate:self];
}

+ (NSDate *)ar_offsetMonths:(int)ar_numMonths fromDate:(NSDate *)ar_fromDate {
    if (ar_fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMonth:ar_numMonths];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:ar_fromDate
                                     options:0];
}

- (NSDate *)ar_offsetDays:(int)ar_numDays {
    return [NSDate ar_offsetDays:ar_numDays fromDate:self];
}

+ (NSDate *)ar_offsetDays:(int)ar_numDays fromDate:(NSDate *)ar_fromDate {
    if (ar_fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:ar_numDays];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:ar_fromDate
                                     options:0];
}

- (NSDate *)ar_offsetHours:(int)ar_hours {
    return [NSDate ar_offsetHours:ar_hours fromDate:self];
}

+ (NSDate *)ar_offsetHours:(int)ar_numHours fromDate:(NSDate *)ar_fromDate {
    if (ar_fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setHour:ar_numHours];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:ar_fromDate
                                     options:0];
}

+ (NSDateComponents *)ar_dateComponentsWithDate:(NSDate *)date {
    NSCalendar *calendar = nil;
    NSUInteger flags = 0;
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    flags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour
    | NSCalendarUnitMinute | NSCalendarUnitSecond;
#else
    calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    flags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit
    | NSMinuteCalendarUnit | NSSecondCalendarUnit;
#endif
    [calendar setTimeZone:[NSTimeZone systemTimeZone]];
    
    return [calendar components:flags fromDate:date];
}

- (NSString *)ar_toTimeStamp {
    return [NSString stringWithFormat:@"%lf", [self timeIntervalSince1970]];
}

+ (NSDate *)ar_toDateWithTimeStamp:(NSString *)timeStamp {
    NSString *arg = timeStamp;
    
    if (![timeStamp isKindOfClass:[NSString class]]) {
        arg = [NSString stringWithFormat:@"%@", timeStamp];
    }
    
    if (arg.length > 10) {
        arg = [arg substringToIndex:10];
    }
    
    NSTimeInterval time = [arg doubleValue];
    return [NSDate dateWithTimeIntervalSince1970:time];
}


@end
