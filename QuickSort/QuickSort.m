//
//  QuickSort.m
//  Introduction to Algorithm
//
//  Created by Ben Chen on 1/16/13.
//  Copyright (c) 2013 Sleeping Heroes. All rights reserved.
//

#import "QuickSort.h"

NSInteger _Divide(NSMutableArray *array, NSInteger start, NSInteger end, NSComparator comparator)
{
	assert(start < end);
	
	id pivot = array[end];
	
	NSInteger j = start-1;
	for (NSInteger i = start; i < end; ++i) {
		if (comparator(array[i], pivot) <= NSOrderedSame) {
			j++;
			[array exchangeObjectAtIndex:i withObjectAtIndex:j];
		}
	}
	
	[array exchangeObjectAtIndex:j+1 withObjectAtIndex:end];
	
	return j;
}

void _QuickSort(NSMutableArray *array, NSInteger start, NSInteger end, NSComparator comparator)
{
	if (start >= end)
		return;
	
	NSInteger index = _Divide(array, start, end, comparator);
	_QuickSort(array, start, index, comparator);
	_QuickSort(array, index+1, end, comparator);
}

void QuickSort(NSMutableArray *array, NSComparator comparator)
{
	if ([array count] <= 1)
		return;
	
	_QuickSort(array, 0, [array count] - 1, comparator);
}
