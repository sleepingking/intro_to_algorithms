//
//  HeapSort_Test.m
//  HeapSort_Test
//
//  Created by Ben Chen on 1/15/13.
//  Copyright (c) 2013 Sleeping Heroes. All rights reserved.
//

#import "Common.h"
#import "HeapSort.h"
#import "HeapSort_Test.h"

@implementation HeapSort_Test

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

- (void)testMaxHeapify
{
	NSString *errorMsg = @"MaxHeapify doesn't work";
	
	NSMutableArray *input = [@[@(1), @(4), @(5)] mutableCopy];
	NSArray *expected = @[@(5), @(4), @(1)];
	MaxHeapify(input, 0, ^(NSNumber *a, NSNumber *b) {
		return [a compare:b];
	});
	STAssertEqualObjects(input, expected, errorMsg);
	
	input = [@[@(1), @(5), @(4)] mutableCopy];
	expected = @[@(5), @(1), @(4)];
	MaxHeapify(input, 0, ^(NSNumber *a, NSNumber *b) {
		return [a compare:b];
	});
	STAssertEqualObjects(input, expected, errorMsg);
	
	input = [@[@(5), @(1), @(4)] mutableCopy];
	expected = @[@(5), @(1), @(4)];
	MaxHeapify(input, 0, ^(NSNumber *a, NSNumber *b) {
		return [a compare:b];
	});
	STAssertEqualObjects(input, expected, errorMsg);
	
	input = [@[@(5), @(4), @(1)] mutableCopy];
	expected = @[@(5), @(4), @(1)];
	MaxHeapify(input, 0, ^(NSNumber *a, NSNumber *b) {
		return [a compare:b];
	});
	STAssertEqualObjects(input, expected, errorMsg);
}

- (void)testBuildMaxHeap
{
	NSMutableArray *inputArray = AKNumberArrayWithInts(4,1,3,2,16,9,10,14,8,7, AK_NUMBER_SENTINEL);
	NSMutableArray *expectedArray = AKNumberArrayWithInts(16,14,10,8,7,9,3,2,4,1, AK_NUMBER_SENTINEL);
	
	BuildMaxHeap(inputArray, ^(NSNumber *a, NSNumber *b) {
		return [a compare:b];
	});
	
	STAssertEqualObjects(inputArray, expectedArray, @"BuildMaxHeap doesn't work");
}

- (void)testHeapSort
{
	NSMutableArray *inputArray = AKNumberArrayWithInts(4,1,3,2,16,9,10,14,8,7, AK_NUMBER_SENTINEL);
	NSMutableArray *expectedArray = AKNumberArrayWithInts(1,2,3,4,7,8,9,10,14,16, AK_NUMBER_SENTINEL);
	
	HeapSort(inputArray, ^(NSNumber *a, NSNumber *b) {
		return [a compare:b];
	});
	
	STAssertEqualObjects(inputArray, expectedArray, @"BuildMaxHeap doesn't work");
}

- (void)testHeapMax
{
	NSMutableArray *maxHeap = AKNumberArrayWithInts(16,14,10,8,7,9,3,2,4,1, AK_NUMBER_SENTINEL);
	NSComparator comparator = ^(NSNumber *a, NSNumber *b) {
		return [a compare:b];
	};
	
	STAssertEqualObjects(@16, HeapMaximum(maxHeap), @"");
	
	STAssertEqualObjects(@16, HeapExtractMax(maxHeap, comparator), @"");
	STAssertEqualObjects(@14, HeapExtractMax(maxHeap, comparator), @"");
	STAssertEqualObjects(@10, HeapExtractMax(maxHeap, comparator), @"");
	STAssertEqualObjects(@9, HeapExtractMax(maxHeap, comparator), @"");
	STAssertEqualObjects(@8, HeapExtractMax(maxHeap, comparator), @"");
	STAssertEqualObjects(@7, HeapExtractMax(maxHeap, comparator), @"");
	STAssertEqualObjects(@4, HeapExtractMax(maxHeap, comparator), @"");
	STAssertEqualObjects(@3, HeapExtractMax(maxHeap, comparator), @"");
	STAssertEqualObjects(@2, HeapExtractMax(maxHeap, comparator), @"");
	STAssertEqualObjects(@1, HeapExtractMax(maxHeap, comparator), @"");
}

- (void)testHeapIncreaseKey
{
	NSMutableArray *maxHeap = AKNumberArrayInBetween(5,1);
	NSMutableArray *expected = AKNumberArrayInBetween(5,1);
	NSComparator comparator = ^(NSNumber *a, NSNumber *b) {
		return [a compare:b];
	};
	
	HeapIncreaseKey(maxHeap, 0, @6, comparator);
	expected[0] = @6;
	STAssertEqualObjects(maxHeap, expected, @"");
	
	HeapIncreaseKey(maxHeap, 4, @7, comparator);
	STAssertTrue(IsMaxHeap(maxHeap, comparator), @"");
	
	HeapIncreaseKey(maxHeap, 4, @8, comparator);
	STAssertTrue(IsMaxHeap(maxHeap, comparator), @"");
	
	HeapIncreaseKey(maxHeap, 4, @9, comparator);
	STAssertTrue(IsMaxHeap(maxHeap, comparator), @"");
	
	HeapIncreaseKey(maxHeap, 4, @10, comparator);
	STAssertTrue(IsMaxHeap(maxHeap, comparator), @"");
	
	HeapIncreaseKey(maxHeap, 4, @11, comparator);
	STAssertTrue(IsMaxHeap(maxHeap, comparator), @"");
	
	HeapIncreaseKey(maxHeap, 4, @12, comparator);
	STAssertTrue(IsMaxHeap(maxHeap, comparator), @"");
}

@end
