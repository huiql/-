//
//  ViewController.m
//  时间戳
//
//  Created by 惠泉岭 on 2018/9/4.
//  Copyright © 2018年 QL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    NSDate * date = [self UTCDateFromLocalString:@"2018-9-4"];
//    NSString * week = [self weekdayStringFromDate:date];
    /**
      在这里做更改

     @return NO
     */
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//字符串转时间戳 如：2017-4-10 17:15:10
- (NSString *)getTimeStrWithString:(NSString *)str{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];// 创建一个时间格式化对象
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; //设定时间的格式
    NSDate *tempDate = [dateFormatter dateFromString:str];//将字符串转换为时间对象
    NSString *timeStr = [NSString stringWithFormat:@"%ld", (long)[tempDate timeIntervalSince1970]*1000];//字符串转成时间戳,精确到毫秒*1000
    return timeStr;
}
 //将当前时间字符串转为UTCDate
-(NSDate *)UTCDateFromLocalString:(NSString *)localString{
    
         NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
         [dateFormatter setDateFormat:@"yyyy-MM-dd"];
         NSDate *date = [dateFormatter dateFromString:localString];
         return date;
     }

- (NSString*)weekdayStringFromDate:(NSDate*)inputDate {
    NSArray *weekdays =
    [NSArray arrayWithObjects:
     [NSNull null], @"Sunday", @"周一", @"周二", @"周三",@"周四", @"周五", @"周六", nil];
     NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
     
     NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
     
     [calendar setTimeZone: timeZone];
     
     NSCalendarUnit calendarUnit = NSWeekdayCalendarUnit;
     
     NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
     
     return [weekdays objectAtIndex:theComponents.weekday];
     
     }


@end
