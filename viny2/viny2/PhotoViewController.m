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
@synthesize imageView;


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
    ManualInstruction *mi = self.manualInstruction;
    NSAssert((mi != nil),@"no data.");
    
    if (self.imageView = nil) {
       NSAssert((self.imageView = nil),@"photo vc's UIImageView was not instantiated by storyboard. Did you forget to synthsize imageView ? why yes, I did");
       self.imageView = [[UIImageView alloc]init];
    } else {
        [self.imageView setImage:mi.image];
        //does nothing
    }
    if (mi) {
        self.imageView.image = mi.image;
    }
}

/* Set image from the data model. */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    ManualInstruction *mi = self.manualInstruction;
    NSAssert((mi != nil),@"no data.");

    NSAssert((self.imageView != nil),@"UIImageView was not instantiated by storyboard. Did you forget to synthsize imageView ? Initially I did forget but it's there now.");
    
    //self._imageView = nil; // compile error propery not found
    
    [self.imageView setImage:mi.image];
  
    
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




