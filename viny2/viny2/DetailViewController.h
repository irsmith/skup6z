//
//  DetailViewController.h
//  viny2
//
//  Created by Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)] on 11/23/12.
//  Copyright (c) 2012 Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)]. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountdownTimer.h"

@class ManualInstruction;

@interface DetailViewController : UITableViewController <UISplitViewControllerDelegate, TimerObserverDelegate>
{
    
    CountdownTimer *countdownTimer;
    
}


/*
 Properties are an Objective-C 2.0 feature that allow you more effortless access to your instance variables.These configure the getter and setter methods 
// Strong ref to our detail item.
// Weak ref to the GUI elements.
// Identify these as outlets (like java property listeners).
 */
@property (nonatomic, strong) ManualInstruction *manualInstruction;

@property (nonatomic, weak) IBOutlet UILabel *instructionIdLabel;
@property (nonatomic, weak) IBOutlet UILabel *instructionMessageLabel;
@property (nonatomic, weak) IBOutlet UILabel *imageTitleLabel;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UILabel *prompt;
@property (nonatomic, weak) IBOutlet UILabel *fallbackMessage;
@property (nonatomic, weak) IBOutlet UILabel *clarifyingInfo;

@property (weak, nonatomic) IBOutlet UITextField *SecondsText;
@property (weak, nonatomic) IBOutlet UITextField *minutesText;
@property (weak, nonatomic) IBOutlet UITextField *hoursText;


@end
