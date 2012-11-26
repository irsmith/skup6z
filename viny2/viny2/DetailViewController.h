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

// reference to the detail item and outlets (like java property listeners) for its visual elements.
@property (nonatomic, strong) ManualInstruction *manualInstruction;//add

@property (nonatomic, weak) IBOutlet UILabel *instructionIdLabel;
@property (nonatomic, weak) IBOutlet UILabel *instructionMessageLabel;
@property (nonatomic, weak) IBOutlet UILabel *imageTitleLabel;

// from xcode template
//@property (strong, nonatomic) id detailItem;
//@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
