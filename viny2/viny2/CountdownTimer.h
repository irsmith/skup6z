//
//  CountdownTimer.h
//  viny2
//
//  Created by Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)] on 12/3/12.
//  Copyright (c) 2012 Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)]. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CountdownTimer : NSObject{
    
    
}
@property (nonatomic, retain) NSDate *start; //taskRequestTime;
@property (nonatomic, retain) NSDate *end;   //taskExpirationTime;

-(id)initWithStartTime:(NSDate *)startTime andEndTime:(NSDate *)endTime ;

-(NSTimeInterval *) timeUntilExpiration;
-(NSTimeInterval *) timeCountedDownSoFar;
-(void)startCountdown;
@end
