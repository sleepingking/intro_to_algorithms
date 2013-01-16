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
	assert(count > 0);
	NSMutableArray *array = [[NSMutableArray alloc] init];
	for (NSUInteger i = 0; i < count; ++i) {
		[array addObject:@(intArray[i])];
	}
	return array;
}

