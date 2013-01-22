//
//  QuickSort_Test.m
//  QuickSort_Test
//
//  Created by Ben Chen on 1/16/13.
//  Copyright (c) 2013 Sleeping Heroes. All rights reserved.
//

#import "Common.h"
#import "QuickSort.h"
#import "QuickSort_Test.h"

@implementation QuickSort_Test

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testQuickSort
{
	NSInteger input[] = {2,3};
	NSMutableArray *array = ArrayWithIntArray(input, 2);
	NSMutableArray *output = ArrayWithIntArray(input, 2);
	
	QuickSort(array, ^(NSNumber *a, NSNumber *b) {
		return [a compare:b];
	});
	
	STAssertEqualObjects(array, output, @"");
	
	NSInteger input2[] = {3,2};
	array = ArrayWithIntArray(input2, 2);
	NSInteger output2[] = {2,3};
	output = ArrayWithIntArray(output2, 2);
	
	QuickSort(array, ^(NSNumber *a, NSNumber *b) {
		return [a compare:b];
	});
	
	STAssertEqualObjects(array, output, @"");
}

@end
