//
//  ProjectConstants.h
//  viny2
//
//  Created by Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)] on 11/28/12.
//  Copyright (c) 2012 Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)]. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ProjectConstants : NSObject

/*
Public dictionary keys
http://www.numbergrinder.com/2008/12/static-constant-strings-in-objective-c/
http://stackoverflow.com/questions/538996/constants-in-objective-c
 
 
 
 TODO how to get this to its own class, in the data model?
 */


extern NSString *const instructionIDKey;
extern NSString *const instructionMessageKey; // why not init? = @"instructionMessageKey";
extern NSString *const imageReferenceKey; // image URL
extern NSString *const imageTitleKey;

extern NSString *const fallbackMessageKey;
extern NSString *const promptKey;
extern NSString *const neededByTimeSecondsKey; // difference b/w neededBy and vehicle is expiration time
extern NSString *const vehicleTimeSecondsKey;    // = @"1316461149000";
extern NSString *const completionStatusKey;      // return code

@end
