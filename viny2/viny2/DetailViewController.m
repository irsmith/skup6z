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

// in Create an Action for the Button in Your First IOS App, A class extension in an implementation file is a place for declaring properties and methods that are private to a class. (You will learn more about class extensions in Write Objective-C Code.) Outlets and actions should be private. The Xcode template for a view controller includes a class extension in the implementation file;
//use @property and @synthesize together.  Objective-C is doing some legwork in the background to make sure that memory is allocated and deallocated properly when you directly access an object's properties.
@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UITableViewCell *imageActualPhoto;
@property (strong, nonatomic) UIPopoverController *masterPopoverController;

- (void)configureView;
- (IBAction)completeTask:(id)sender;
- (IBAction)reportTaskData:(id)sender;

@end

@implementation DetailViewController

@synthesize manualInstruction;



#pragma mark -  Countdown Timer and Task Events

// obverving countdown expiration
- (void) expired {
    NSLog(@"detail vc: i was notified that cd expired");
}
// observing the countdown time
- (void) fired: (BOOL)success{
    NSLog(@"detaiil vc: i was notified that cd ticked");
    
    
    // TODO i need to know when cd timer expired
}



// mark this task as done
-(void)markAsDone{
    // get the next task
    // if next task exists, start the timer for it
}

// mark as expired
-(void)markAsExpired{
    
}

#pragma mark - Managing the Data Model


/* Setter for the detail item.
 For iphone this is called by masterViewController prepareForSegue
 */
-(void)setManualInstruction:(ManualInstruction *)newInstruction {
    if (manualInstruction != newInstruction){
        manualInstruction = newInstruction;
        [self configureView];
    }
    
    // Hide the split view's popover after user has selected an item from it.
    if (nil != self.masterPopoverController) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }
}

/* Update the view based on the model's data.*/
- (void)configureView
{
    
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
        

        /* dot notation 
         self.view = somethingElse.view;
         is the same as
         [self setView:[somethingElse view]];
         */
    }
    
}

/*
 User has indicated that the task is complete. Calculate the completion time
 and update the data model the completion time.  Also update the UI.
 */
- (IBAction)completeTask:(id)sender {
    
    if([sender isKindOfClass:UIButton.class])
    {
        UIButton *doneButton = (UIButton *)sender;
        NSDate *completionTime = [DateUtils getVehicleTime];
        // TODO [self.manualInstruction.countdownTimer timeCountedDownSoFar];
        
        // ? need to finish the API for Countdown and DateUtil
        // Not sure about interval vs date
        NSObject *completionTimeAsString = [DateUtils getFormattedStringFromDate:completionTime];
        
        NSMutableDictionary *returnData = self.manualInstruction.doneInstruction;
        [returnData setObject: completionTimeAsString forKey:taskCompletionTimeSecondsKey];

        // Paint Done button in a depressed state, change color and disable it.

        doneButton.enabled = NO;
        
        // Disable UISwitch
        // ? how to get ref to uiswith?
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
    
  
    // enable Done button
    // how to get ref to done button?

   }

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
   
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

@end
