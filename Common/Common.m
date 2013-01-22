//
//  Common.m
//  Introduction to Algorithm
//
//  Created by Ben Chen on 1/15/13.
//  Copyright (c) 2013 Sleeping Heroes. All rights reserved.
//

#import "Common.h"

NSMutableArray *ArrayWithIntArray(NSInteger intArray[], NSUInteger count)
{
	NSCParameterAssert(count > 0);
	NSMutableArray *array = [[NSMutableArray alloc] init];
	for (NSUInteger i = 0; i < count; ++i) {
		[array addObject:@(intArray[i])];
	}
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

