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
    if (true) {
        return @"Needed by 2010-05-03 00:00:00 +0200"; //TODO
    } else {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        [formatter setTimeStyle:NSDateFormatterMediumStyle];
        
        NSDate *date = nil;//[NSDate dateWithTimeIntervalSinceReferenceDate:targetDate];
        return [formatter stringFromDate:date];
    }
    
}


+(NSDate * ) getDateFromStringDate:(NSString *)dateInSeconds {
   return [NSDate date]; //TODO
}

/* Not sure what this is in the real world. Perhaps a service.*/
+(NSDate *)getVehicleTime{
    NSDate* now = [NSDate date];
    return now;
}

@end
