//
//  BirdSightingDataController.h
//  BirdWatch
//
//  Created by Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)] on 11/24/12.
//  Copyright (c) 2012 Self. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BirdSighting;

@interface BirdSightingDataController : NSObject

   @property (nonatomic, copy) NSMutableArray *masterBirdSightlingList;

   // public API (instance methods)
   - (NSUInteger)countOfList;

   - (BirdSighting *)objectInListAtIndex:(NSUInteger)theIndex;

   -(void)addBirdSightingWithSighting:(BirdSighting *)sighting;


@end
