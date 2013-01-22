//
//  AKPriorityQueue.h
//  Introduction to Algorithm
//
//  Created by Ben Chen on 1/20/13.
//  Copyright (c) 2013 Sleeping Heroes. All rights reserved.
//

#import "Common.h"
#import <Foundation/Foundation.h>

@interface AKPriorityQueue : NSObject

@property (copy, readonly, nonatomic) NSComparator comparator;

- (id)initWithArray:(NSArray *)array comparator:(NSComparator)comparator;

- (NSArray *)allObjects;
- (NSUInteger)count;
- (id)objectAtIndex:(NSUInteger)index;

- (id)maximun;
- (id)extractMax;

- (void)replaceObject:(id)object withObjectWithHigherValue:(id)anObject;
- (void)replaceObjectAtIndex:(NSUInteger)index withObjectWithHigherValue:(id)anObject;

@end
