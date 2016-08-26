//
//  NSDate+HelperKit.h
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (HelperKit)

//--------------------------------------------//
// Get day, month, year, hour, minute, second
//--------------------------------------------//
- (NSUInteger)ar_day;
- (NSUInteger)ar_month;
- (NSUInteger)ar_year;
- (NSUInteger)ar_hour;
- (NSUInteger)ar_minute;
- (NSUInteger)ar_second;
+ (NSUInteger)ar_day:(NSDate *)ar_date;
+ (NSUInteger)ar_month:(NSDate *)ar_date;
+ (NSUInteger)ar_year:(NSDate *)ar_date;
+ (NSUInteger)ar_hour:(NSDate *)ar_date;
+ (NSUInteger)ar_minute:(NSDate *)ar_date;
+ (NSUInteger)ar_second:(NSDate *)ar_date;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get how many days in the year.
 *
 *	@return The days of the year.
 */
- (NSUInteger)ar_daysInYear;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get how many days in the specified year.
 *
 *	@param ar_date	The specified date
 *
 *	@return The days of the year.
 */
+ (NSUInteger)ar_daysInYear:(NSDate *)ar_date;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Judge whether this year is leap year or not.
 *
 *	@return YES means leap year, otherwise NO.
 */
- (BOOL)ar_isLeapYear;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Judge whether the specified date of year is leap year or not.
 *
 *	@param ar_date	The specified date.
 *
 *	@return YES means leap year, otherwise NO.
 */
+ (BOOL)ar_isLeapYear:(NSDate *)ar_date;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Judge whether this year is leap year or not.
 *
 *	@param year	The specified year
 *
 *	@return YES means leap year, otherwise NO.
 */
+ (BOOL)ar_isLeapYearWithYear:(int)year;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get which week in the year.
 *
 *	@return Current week of year.
 */
- (NSUInteger)ar_weekOfYear;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get which week in the specified date.
 *
 *	@param ar_date	The specified date to get which week.
 *
 *	@return Current week of the specified year.
 */
+ (NSUInteger)ar_weekOfYear:(NSDate *)ar_date;

/**
 * 获取格式化为YYYY-MM-dd格式的日期字符串
 */
/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Convert the date to a time string with yyyy-MM-dd format.
 *
 *	@return The time string with yyyy-MM-dd
 */
- (NSString *)ar_toStringWithFormatYMD;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *  Convert the date to a time string with yyyy-MM-dd format.
 *
 *	@param ar_date	The specified date to be converted to time string.
 *
 *	@return The time string with yyyy-MM-dd
 */
+ (NSString *)ar_toStringWithFormatYMD:(NSDate *)ar_date;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get how many weeks in the month. It might have 4, 5, or 6 weeks.
 *
 *	@return The weeks in the month.
 */
- (NSUInteger)ar_howManyWeeksOfMonth;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get how many weeks in the month. It might have 4, 5, or 6 weeks.
 *
 *	@param ar_date The specified date
 *
 *	@return The weeks in the month of the specified date.
 */
+ (NSUInteger)ar_howManyWeeksOfMonth:(NSDate *)ar_date;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get the first date of this month.
 *
 *	@return The first date of this month.
 */
- (NSDate *)ar_beginDayOfMonth;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get the first date of this month.
 *
 *	@param ar_date	The specified date.
 *
 *	@return The first date of this month.
 */
+ (NSDate *)ar_beginDayOfMonth:(NSDate *)ar_date;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get the last date of this month.
 *
 *	@return The last date of this month.
 */
- (NSDate *)ar_lastDayOfMonth;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get the last date of the specified month.
 *
 *	@param ar_date	The specified date.
 *
 *	@return The last date of this month.
 */
+ (NSDate *)ar_lastDayOfMonth:(NSDate *)ar_date;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Add days
 *
 *	@param days	The added days.
 *
 *	@return The new date after add days.
 */
- (NSDate *)ar_dateAfterDay:(NSUInteger)days;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Add days to the specified date.
 *
 *	@param ar_date	The spcified date.
 *	@param days			The added days.
 *
 *	@return The new date after adding days.
 */
+ (NSDate *)ar_dateAfterDate:(NSDate *)ar_date day:(NSInteger)days;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Add months to the date.
 *
 *	@param months	The added months.
 *
 *	@return The new date after adding months.
 */
