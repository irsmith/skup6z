//
//  CountdownTimer.h
//  viny2
//
//  Created by Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)] on 12/3/12.
//  Copyright (c) 2012 Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)]. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TimerObserverDelegate<NSObject>
@required
- (void) fired: (BOOL)success;
- (void) expired;
@end


@interface CountdownTimer : NSObject{
    /*
     Publish a  public entry point for the set delegate API. 
     CountdownTimer is using a no arg constructor.
     
     Three ways to manage callbacks
     http://bradcupit.tumblr.com/post/3431169229/ios-blocks-vs-selectors-and-delegates
     
     */
	id <TimerObserverDelegate> delegate;
    
}
@property (nonatomic, retain) NSDate *start; //taskRequestTime;
@property (nonatomic, retain) NSDate *end;   //taskExpirationTime;


// create the setters and getters so I have a ref to my observers.
@property (retain) id delegate;
@property (retain) id delegate1;

// publish a public entry point to start me up.
-(void)startTimerWithStartTime:(NSDate *)startTime andDuration:(NSTimeInterval) duration;
// may not need these
-(NSTimeInterval *) timeUntilExpiration;
-(NSTimeInterval *) timeCountedDownSoFar;
@end
