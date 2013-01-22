//
//  HeapSort.m
//  Introduction to Algorithm
//
//  Created by Ben Chen on 1/15/13.
//  Copyright (c) 2013 Sleeping Heroes. All rights reserved.
//

#import "HeapSort.h"

static inline NSUInteger ParentOf(NSUInteger index) {
	if (index == 0)
		return NSNotFound;
	else
		return ((index + 1) / 2) - 1;
}

static inline NSUInteger LeftOf(NSUInteger index) {
	return (index+1) * 2 - 1;
}

static inline NSUInteger RightOf(NSUInteger index) {
	return (index+1) * 2;
}

void _MaxHeapify(NSMutableArray *heap, NSUInteger heapSize, NSUInteger i, NSComparator comparator)
{
	NSCAssert(heapSize > i, @"");
	NSCAssert(comparator != nil, @"");
	
	// compare the current node with its left and right child, to see which one is the largest
	NSUInteger largestIndex = i;
	
	NSUInteger leftIndex = LeftOf(i);
	if (leftIndex < heapSize) {
		NSComparisonResult result = comparator(heap[leftIndex], heap[largestIndex]);
		if (result == NSOrderedDescending)
			largestIndex = leftIndex;
	}
	
	NSUInteger rightIndex = RightOf(i);
	if (rightIndex < heapSize) {
		NSComparisonResult result = comparator(heap[rightIndex], heap[largestIndex]);
		if (result == NSOrderedDescending)
			largestIndex = rightIndex;
	}
	
	if (largestIndex != i) {
		// exchange it with the largest one
		[heap exchangeObjectAtIndex:i withObjectAtIndex:largestIndex];
		
		// "flow-down"
		_MaxHeapify(heap, heapSize, largestIndex, comparator);
	}
}

void MaxHeapify(NSMutableArray *heap, NSUInteger i, NSComparator comparator)
{
	_MaxHeapify(heap, [heap count], i, comparator);
}

void BuildMaxHeap(NSMutableArray *heap, NSComparator comparator)
{
	NSCAssert(comparator != nil, @"");
	NSUInteger heapSize = [heap count];
	if (heapSize <= 1)
		return;
	
	NSUInteger halfWay = heapSize/2 - 1;
	for (NSInteger i = halfWay; i >= 0; --i) {
		MaxHeapify(heap, i, comparator);
	}
}

void HeapSort(NSMutableArray *heap, NSComparator comparator)
{
	NSUInteger count = [heap count];
	if (count <= 1)
		return;
	
	BuildMaxHeap(heap, comparator);
	
	NSUInteger heapSize = [heap count];
	
	for (NSUInteger i = count-1; i >= 1; --i) {
		[heap exchangeObjectAtIndex:0 withObjectAtIndex:i];
		
		heapSize--;
		_MaxHeapify(heap, heapSize, 0, comparator);
	}
}

id HeapMaximum(NSMutableArray *heap)
{
	if ([heap count] == 0)
		return nil;
	
	return heap[0];
}

id HeapExtractMax(NSMutableArray *heap, NSComparator comparator)
{
	NSUInteger count = [heap count];
	if (count == 0)
		return nil;
	
	id max = heap[0];
	
	if (count > 1) {
		heap[0] = heap[count-1];			// use the last one (a leaf) as the root
		[heap removeLastObject];
		MaxHeapify(heap, 0, comparator);	// re-heapify
	}
	else {
		[heap removeObjectAtIndex:0];
	}
	
	return max;
}

void HeapIncreaseKey(NSMutableArray *heap, NSUInteger index, id newObject, NSComparator comparator)
{
	id oldObject = heap[index];
	NSComparisonResult result = comparator(oldObject, newObject);
	NSCAssert(result == NSOrderedSame || result == NSOrderedAscending, @"");
	
	heap[index] = newObject;
	if (result == NSOrderedSame)
		return;
	
	while (index > 0) {
		// "flow up"
		NSUInteger parentIndex = ParentOf(index);
		id object = heap[parentIndex];
		if (comparator(newObject, object) == NSOrderedDescending) {
			[heap exchangeObjectAtIndex:index withObjectAtIndex:parentIndex];
			
			index = parentIndex;
		}
		else {
			break;
		}
	}
}

BOOL IsMaxHeap(NSMutableArray *heap, NSComparator comparator)
{
	NSCParameterAssert(comparator != nil);
	NSUInteger i = 0;
	for (id obj in heap) {
		NSUInteger parentIndex = ParentOf(i);
		if (parentIndex != NSNotFound) {
			id parent = heap[parentIndex];
			if (comparator(parent, obj) == NSOrderedAscending)
				return NO;
		}
		++i;
	}
	return YES;
}

