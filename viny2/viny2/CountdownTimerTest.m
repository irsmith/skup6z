//
//  CountdownTimerTest.m
//  viny2
//
//  Created by Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)] on 12/4/12.
//  Copyright (c) 2012 Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)]. All rights reserved.
//
#import <SenTestingKit/SenTestingKit.h>
#import "CountdownTimer.h"
#import "DateUtils.h"

@interface CountdownTimerTest : SenTestCase {
@private
    CountdownTimer *ct;
}

@end
@implementation CountdownTimerTest

- (void) setUp {
    NSLog(@"%@ setUp", self.name);
    }



- (void) tearDown {
    NSLog(@"%@ tearDown", self.name);
}

- (void) testCountdownTimer {
    ct = [[CountdownTimer alloc] init];
    STAssertNotNil(ct, @"Cannot create  instance");
    [ct startTimerWithStartTime:[DateUtils getVehicleTime] andDuration:(NSTimeInterval)10L];
    STAssertTrue(ct != nil, @"could not instantiate countdown timer");

}

- (void) testVehicleTime {
    
    NSDate *date = [DateUtils getVehicleTime];
    STAssertTrue(date  != nil, @"");
}

/*
 NSDate computes time as seconds relative to an absolute reference time: the first instant of January 1, 2001.  
 
 Our server's absolute reference time is epoch, or Unix time, or POSIX time,
 defined as the number of seconds that have elapsed since midnight Coordinated Universal Time (UTC), 1 January 1970
 */
- (void) testDateToString {
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate: 0L];
    NSString *dateAsString =  [DateUtils getFormattedStringFromDate:date];
    STAssertTrue([dateAsString isEqualToString:@"Dec 31, 2000, 4:00:00 PM"], @"NSDate ref date");
    
    date = [NSDate dateWithTimeIntervalSince1970:1316461152L];
    NSString *str2 =  [DateUtils getFormattedStringFromDate:date];
    STAssertTrue([str2 isEqualToString:@"Sep 19, 2011, 12:39:12 PM"], @"bad 1970");

    date = [NSDate dateWithTimeIntervalSince1970:123456789L];
    NSString *str3 =  [DateUtils getFormattedStringFromDate:date];
    STAssertTrue([str3 isEqualToString:@"Nov 29, 1973, 1:33:09 PM"],nil);
    
    date = [NSDate dateWithTimeIntervalSinceReferenceDate:123456789L];
    NSString *str4 =  [DateUtils getFormattedStringFromDate:date];
    STAssertTrue([str4 isEqualToString:@"Nov 29, 2004, 1:33:09 PM"],nil);
}

- (void) testStringEpochToDateFormattedDateString {
    
    NSString *epoch =  @"1316461169";
    NSDate *date = [DateUtils getDateFromEpoch:epoch];
      
   
    NSString *actualDateString = [DateUtils getFormattedStringFromDate:date];
    
    // assert against hard coded expected date
    STAssertTrue([actualDateString isEqualToString:@"Sep 19, 2011, 12:39:29 PM"],nil);
    
    // assert against calculated expected date
    NSDate *expectedDate = [NSDate dateWithTimeIntervalSince1970:1316461169L]; 
    NSString *expectedDateString = [DateUtils getFormattedStringFromDate:expectedDate];
    STAssertTrue([actualDateString isEqualToString:expectedDateString],nil);

}



- (void) testIntervalToSeconds {
    
    NSTimeInterval interval = 326.4L;
    int seconds = [DateUtils simplyGetSecondsFromTimeInterval:interval];
    STAssertEquals(seconds, 26, @"simplyGetSecondsFromTimeInterval fail");

}

@end
