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
		heap[0] = heap[count-1];
		[heap removeLastObject];
		MaxHeapify(heap, 0, comparator);
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
	assert(result == NSOrderedSame || result == NSOrderedAscending);
	
	heap[index] = newObject;
	if (result == NSOrderedSame)
		return;
	
	while (index > 0) {
		NSUInteger parentIndex = ParentOf(index);
		id object = heap[parentIndex];
		if (comparator(newObject, object) == NSOrderedDescending) {
			id temp = heap[index];
			heap[index] = heap[parentIndex];
			heap[parentIndex] = temp;
			
			index = parentIndex;
		}
		else {
			break;
		}
	}
}

