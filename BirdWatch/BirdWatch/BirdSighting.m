//
//  BirdSighting.m
//  BirdWatch
//
//  Created by Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)] on 11/24/12.
//  Copyright (c) 2012 Self. All rights reserved.
//

#import "BirdSighting.h"


@implementation BirdSighting

-(id)initWithName:(NSString *)name location:(NSString *)location date:(NSDate *)date {
    self = [super init];
    
    if (self) {
        _name = name;
        _location = location;
        _date = date;
        return self;
        
    }
    return nil;
}
@end
