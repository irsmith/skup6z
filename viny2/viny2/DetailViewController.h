//
//  DetailViewController.h
//  viny2
//
//  Created by Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)] on 11/23/12.
//  Copyright (c) 2012 Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)]. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ManualInstruction;

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

// Strong ref to our detail item.
// Weak ref to the GUI elements.
// Identify these as outlets (like java property listeners).
// An Oulet is like an electrical outlet except little property values come out and splatter GUI.
@property (nonatomic, strong) ManualInstruction *manualInstruction;

@property (nonatomic, weak) IBOutlet UILabel *instructionIdLabel;
@property (nonatomic, weak) IBOutlet UILabel *instructionMessageLabel;
@property (nonatomic, weak) IBOutlet UILabel *imageTitleLabel;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UILabel *prompt;


@end
