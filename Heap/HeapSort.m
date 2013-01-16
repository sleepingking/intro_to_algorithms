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
	assert(heapSize > i);
	assert(comparator != nil);
	
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
		id temp = heap[i];
		heap[i] = heap[largestIndex];
		heap[largestIndex] = temp;
		
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
	assert(comparator != nil);
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
		id temp = heap[0];
		heap[0] = heap[i];
		heap[i] = temp;
		
		heapSize--;
		_MaxHeapify(heap, heapSize, 0, comparator);
	}
}

