//
//  BirdSighting.h
//  BirdWatch
//
//  Created by Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)] on 11/24/12.
//  Copyright (c) 2012 Self. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BirdSighting : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *location;

@property (nonatomic, strong) NSDate *date;

-(id) initWithName:(NSString *)name location:(NSString *)location date:(NSDate *)date;
@end
