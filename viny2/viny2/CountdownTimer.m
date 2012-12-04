//
//  CountdownTimer.m
//  viny2
//
//  Created by Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)] on 12/3/12.
//  Copyright (c) 2012 Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)]. All rights reserved.
//

#import "CountdownTimer.h"

@implementation CountdownTimer

@synthesize start, end;

-(id)initWithStartTime:(NSDate *)startTime andEndTime:(NSDate *)endTime {
    self = [super init];
    if (self != nil) {
        
        self.start = startTime;
        self.end = endTime;
    }
    return self;
}

/* Returns the time interval from now, to when the task expires. */
-(NSTimeInterval *) timeUntilExpiration{
    return nil; //interval from counterNow to end
}

/* Returns the time counted down so far. */
-(NSTimeInterval *) timeCountedDownSoFar {
    return nil; // interval from this.start to counterNow
}

-(void)startCountdown {
}

@end
