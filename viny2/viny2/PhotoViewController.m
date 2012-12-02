//
//  PhotoViewController.m
//  viny2
//
//  Created by Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)] on 11/30/12.
//  Copyright (c) 2012 Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)]. All rights reserved.
//

#import "PhotoViewController.h"
#import "DetailViewController.h"
#import "ManualInstruction.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

@synthesize manualInstruction;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ManualInstruction *mi = self.manualInstruction;
    if (mi) {
        self.imageView.image = mi.image;      
    }
}

/* Set image from the data model. */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.manualInstruction.image) {
        self.imageView.image = self.manualInstruction.image;
        
    }
}

- (void)viewDidUnload
{
    self.manualInstruction = nil;  // this I copied w/out understanding
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end




