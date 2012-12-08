//
//  AudioTest.m
//  viny2
//
//  Created by Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)] on 12/7/12.
//  Copyright (c) 2012 Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)]. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface AudioTest : SenTestCase
//SystemSoundID _pewPewSound;
@end

@implementation AudioTest

- (void) testStringEpochToDateFormattedDateString {
    // This is the simplest way to play a sound.
	// But note with System Sound services you can only use:
	// File Formats (a.k.a. audio containers or extensions): CAF, AIF, WAV
	// Data Formats (a.k.a. audio encoding): linear PCM (such as LEI16) or IMA4
	// Sounds must be 30 sec or less
	// And only one sound plays at a time!
	NSString *pewPewPath = [[NSBundle mainBundle] pathForResource:@"pew-pew-lei" ofType:@"caf"];
	NSURL *pewPewURL = [NSURL fileURLWithPath:pewPewPath];
	//AudioServicesCreateSystemSoundID((CFURLRef)pewPewURL, &_pewPewSound);

    
}

    
@end
