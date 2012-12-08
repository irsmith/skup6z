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


#pragma mark - Procedure Executor
-(void) startTask:(ManualInstruction *)task{
   
//    double seconds = 10L; // TODO get duration from task.dictionary
//    
//    self.countdownTimer = [[CountdownTimer alloc] init] ;
//    self.countdownTimer.delegate = self; //register as its observer
//    task.countdownTimer = self.countdownTimer; // allows detail view to register
//    
//    [self.countdownTimer startTimerWithStartTime:[DateUtils getVehicleTime] andDuration:(NSTimeInterval) seconds];
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
	neededBy.text = [self textForNeededBy:[mi.dictionary objectForKey:taskNeededByTimeSecondsKey]];
	UIImageView * doneImageView = (UIImageView *) [cell viewWithTag:102];
    id isDone = [mi.doneInstruction objectForKey:taskCompletionTimeSecondsKey];
    UIImage *ii = [self imageForDoneStatus: (isDone == nil) ? FALSE : TRUE];
	doneImageView.image = ii;
    
    return cell;
}

-(NSString *)textForNeededBy:(NSString *) keyValue{
    //NSString *epoch =  @"1316461169";
    NSDate *date = [DateUtils getDateFromEpoch:keyValue];    
    
    NSString *rv = [DateUtils getFormattedStringFromDate:date];
    
    return rv;
}
                    
- (UIImage *)imageForDoneStatus:(BOOL)isDone
{
    // overkill for switch but did for learning
	switch (isDone)
	{
        case 0: return [UIImage imageNamed:@"Blancovinkje.png"];//return nil;
		case 1: return [UIImage imageNamed:@"Blancovinkje.png"];
		
	}
	return nil;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

#pragma mark -
#pragma mark Table view selection

// Aha! we use didSelectRowAtIndexPath only for ipad, we use seque only for iphone

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndexPath = indexPath;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        NSIndexPath *selectedRowIndex = [self.tableView indexPathForSelectedRow];
        ManualInstruction *mi = [dataController objectInListAtIndex:selectedRowIndex.row];
        DetailViewController *detailViewController = self.detailViewController;
        detailViewController.manualInstruction = mi;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    /*
     When a row is selected, the segue creates the detail view controller as the destination.
     Set the detail view controller's detail item to the item associated with the selected row.
     */
    
    if ([[segue identifier] isEqualToString:@"pushStaticTable"]) {
         NSIndexPath *selectedRowIndex = [self.tableView indexPathForSelectedRow];
         DetailViewController *detailViewController = [segue destinationViewController];
        
        
         NSAssert(([detailViewController isKindOfClass:DetailViewController.class] == YES),@"vc is not right class");
        

         detailViewController.manualInstruction = [dataController objectInListAtIndex:selectedRowIndex.row];
     }
        
}

@end
