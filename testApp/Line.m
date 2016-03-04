//
//  Line.m
//  TouchTracker
//
//  Created by Amit Agarwal on 3/3/16.
//  Copyright © 2016 Amit Agarwal. All rights reserved.
//

#import "Line.h"

@implementation Line
-(instancetype)initWithBegin:(CGPoint)begin end:(CGPoint)end {
    self = [super init];
    if (self) {
        _begin = begin;
        _end = end;
    }
    
    return self;
}
@end