- (NSDate *)ar_dateAfterMonth:(NSUInteger)months;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Add months to the date.
 *
 *	@param ar_date The specified date.
 *	@param months	The added months.
 *
 *	@return The new date after adding months.
 */
+ (NSDate *)ar_dateAfterDate:(NSDate *)ar_date month:(NSInteger)months;

/**
 * 返回numYears年后的日期
 */
/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get new date offset numYears.
 *
 *	@param numYears	The
 *
 */
- (NSDate *)ar_offsetYears:(int)numYears;
+ (NSDate *)ar_offsetYears:(int)ar_numYears fromDate:(NSDate *)ar_fromDate;
- (NSDate *)ar_offsetMonths:(int)ar_numMonths;
+ (NSDate *)ar_offsetMonths:(int)ar_numMonths fromDate:(NSDate *)ar_fromDate;
- (NSDate *)ar_offsetDays:(int)ar_numDays;
+ (NSDate *)ar_offsetDays:(int)ar_numDays fromDate:(NSDate *)ar_fromDate;
- (NSDate *)ar_offsetHours:(int)ar_hours;
+ (NSDate *)ar_offsetHours:(int)ar_numHours fromDate:(NSDate *)ar_fromDate;
- (NSUInteger)ar_daysAgo;
+ (NSUInteger)ar_daysAgo:(NSDate *)ar_date;

/**
 *  获取星期几
 *
 *  @return Return weekday number
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSInteger)ar_weekday;
+ (NSInteger)ar_weekday:(NSDate *)ar_date;

/**
 *  获取星期几(名称)ar_
 *
 *  @return Return weekday as a localized string
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSString *)ar_dayFromWeekday;
+ (NSString *)ar_dayFromWeekday:(NSDate *)ar_date;

/**
 *  Is the same date?
 *
 *  @param anotherDate The another date to compare as NSDate
 *  @return Return YES if is same day, NO if not
 */
- (BOOL)ar_isSameDate:(NSDate *)ar_anotherDate;

/**
 *  Is today?
 *
 *  @return Return if self is today
 */
- (BOOL)ar_isToday;

/**
 *  Add days to self
 *
 *  @param days The number of days to add
 *  @return Return self by adding the gived days number
 */
- (NSDate *)ar_dateByAddingDays:(NSUInteger)ar_days;

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
+ (NSString *)ar_monthWithMonthNumber:(NSInteger)ar_month;

/**
 *  Convert date to string with format.
 */
+ (NSString *)ar_stringWithDate:(NSDate *)ar_date format:(NSString *)ar_format;
- (NSString *)ar_stringWithFormat:(NSString *)ar_format;

/**
 * Convert date string to NSDate instance.
 */
+ (NSDate *)ar_dateWithString:(NSString *)ar_string format:(NSString *)ar_format;

/**
 * Get how many days in the month.
 */
- (NSUInteger)ar_daysInMonth:(NSUInteger)ar_month;
+ (NSUInteger)ar_daysInMonth:(NSDate *)ar_date month:(NSUInteger)ar_month;
+ (NSUInteger)ar_dayInYear:(NSUInteger)year month:(NSUInteger)month;

/**
 * Get how many days in the month.
 */
- (NSUInteger)ar_daysInMonth;
+ (NSUInteger)ar_daysInMonth:(NSDate *)ar_date;

/**
 * 返回x分钟前/x小时前/昨天/x天前/x个月前/x年前
 */
- (NSString *)ar_timeInfo;
+ (NSString *)ar_timeInfoWithDate:(NSDate *)ar_date;
+ (NSString *)ar_timeInfoWithDateString:(NSString *)ar_dateString;

/**
 * yyyy-MM-dd/HH:mm:ss/yyyy-MM-dd HH:mm:ss
 */
- (NSString *)ar_ymdFormat;
- (NSString *)ar_hmsFormat;
- (NSString *)ar_ymdHmsFormat;
+ (NSString *)ar_ymdFormat;
+ (NSString *)ar_hmsFormat;
+ (NSString *)ar_ymdHmsFormat;

+ (NSDateComponents *)ar_dateComponentsWithDate:(NSDate *)date;

/**
 * Convert date to time stamp.
 */
- (NSString *)ar_toTimeStamp;

/**
 * Convert time stamp to date.
 */
+ (NSDate *)ar_toDateWithTimeStamp:(NSString *)timeStamp;


@end
