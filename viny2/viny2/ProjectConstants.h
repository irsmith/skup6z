//
//  ProjectConstants.h
//  viny2
//
//  Created by Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)] on 11/28/12.
//  Copyright (c) 2012 Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)]. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ProjectConstants : NSObject

// generally sent from server to app

/* Combination of procedureID and substep or instruction ID. */
extern NSString *const instructionIDKey;
/* The instruction */
extern NSString *const instructionMessageKey;
/* The image description.*/
extern NSString *const imageTitleKey;
/* Typically, the URL to the image.*/
extern NSString *const imageReferenceKey; 
/* Long instruction with clarifying info, possibly a warning. */
extern NSString *const clarifyingInfoKey;
/* What happens upon expiration. */
extern NSString *const fallbackMessageKey;
/* Short instruction. */
extern NSString *const promptKey;
/* Task request time in seconds epoch UTC. */
extern NSString *const taskRequestTimeSecondsKey;
/* Task expiration time UTC.*/
extern NSString *const taskNeededByTimeSecondsKey;


// return data sent from app to server
/*
 User has reported that the task is complete.  The data type is interpreted
 by the server as an epoch UTF date.
 */
extern NSString *const taskCompletionTimeSecondsKey;
/*
 User has reported task data result. The data type
 will be interpreted by the server in the context of the task.
 For example result YES/NO or a numeric like 0.039 (% concentration CO2)
 will be parsed by the server in the context of the procedure ID.
 */
extern NSString *const returnStatusKey;

// sounds
extern NSString  *const taskDataReportedSoundTag;
extern NSString  *const taskDoneSoundTag;
extern NSString  *const taskExpirededSoundTag;

@end
