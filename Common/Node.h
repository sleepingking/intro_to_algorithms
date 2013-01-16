//
//  Node.h
//  Introduction to Algorithm
//
//  Created by Ben Chen on 1/15/13.
//  Copyright (c) 2013 Sleeping Heroes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property (strong) Node *left;
@property (strong) Node *right;
@property (strong) id value;

@end
