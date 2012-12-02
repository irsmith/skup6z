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

// what is the purpose of this? in Create an Action for the Button in Your First IOS App, A class extension in an implementation file is a place for declaring properties and methods that are private to a class. (You will learn more about class extensions in Write Objective-C Code.) Outlets and actions should be private. The Xcode template for a view controller includes a class extension in the implementation file;

@interface DetailViewController ()

@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
- (IBAction)changeGreeting:(id)sender;
- (IBAction)ofOffSwith:(id)sender;
@property (weak, nonatomic) IBOutlet UITableViewCell *imageActualPhoto;


@end

@implementation DetailViewController

@synthesize manualInstruction;

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
        self.fallbackMessage = [mi.dictionary objectForKey:fallbackMessageKey];
        self.clarifyingInfo = ([mi.dictionary objectForKey:clarifyingInfoKey]) ? [mi.dictionary objectForKey:clarifyingInfoKey]
        : @"--";
                    
        /* dot notation 
         self.view = somethingElse.view;
         is the same as
         [self setView:[somethingElse view]];
    
         */
        
    }
    
}

- (IBAction)changeGreeting:(id)sender {
    NSLog(@"change greeting");
}

- (IBAction)ofOffSwith:(id)sender {
    NSLog(@"switch ==");

}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    self.imageView.clipsToBounds = YES; //clip contained photos
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
    [self performSegueWithIdentifier:@"toPhoto" sender:self];
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    //? how to make segue to photo
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
//        NSIndexPath *selectedRowIndex = nil;//[self.tableView indexPathForSelectedRow];
//       
//    }
//}

#pragma mark -
#pragma mark Button Action
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showPhoto"]) {
        PhotoViewController *vc = [segue destinationViewController];

        NSAssert(
                 ([vc isKindOfClass:PhotoViewController.class] == YES),@"vc is not photo");
        
        NSAssert(
                 (vc.imageView != nil),@"photo vc's UIImage was not instantiated by storyboard.");
        


        vc.imageView.image = self.manualInstruction.image;
        
    }
    
}

@end
