//
//  DrawView.h
//  TouchTracker
//
//  Created by Amit Agarwal on 3/3/16.
//  Copyright © 2016 Amit Agarwal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Line.h"

@interface DrawView : UIView <UIGestureRecognizerDelegate>
@property NSMutableDictionary* currentLines;
@property NSMutableArray* finishedLines;
@property UIPanGestureRecognizer* moveRecognizer;
@property(weak) Line* selectedLine;
@end
