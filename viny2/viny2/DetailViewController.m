//
//  DetailViewController.m
//  viny
//
//  Created by Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)] on 11/22/12.
//  Copyright (c) 2012 Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)]. All rights reserved.
//

#import "DetailViewController.h"
#import "ManualInstruction.h"
#import "ProjectConstants.h"
#import "PhotoViewController.h"
#import "DateUtils.h"
#include <sys/time.h>

// in Create an Action for the Button in Your First IOS App, A class extension in an implementation file is a place for declaring properties and methods that are private to a class. (You will learn more about class extensions in Write Objective-C Code.) Outlets and actions should be private. The Xcode template for a view controller includes a class extension in the implementation file;
//use @property and @synthesize together.  Objective-C is doing some legwork in the background to make sure that memory is allocated and deallocated properly when you directly access an object's properties.

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UITableViewCell *imageActualPhoto;
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
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
@property (weak, nonatomic) IBOutlet UISwitch *taskResultReporter;
@property (weak, nonatomic) IBOutlet UIButton *taskDone;

- (void)configureView;  
- (IBAction)completeTask:(id)sender;
- (IBAction)reportTaskData:(id)sender;

@end

@implementation DetailViewController

@synthesize  manualInstruction = _manualInstruction;
@synthesize  delegate;
@synthesize  instructionIdLabel = _instructionIdLabel;
@synthesize  instructionMessageLabel= _instructionMessageLabel;
@synthesize  imageTitleLabel = _imageTitleLabel;
@synthesize  imageView= _imageView;
@synthesize  prompt = _prompt;
@synthesize  fallbackMessage = _fallbackMessage;
@synthesize  clarifyingInfo = _clarifyingInfo;
@synthesize  SecondsText = _SecondsText;
@synthesize  minutesText = _minutesText;
@synthesize  hoursText = _hoursText;

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	
    [self configureView];
    
    [self createSounds];
}

/* Release any strong references here. */
- (void)viewDidUnload
{
    self.manualInstruction = nil;
    self.masterPopoverController = nil;
    [super viewDidUnload];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split View Delegate

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

#pragma mark -
#pragma mark Table view selection

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    // gotcha because I used storyboard drag method, the
    // ID needed to be coded manually
    [self performSegueWithIdentifier:@"showPhoto" sender:self];
}

/* Pattern from BountyHunter
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue identifier] isEqualToString:@"showPhoto"]) {
        PhotoViewController *vc = [segue destinationViewController];
        
        NSAssert(
                 ([vc isKindOfClass:PhotoViewController.class] == YES),@"vc is not photo");
        
        //UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"photoViewController"];
        
        vc.manualInstruction = self.manualInstruction;
        
    }
    
}


#pragma mark - Managing the Data Model

/* Setter for the detail item.
 For iphone this is called by masterViewController prepareForSegue
 */
-(void)setManualInstruction:(ManualInstruction *)newInstruction {
    if (_manualInstruction != newInstruction){
        _manualInstruction = newInstruction;
        [self configureView];
    }
    
    // Hide the split view's popover after user has selected an item from it.
    if (nil != self.masterPopoverController) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }
}

/* Update the view based on the model's data.*/
- (void)configureView {
    ManualInstruction *mi = self.manualInstruction;
    NSAssert( (mi != nil),@"detailV configureView: no data");
    if (mi) {
        self.instructionIdLabel.text = [mi.dictionary objectForKey:instructionIDKey];
        self.instructionMessageLabel.text = [mi.dictionary objectForKey:instructionMessageKey];
        self.imageTitleLabel.text = [mi.dictionary objectForKey:imageTitleKey];
        self.imageView.image = mi.image;
        self.prompt.text = [mi.dictionary objectForKey:promptKey];
        self.fallbackMessage.text = [mi.dictionary objectForKey:fallbackMessageKey];
        self.clarifyingInfo.text = ([mi.dictionary objectForKey:clarifyingInfoKey]) ? [mi.dictionary objectForKey:clarifyingInfoKey]
        : @"--";
        mi.countdownTimer.delegate1 = self;
        
        /* dot notation
         self.view = somethingElse.view;
         is the same as
         [self setView:[somethingElse view]];
         */
        [     self startTask:mi];
    }
    
}

