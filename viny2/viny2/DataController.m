/*
     File: DataController.m
 Abstract: A simple controller class responsible for managing the application's data.
 Typically this object would be able to load and save a file containing the appliction's data. This example illustrates just the basic minimum: it creates an array containing information about some plays and provides simple accessor methods for the array and its contents.
  Version: 3.1
 
 Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple
 Inc. ("Apple") in consideration of your agreement to the following
 terms, and your use, installation, modification or redistribution of
 this Apple software constitutes acceptance of these terms.  If you do
 not agree with these terms, please do not use, install, modify or
 redistribute this Apple software.
 
 In consideration of your agreement to abide by the following terms, and
 subject to these terms, Apple grants you a personal, non-exclusive
 license, under Apple's copyrights in this original Apple software (the
 "Apple Software"), to use, reproduce, modify and redistribute the Apple
 Software, with or without modifications, in source and/or binary forms;
 provided that if you redistribute the Apple Software in its entirety and
 without modifications, you must retain this notice and the following
 text and disclaimers in all such redistributions of the Apple Software.
 Neither the name, trademarks, service marks or logos of Apple Inc. may
 be used to endorse or promote products derived from the Apple Software
 without specific prior written permission from Apple.  Except as
 expressly stated in this notice, no other rights or licenses, express or
 implied, are granted by Apple herein, including but not limited to any
 patent rights that may be infringed by your derivative works or by other
 works in which the Apple Software may be incorporated.
 
 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE
 MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
 THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
 FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND
 OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
 
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
 OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
 MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED
 AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
 STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.
 
 Copyright (C) 2012 Apple Inc. All Rights Reserved.
 
 */

#import "DataController.h"
#import "ManualInstruction.h"
#import "ProjectConstants.h"

@interface DataController ()
@property (nonatomic, copy, readwrite) NSMutableArray *list;
- (NSMutableArray *)createDemoData;
@end


@implementation DataController

@synthesize list;


- (id)init {
    if (self = [super init]) {
        self.list = [self createDemoData];
        
    }


    return self;
}

// Custom set accessor to ensure the new list is mutable.
- (void)setList:(NSMutableArray *)newList {
    if (list != newList) {
        list = [newList mutableCopy];
    }
}

// Accessor methods for list.
- (unsigned)countOfList {
    return [list count];
}

- (ManualInstruction *)objectInListAtIndex:(unsigned)theIndex {
    return [list objectAtIndex:theIndex];
}


