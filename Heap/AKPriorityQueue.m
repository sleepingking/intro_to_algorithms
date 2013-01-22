//
//  AKPriorityQueue.m
//  Introduction to Algorithm
//
//  Created by Ben Chen on 1/20/13.
//  Copyright (c) 2013 Sleeping Heroes. All rights reserved.
//

#import "HeapSort.h"
#import "AKPriorityQueue.h"

@implementation AKPriorityQueue
{
	NSMutableArray *_heap;
}

- (id)initWithArray:(NSArray *)array comparator:(NSComparator)comparator
{
	self = [super init];
	if (self) {
		_heap = [[NSMutableArray alloc] initWithArray:array];
		_comparator = [comparator copy];
	}
	return self;
}

- (NSArray *)allObjects
{
	return [_heap copy];
}

- (NSUInteger)count
{
	return [_heap count];
}

- (id)objectAtIndex:(NSUInteger)index
{
	return [_heap objectAtIndex:index];
}

- (void)setComparator:(NSComparator)comparator
{
	if (_comparator == comparator)
		return;
	
	_comparator = [comparator copy];
	if (_comparator)
		HeapSort(_heap, _comparator);
}

- (id)maximun
{
	return HeapMaximum(_heap);
}

- (id)extractMax
{
	return HeapExtractMax(_heap, _comparator);
}

- (void)replaceObject:(id)object withObjectWithHigherValue:(id)anObject
{
	NSUInteger index = [_heap indexOfObject:object];
	HeapIncreaseKey(_heap, index, anObject, _comparator);
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObjectWithHigherValue:(id)anObject
{
	HeapIncreaseKey(_heap, index, anObject, _comparator);
}

@end