// obverving countdown expiration
- (void) expired {
    NSLog(@"detail vc: i was notified that cd expired");
}

// observing the countdown time
- (void) firedWithHours: (NSString *)hours: (NSString *)minutes: (NSString *)seconds{

    NSLog(@"detaiil vc: was notified that cd ticked");
    self.hoursText.text = hours;
    self.minutesText.text = minutes;
    self.SecondsText.text = seconds;
}


// mark this task as done
-(void)markAsDone{
    // get the next task
    // if next task exists, start the timer for it
}

// mark as expired
-(void)markAsExpired{
    
}



-(void) startTask:(ManualInstruction *)task{
    
    self.taskResultReporter.enabled = YES;
    double seconds = 10L; // TODO get duration from task.dictionary
    
    countdownTimer = [[CountdownTimer alloc] init] ;
    countdownTimer.delegate1 = self; //register as its observer
    
    [countdownTimer startTimerWithStartTime:[DateUtils getVehicleTime] andDuration:(NSTimeInterval) seconds];
}

/*
 User has indicated that the task is complete. Calculate the completion time
 and update the data model the completion time.  Also update the UI.
 */
- (IBAction)completeTask:(id)sender {
    
    if([sender isKindOfClass:UIButton.class])
    {
        //UIButton *doneButton = (UIButton *)sender;
        NSDate *completionTime = [DateUtils getVehicleTime];
        // TODO [self.manualInstruction.countdownTimer timeCountedDownSoFar];
        
        // ? need to finish the API for Countdown and DateUtil
        // Not sure about interval vs date
        NSObject *completionTimeAsString = [DateUtils getFormattedStringFromDate:completionTime];
        
        NSMutableDictionary *returnData = self.manualInstruction.doneInstruction;
        [returnData setObject: completionTimeAsString forKey:taskCompletionTimeSecondsKey];

        // TODO Paint Done button in a depressed state, change color
        self.taskResultReporter.enabled = NO;
        self.taskDone.enabled = NO;
    	AudioServicesPlaySystemSound(taskDoneSound);

        [self.delegate didCompleteTask:self];
    }
}




/* 
 User has performed the action item for the task.  Get the result and 
 update the data model.  Enable the Done button. 
 */
- (IBAction)reportTaskData:(id)sender {
    
    NSAssert(([sender isKindOfClass:UISwitch.class] == YES),@"Only boolean task data is implemented at this time.");
    
    if([sender isKindOfClass:UISwitch.class])
    {
        UISwitch *reportingSwitch = (UISwitch *)sender;
        BOOL value = [reportingSwitch isOn];
        NSString *result = (value = YES) ? @"YES" : @"NO"; //better way?
        NSMutableDictionary *returnData = self.manualInstruction.doneInstruction;
        [returnData setObject: result forKey:returnStatusKey];
    }
    self.taskResultReporter.enabled = NO;
    AudioServicesPlaySystemSound(taskDataReportedSound);
    self.taskDone.enabled = YES;


   }

#pragma mark -  Private util
- (void)createSounds {
    
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:taskDataReportedSoundTag ofType:@"caf"];
    NSURL *soundURL = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &taskDataReportedSound);
    
    soundPath = [[NSBundle mainBundle] pathForResource:taskDoneSoundTag ofType:@"caf"];
    soundURL = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &taskDoneSound);
    
    soundPath = [[NSBundle mainBundle] pathForResource:taskExpirededSoundTag ofType:@"caf"];
    soundURL = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &taskExpirededSound);
}


@end
