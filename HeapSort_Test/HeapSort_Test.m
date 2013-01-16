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
	NSInteger input[] = {4,1,3,2,16,9,10,14,8,7};
	NSMutableArray *inputArray = ArrayWithIntArray(input, sizeof(input)/sizeof(NSInteger));
	
	NSInteger expected[] = {16,14,10,8,7,9,3,2,4,1};
	NSMutableArray *expectedArray = ArrayWithIntArray(expected, sizeof(expected)/sizeof(NSInteger));
	
	BuildMaxHeap(inputArray, ^(NSNumber *a, NSNumber *b) {
		return [a compare:b];
	});
	
	STAssertEqualObjects(inputArray, expectedArray, @"BuildMaxHeap doesn't work");
}

- (void)testHeapSort
{
	NSInteger input[] = {4,1,3,2,16,9,10,14,8,7};
	NSMutableArray *inputArray = ArrayWithIntArray(input, sizeof(input)/sizeof(NSInteger));
	
	NSInteger expected[] = {1,2,3,4,7,8,9,10,14,16};
	NSMutableArray *expectedArray = ArrayWithIntArray(expected, sizeof(expected)/sizeof(NSInteger));
	
	HeapSort(inputArray, ^(NSNumber *a, NSNumber *b) {
		return [a compare:b];
	});
	
	STAssertEqualObjects(inputArray, expectedArray, @"BuildMaxHeap doesn't work");
}

@end
