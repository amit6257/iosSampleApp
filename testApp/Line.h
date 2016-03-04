//
//  Line.h
//  TouchTracker
//
//  Created by Amit Agarwal on 3/3/16.
//  Copyright © 2016 Amit Agarwal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Line : NSObject
@property CGPoint begin;
@property CGPoint end;
-(instancetype)initWithBegin:(CGPoint)begin end:(CGPoint)end;
@end
