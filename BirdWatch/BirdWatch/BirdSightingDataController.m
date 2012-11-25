//
//  BirdSightingDataController.m
//  BirdWatch
//
//  Created by Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)] on 11/24/12.
//  Copyright (c) 2012 Self. All rights reserved.
//

#import "BirdSightingDataController.h"
#import "BirdSighting.h"

// this code block is called a class extension. A class extension allows you to declare a method that is private to the class (to learn more

@interface BirdSightingDataController()
-(void)initializeDefaultDataList;
@end

@implementation BirdSightingDataController

-(id)init{
    if (self = [super init]) {
        [self initializeDefaultDataList];
        return self;
    }
    return nil;
}

-(void)initializeDefaultDataList{
    NSMutableArray *sightingList = [[NSMutableArray alloc]init];
    self.masterBirdSightlingList = sightingList;
    BirdSighting *sighting;
    NSDate *today = [NSDate date];
    sighting = [[BirdSighting alloc]initWithName:@"Pigeon" location:@"Everywhere" date:today];
    [self addBirdSightingWithSighting:sighting];
}

-(void)setMasterBirdSightlingList:(NSMutableArray *)newList {
    if (_masterBirdSightlingList != newList){
        _masterBirdSightlingList = [newList mutableCopy];
    }

}

-(NSUInteger)countOfList {
    return [self.masterBirdSightlingList count];
}

-(BirdSighting *) objectInListAtIndex:(NSUInteger)theIndex {
    return [self.masterBirdSightlingList objectAtIndex:theIndex];
}

-(void)addBirdSightingWithSighting:(BirdSighting *)sighting {
    [self.masterBirdSightlingList addObject:sighting];
}


@end
