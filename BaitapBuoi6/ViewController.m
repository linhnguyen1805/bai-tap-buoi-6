//
//  ViewController.m
//  BaitapBuoi6
//
//  Created by linhnguyen on 9/14/13.
//  Copyright (c) 2013 viettel. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self readText];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) readText
{
    sortArray = [[NSArray alloc] init];
    NSString *filPath = [[NSBundle mainBundle] pathForResource:@"putin" ofType:@"txt"];
    
    NSError *error;
    NSString *string = [[NSString alloc] initWithContentsOfFile:filPath encoding:NSUTF8StringEncoding error:&error];
    string = [[string stringByReplacingOccurrencesOfString:@"." withString:@" "] stringByReplacingOccurrencesOfString:@"," withString:@" "];
    NSArray *listArray = [string componentsSeparatedByString:@" "];
    sortArray = [[listArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] retain];
    
}
- (IBAction)readTextPutin:(id)sender {
    
    NSLog(@"======================= Sort ==================");
    [sortArray dump];
    //    for (NSString *object in sortArray) {
    //        NSLog(@"%@", object);
    //    }
    
    
}
- (IBAction)sortForLength:(id)sender {
    NSLog(@"======================= counter ==================");
    NSCountedSet *countedSet = [[NSCountedSet alloc] initWithArray: sortArray];
    for (id object in countedSet) {
        NSLog(@"%@ - %d", object, [countedSet countForObject:object]);
    }
    
    sortArray = [sortArray sortedArrayUsingComparator:^(id str1, id str2){
        
        if (((NSString *) str1).length >= ((NSString *) str2).length) {
            return NSOrderedDescending;
        } else
            return NSOrderedAscending;
        //        return NSOrderedSame;
    }];
    
    
    NSLog(@"======================= counter ==================");
    int i = 1;
    while (i <= ((NSString *)[sortArray lastObject]).length) {
        //         NSLog(@"===============================================");
        NSLog(@"==============length = %d ======================", i);
        
        for (NSString * str in sortArray) {
            if (str.length == i) {
                NSLog(@"%@",  str);
            }
        }
        i ++;
    }
    
}
@end