/*   Returns array containing some demonstration data.  */
- (NSMutableArray *)createDemoData {
    ManualInstruction *instruction;
    NSDictionary *dictionary;
    UIImage *img;
    NSMutableArray *instructionList = [[NSMutableArray alloc] init];
    
    //115
    dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                  @"procedureIdentifier 63115 block3", instructionIDKey,
                  @"Access cRIO Box under the floor in section A and check LED",   instructionMessageKey,
                  @"cRIO Box LED", imageTitleKey,
                  @"Expiration fallback: automatic", fallbackMessageKey,
                  @"1316461169000", vehicleTimeSecondsKey,
                  @"1316461172000", neededByTimeSecondsKey,
                  @"Is LED on?", promptKey,
                  @"Loss of this power source de-energizes safety critical CO2 and O2 sensors. Power recovery to these sensors is required within 1/2 hour for continuation of safe DSH operations. Fallback is automatic",clarifyingInfoKey,
                  
                  nil];
    img = [self fetchImageWithName:@"crio-box-led.jpg"];
	instruction = [[ManualInstruction alloc] initWithDictionary:dictionary andImage:img];
    [instructionList addObject:instruction];

    dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                  @"procedureIdentifier 63115 block9", instructionIDKey,
                  @"Access 24VDC converter box under the floor in section A and check LED",   instructionMessageKey,
                  @"24VDC Converter Box", imageTitleKey,
                  @"Upon expiration will perform automatic failover", fallbackMessageKey,
                  @"1316461159000", vehicleTimeSecondsKey,
                  @"1316461162000", neededByTimeSecondsKey,
                  @"Is LED on?", promptKey,
                  @"Loss of this power source de-energizes safety critical CO2 and O2 sensors. Power recovery to these sensors is required within 1/2 hour for continuation of safe DSH operations. Fallback is automatic",clarifyingInfoKey,
                
                  nil];
    img = [self fetchImageWithName:@"24v-converter-box.jpg"];
	instruction = [[ManualInstruction alloc] initWithDictionary:dictionary andImage:img];
    [instructionList addObject:instruction];


    //103
    dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
          @"procedureIdentifier 63115 instr4", instructionIDKey,
          @"Verify external spotlight D wall switch inside in section A is ON", instructionMessageKey,   
          @"External Spotlight D Wall Switch",  imageTitleKey,
                  @"Expiration fallback: automatic", fallbackMessageKey,
                  @"1316461140000", vehicleTimeSecondsKey,
                  @"1316461144000", neededByTimeSecondsKey,
                  @"Is light on?", promptKey,
                  nil];
    img = [self fetchImageWithName:@"external-spotlight-d.jpg"];
    
	instruction = [[ManualInstruction alloc] initWithDictionary:dictionary andImage:img];
    [instructionList addObject:instruction];
    
    
    dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                @"procedureIdentifier 63103 instr5", instructionIDKey,
                  @"View spotlight through window in external DMM hatch door",   instructionMessageKey,
                @"Spotlight through DMM hatch door", imageTitleKey,
                  @"Expiration fallback: automatic", fallbackMessageKey,
                  @"1316461149000", vehicleTimeSecondsKey,
                  @"1316461152000", neededByTimeSecondsKey,
                  @"Is DMM hatch door spotlight on?", promptKey,
                  nil];
    img = [self fetchImageWithName:@"view-spotlight.jpg"];
	instruction = [[ManualInstruction alloc] initWithDictionary:dictionary andImage:img];
    [instructionList addObject:instruction];
    
        
    return instructionList;    
}

-(BOOL) canConnectToServer {
    return NO;
}

-(void) asyncFetchImageWithName:(NSString *)imageNameWithExtension{
    
    // practice code
    
    // get the img file pathname from the bundle
    NSString *imageName = nil;// todo remove ".png" from imageNameWithExtension
    NSBundle* myBundle = [NSBundle mainBundle];
    NSString* myImage = [myBundle pathForResource:imageName ofType:@"png"];
    //??undelared ID for ns img
    //NSImage* imageObj = [[NSImage alloc] initWithContentsOfFile:myImage]; 
    
    // get the img file from the user's doc domain
    NSArray *paths =   NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *fileInUserDocdir = [documentsDirectory stringByAppendingPathComponent:imageName];
    
    // convert to url
    // http://stackoverflow.com/questions/1514343/iphone-nsdata-from-local-files-url
    // Given some file path URL: NSURL *pathURL
    NSURL *pathURL = [[NSURL alloc]initFileURLWithPath:fileInUserDocdir];
    NSAssert1(([pathURL isFileURL] == YES), @"Not a fileURL: %@",fileInUserDocdir);
    NSString *convertedBack = [pathURL path];
    NSAssert ((convertedBack = fileInUserDocdir),@"url conversion");
   
}
  
/* Get image, either demo image in bundle or setup asynch fetch by constructing its URL. 
   input: filename 
 */
-(UIImage *)fetchImageWithName: (NSString *)imageName {
    
    if ([self canConnectToServer]) {
        [self asyncFetchImageWithName:imageName];
        return nil;
    } else {
        UIImage *img = [UIImage imageNamed:imageName];
        // what is this
        //[[UIImage alloc] initWithContentsOfFile:imageName];
        return (img) ? img :  [UIImage imageNamed:@"200pxmissing.png"];
    }
}


@end
