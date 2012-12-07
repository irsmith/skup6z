//
//  DateServices.m
//  viny2
//
//  Created by Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)] on 12/3/12.
//  Copyright (c) 2012 Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)]. All rights reserved.
//

#import "DateUtils.h"

@implementation DateUtils

// From Since.
+(NSString * ) getFormattedStringFromDate:(NSDate *)targetDate {
  
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        [formatter setTimeStyle:NSDateFormatterMediumStyle];
        return [formatter stringFromDate:targetDate];
    
}

+(NSDate * ) getDateFromEpoch:(NSString *)intervalSince1970Seconds {
    
    int value = [intervalSince1970Seconds intValue];    
    return [NSDate dateWithTimeIntervalSince1970:value];
 
}

/*
 http://stackoverflow.com/questions/1189252/how-to-convert-an-nstimeinterval-seconds-into-minutes
 */
+(int) simplyGetSecondsFromTimeInterval:(NSTimeInterval)timeInterval {
    int minutes = floor(timeInterval/60);
    int seconds = trunc(timeInterval - minutes * 60);
    return seconds;
}

+( NSDateComponents *) getComponentsFromTimeInterval:(NSTimeInterval)timeInterval {
       // Get the system calendar
    NSCalendar *sysCalendar = [NSCalendar currentCalendar];
    
    // Create the NSDates
    NSDate *date1 = [[NSDate alloc] init];
    NSDate *date2 = [[NSDate alloc] initWithTimeInterval:timeInterval sinceDate:date1];
    
    // Get conversion to months, days, hours, minutes
    unsigned int unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit;
    
    NSDateComponents *conversionInfo = [sysCalendar components:unitFlags fromDate:date1  toDate:date2  options:0];
    
    NSLog(@"Conversion: %dmin %dhours %ddays %dmoths",[conversionInfo minute], [conversionInfo hour], [conversionInfo day], [conversionInfo month]);
   
    return conversionInfo;
}

/* Not sure what this is in the real world. Perhaps a service.*/
+(NSDate *)getVehicleTime{
    NSDate* now = [NSDate date];
    return now;
}

@end
