//
//  DateServices.h
//  viny2
//
//  Created by Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)] on 12/3/12.
//  Copyright (c) 2012 Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)]. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateUtils : NSObject

+(NSDate * ) getDateFromEpoch:(NSString *)intervalSince1970Seconds;

+(NSString * ) getFormattedStringFromDate:(NSDate *)targetDate ;

+(NSDate *)getVehicleTime;

+(int) simplyGetSecondsFromTimeInterval:(NSTimeInterval)timeInterval ;
+( NSDateComponents *) getComponentsFromTimeInterval:(NSTimeInterval)timeInterval ;

@end
