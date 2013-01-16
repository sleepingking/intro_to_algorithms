//
//  HeapSort.h
//  Introduction to Algorithm
//
//  Created by Ben Chen on 1/15/13.
//  Copyright (c) 2013 Sleeping Heroes. All rights reserved.
//

#import <Foundation/Foundation.h>

void MaxHeapify(NSMutableArray *heap, NSUInteger i, NSComparator comparator);

void BuildMaxHeap(NSMutableArray *heap, NSComparator comparator);

void HeapSort(NSMutableArray *heap, NSComparator comparator);