//
//  MasterViewController.m
//  viny2
//
//  Created by Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)] on 11/23/12.
//  Copyright (c) 2012 Smith, Irene S. (ARC-TI)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)]. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "DataController.h"
#import "ManualInstruction.h"
#import "ProjectConstants.h"
#import "DateUtils.h"

@implementation MasterViewController

@synthesize dataController;
@synthesize selectedIndexPath = _selectedIndexPath;
@synthesize countdownTimer; //ProcedureExecutor

#pragma mark -
#pragma mark - View Lifecycle

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
    self.dataController = [[DataController alloc]init];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Select the first item by default. Otherwise, there will
    // be no data selected and detail view will show nothing.
    self.selectedIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    self.detailViewController.manualInstruction = [self.dataController objectInListAtIndex:self.selectedIndexPath.row]; // or simply, zero
    
    [self startTask:self.detailViewController.manualInstruction];
    
}

/* Release any strong references here. */
- (void)viewDidUnload
{
    self.selectedIndexPath = nil;
    self.detailViewController = nil;
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Highlight the previously selected data item.
    [self.tableView selectRowAtIndexPath:self.selectedIndexPath
                                animated:YES
                          scrollPosition:UITableViewScrollPositionMiddle];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Only one section, so return the number of items in the list.
    return [dataController countOfList];
}

/* Emit a table cell. */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MasterPrototypeCell" forIndexPath:indexPath];
    
    ManualInstruction *mi = [dataController objectInListAtIndex:indexPath.row];
    
    /* prototype cell for master list */
	UILabel *instructionID = (UILabel *)[cell viewWithTag:100];
	instructionID.text = [mi.dictionary objectForKey:instructionMessageKey];
	UILabel *neededBy = (UILabel *)[cell viewWithTag:101];
    NSDate *date = [DateUtils getDateFromEpoch:[mi.dictionary objectForKey:taskNeededByTimeSecondsKey]];
	neededBy.text = [DateUtils getFormattedStringFromDate:date];
	UIImageView * doneImageView = (UIImageView *) [cell viewWithTag:102];
    id isDone = [mi.doneInstruction objectForKey:taskCompletionTimeSecondsKey];
	doneImageView.image =  [self imageForDoneStatus: (isDone == nil) ? FALSE : TRUE];
    return cell;
}


- (UIImage *)imageForDoneStatus:(BOOL)isDone
{
    // overkill for switch but did for learning
	switch (isDone){
        case 0: return [UIImage imageNamed:@"Blancovinkje.png"];//return nil;
		case 1: return [UIImage imageNamed:@"Blancovinkje.png"];            
	}
	return nil;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}



/*
 NOTE For ipad, this is the "segue" to the detail view. For iphone UI idiom, segue
 transition is used. 
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndexPath = indexPath;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        
        // set data
        NSIndexPath *selectedRowIndex = [self.tableView indexPathForSelectedRow];
        ManualInstruction *mi = [dataController objectInListAtIndex:selectedRowIndex.row];
        DetailViewController *detailViewController = self.detailViewController;
        detailViewController.manualInstruction = mi;
        
        // set reference to this
        detailViewController.delegate = self;
    }
}


#pragma mark -  Countdown Timer and Task Events

// obverving countdown expiration
- (void) expired {
//    AudioServicesPlaySystemSound(taskDataReportedSound);

    NSLog(@"master vc: i was notified that cd expired");
}



- (void) firedWithHours: (NSString *)hours: (NSString *)minutes: (NSString *)seconds{
    
    NSLog(@"mast vc: ignore notification of ticked");
}


// mark this task as done
-(void)markAsDone{
    // get the next task
    // if next task exists, start the timer for it
}

// mark as expired
-(void)markAsExpired{
    
}


#pragma mark - Detail View Management

/*
 NOTE For ipad, this is the "segue" to the detail view. For iphone UI idiom, segue
 transition is used.

 When a row is selected, the segue creates the detail view controller as the destination.
 The new view controller has been loaded from the storyboard at this point but it’s
 not visible yet, and we can use this opportunity to send data to it.
 */

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   
    if ([[segue identifier] isEqualToString:@"pushStaticTable"]) {
        
         // set model data
         NSIndexPath *selectedRowIndex = [self.tableView indexPathForSelectedRow];
         DetailViewController *detailViewController = [segue destinationViewController];
                
         detailViewController.manualInstruction = [dataController objectInListAtIndex:selectedRowIndex.row];
        
         // set reference to this
         detailViewController.delegate = self;
     }
        
}

- (void)didCancel:(DetailViewController *)controller {
    
}

/*
 Wenderlich, It is perfectly possible to call dismissViewControllerAnimated:completion: from
 the modal screen. There is no requirement that says this must be done by the delegate. 
 */
- (void)didCompleteTask:(DetailViewController *)controller {
	[self dismissViewControllerAnimated:YES completion:nil];
}

-(void) startTask:(ManualInstruction *)task{
    
    //    double seconds = 10L; // TODO get duration from task.dictionary
    //
    //    self.countdownTimer = [[CountdownTimer alloc] init] ;
    //    self.countdownTimer.delegate = self; //register as its observer
    //    task.countdownTimer = self.countdownTimer; // allows detail view to register
    //
    //    [self.countdownTimer startTimerWithStartTime:[DateUtils getVehicleTime] andDuration:(NSTimeInterval) seconds];
}

@end
