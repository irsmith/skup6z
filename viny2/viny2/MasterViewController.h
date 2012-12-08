//
//  MasterViewController.h
//  viny2
//
//  Created by Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)] on 11/23/12.
//  Copyright (c) 2012 Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)]. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountdownTimer.h"
#import "DetailViewController.h"
@class DetailViewController;

@class DataController;


@interface MasterViewController : UITableViewController <TimerObserverDelegate,DetailViewControllerDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (nonatomic, strong) DataController *dataController;

/* Saves the selected index path on the table view.
 The index path of the table view will be reset to nil,
 everytime the popover is hidden and shown.*/
@property (strong, nonatomic) NSIndexPath *selectedIndexPath;
@property (nonatomic, retain) CountdownTimer * countdownTimer;
@end
