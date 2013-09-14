//
//  NSArray+Dump.m
//  BaitapBuoi6
//
//  Created by linhnguyen on 9/15/13.
//  Copyright (c) 2013 viettel. All rights reserved.
//

#import "NSArray+Dump.h"

@implementation NSArray (Dump)
- (void) dump
{
    for (id object in self) {
        NSLog(@"%@", object);
    }
}
@end
