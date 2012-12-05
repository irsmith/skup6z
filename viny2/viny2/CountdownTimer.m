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
@synthesize delegate, delegate1;


NSTimer *timerA;

bool startA = TRUE; // mutex disallows multiple timers from starting at  same time.
int counterA;


// Next 2 methods are the timer and its local callback (a selector). 
-(void)timerTicked {
    //Happens every time updateTimer is called. Should occur every second.
    NSLog(@"timer: tick");
    counterA -= 1;
    
     // TODO issue ManualInstruction is notified of cdtimer events, but detail view
    // needs to be updated.
    // secondsA.text = [NSString stringWithFormat:@"%i", counterA];
   
      if (counterA < 0) // Once timer goes below 0, reset all variables.
       {
   
           //secondsA.text = @"10 Second Timer";
    
           [timerA invalidate];
            startA = TRUE;
            counterA = 10;
       }

    
    //notify my observers
    [[self delegate] fired:YES];
    
}

/**
 http://bradcupit.tumblr.com/post/3431169229/ios-blocks-vs-selectors-and-delegates
 */
-(void)startTimerWithStartTime:(NSDate *)startTime andDuration:(NSTimeInterval) duration{

    self.start = startTime;
    counterA = 10L; //TODO convert NSTimeInterval (double) to seconds...
    
    if(startA == TRUE) //Check that another instance is not already running.
    {
        //secondsA.text = @"10";
        startA = FALSE;
        timerA = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTicked) userInfo:nil repeats:YES];
    }
    
    
}


/* Returns the time interval from now, to when the task expires. */
-(NSTimeInterval *) timeUntilExpiration{
    return nil; //interval from counterNow to end
}

/* Returns the time counted down so far. */
-(NSTimeInterval *) timeCountedDownSoFar {
    return nil; // interval from this.start to counterNow
}



@end
