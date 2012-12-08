//
//  ProjectConstants.m
//  viny2
//
//  Created by Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)] on 11/28/12.
//  Copyright (c) 2012 Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)]. All rights reserved.
//

#import "ProjectConstants.h"

@implementation ProjectConstants

 // generally sent from server to app
 NSString *const instructionIDKey = @"instructionID";
 NSString *const instructionMessageKey = @"instructionMsg";
 NSString *const imageReferenceKey = @"imgRef";
 NSString *const imageTitleKey = @"imgTitle";
 NSString *const clarifyingInfoKey = @"clarifyingInfo";
 NSString *const fallbackMessageKey = @"fallback";
 NSString *const promptKey = @"prompt";
 NSString *const taskRequestTimeSecondsKey = @"taskRequestTime";
 NSString *const taskNeededByTimeSecondsKey = @"neededBy";

 // return data sent from app to server
 NSString *const taskCompletionTimeSecondsKey = @"taskCompletionTime";
 NSString *const returnStatusKey = @"returnStatus";

 // sounds
 NSString *const taskDataReportedSoundTag = @"beep1c";
 NSString *const taskDoneSoundTag = @"beepkind";
 NSString *const taskExpirededSoundTag = @"badumm";

@end
