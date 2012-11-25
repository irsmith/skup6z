/*
     File: DataController.m
 Abstract: A simple controller class responsible for managing the application's data.
 Typically this object would be able to load and save a file containing the appliction's data. This example illustrates just the basic minimum: it creates an array containing information about some plays and provides simple accessor methods for the array and its contents.
  Version: 3.1
 
 Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple
 Inc. ("Apple") in consideration of your agreement to the following
 terms, and your use, installation, modification or redistribution of
 this Apple software constitutes acceptance of these terms.  If you do
 not agree with these terms, please do not use, install, modify or
 redistribute this Apple software.
 
 In consideration of your agreement to abide by the following terms, and
 subject to these terms, Apple grants you a personal, non-exclusive
 license, under Apple's copyrights in this original Apple software (the
 "Apple Software"), to use, reproduce, modify and redistribute the Apple
 Software, with or without modifications, in source and/or binary forms;
 provided that if you redistribute the Apple Software in its entirety and
 without modifications, you must retain this notice and the following
 text and disclaimers in all such redistributions of the Apple Software.
 Neither the name, trademarks, service marks or logos of Apple Inc. may
 be used to endorse or promote products derived from the Apple Software
 without specific prior written permission from Apple.  Except as
 expressly stated in this notice, no other rights or licenses, express or
 implied, are granted by Apple herein, including but not limited to any
 patent rights that may be infringed by your derivative works or by other
 works in which the Apple Software may be incorporated.
 
 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE
 MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
 THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
 FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND
 OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
 
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
 OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
 MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED
 AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
 STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.
 
 Copyright (C) 2012 Apple Inc. All Rights Reserved.
 
 */

#import "DataController.h"
#import "ManualInstruction.h"


@interface DataController ()
@property (nonatomic, copy, readwrite) NSMutableArray *list;
- (void)createDemoData;
@end


@implementation DataController

@synthesize list;


- (id)init {
    if (self = [super init]) {
        [self createDemoData];
    }
    return self;
}

// Custom set accessor to ensure the new list is mutable.
- (void)setList:(NSMutableArray *)newList {
    if (list != newList) {
        list = [newList mutableCopy];
    }
}

// Accessor methods for list.
- (unsigned)countOfList {
    return [list count];
}

- (ManualInstruction *)objectInListAtIndex:(unsigned)theIndex {
    return [list objectAtIndex:theIndex];
}




- (void)createDemoData {
    
    /*   Create an array containing some demonstration data. */
    
    NSMutableArray *instructionList = [[NSMutableArray alloc] init];
    ManualInstruction *instruction;
      
	instruction = [[ManualInstruction alloc] init];
	instruction.instructionIdentifier = @"instr4";
	instruction.instructionMessage = @"Verify external spotlight D wall switch inside in section A is ON";
    instruction.imageReference = @"63103_files/external-spotlight-d.jpg";
    instruction.imageTitle = @"External Spotlight D Wall Switch";
    [instructionList addObject:instruction];
    
    instruction = [[ManualInstruction alloc] init];
	instruction.instructionIdentifier = @"instr5";
	instruction.instructionMessage = @"View spotlight through window in external DMM hatch door";
    instruction.imageReference = @"63103_files/view-spotlight.jpg";
    instruction.imageTitle = @"Spotlight through DMM hatch door";
    [instructionList addObject:instruction];

    
    self.list = instructionList;
}

@end
