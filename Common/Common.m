//
//  Common.m
//  Introduction to Algorithm
//
//  Created by Ben Chen on 1/15/13.
//  Copyright (c) 2013 Sleeping Heroes. All rights reserved.
//

#import "Common.h"

const int AK_NUMBER_SENTINEL = INT_MAX;

NSMutableArray *AKNumberArrayWithInts(int firstNumber, ...)
{
	NSMutableArray *array = [[NSMutableArray alloc] init];
	
	va_list args;
	va_start(args, firstNumber);
	
	int number = firstNumber;
	while (number != AK_NUMBER_SENTINEL) {
		[array addObject:@(number)];
		number = va_arg(args, int);
	}
	va_end(args);
	
	return array;
}

NSMutableArray *AKNumberArrayInBetween(NSInteger min, NSInteger max)
{
	NSInteger delta = (min < max) ? 1 : -1;
	NSMutableArray *array = [[NSMutableArray alloc] init];
	while (min != max) {
		[array addObject:@(min)];
		min+=delta;
	}
	[array addObject:@(max)];
	return array;
}
