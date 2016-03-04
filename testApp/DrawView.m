//
//  DrawView.m
//  TouchTracker
//
//  Created by Amit Agarwal on 3/3/16.
//  Copyright © 2016 Amit Agarwal. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

-(void)drawRect:(CGRect)rect {
    [[UIColor blackColor] setStroke];
    for (Line* line in self.finishedLines) {
        [self drawLine:line];
    }
    
    for (Line* currentLine in self.currentLines.allValues ) {
        [[UIColor redColor]setStroke];
        [self drawLine:currentLine];
    }
    
    if (_selectedLine) {
        [[UIColor greenColor]setStroke];
        [self drawLine:_selectedLine];
    }
    
}

-(void)drawLine:(Line*)line {
    UIBezierPath* path = [[UIBezierPath alloc] init];
    path.lineWidth = 10;
    path.lineCapStyle = kCGLineCapRound;
    [path moveToPoint:line.begin];
    [path addLineToPoint:line.end];
    
    [path stroke];
}

- (Line *)lineAtPoint:(CGPoint)point {
    // Find a line close to point
    for (Line *line in self.finishedLines) {
        CGPoint begin = line.begin;
        CGPoint end = line.end;
        // Check a few points on the line
        for (CGFloat t = 0; t < 1.0; t += 0.05) {
            CGFloat x = begin.x + ((end.x - begin.x) * t);
            CGFloat y = begin.y + ((end.y - begin.y) * t);
            // If the tapped point is within 20 points, let's return this line
            if (hypot(x - point.x, y - point.y) < 20.0) {
                return line;
            }
        }
    }
    // If nothing is close enough to the tapped point, then we did not select a line
    return nil;
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.currentLines removeAllObjects];
    [self setNeedsDisplay];
}

-(instancetype)init{
    self = [super init];
    if (self) {
        _currentLines = [[NSMutableDictionary alloc]init];
        _finishedLines = [[NSMutableArray alloc]init];
        
//        UITapGestureRecognizer* doubleTapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTap:)];
//        doubleTapRecognizer.numberOfTapsRequired = 2;
//        doubleTapRecognizer.delaysTouchesBegan = YES;
//        [self addGestureRecognizer:doubleTapRecognizer];
//        
//        UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
//        tapRecognizer.delaysTouchesBegan = YES;
//        [tapRecognizer requireGestureRecognizerToFail:doubleTapRecognizer];
//        
//        UILongPressGestureRecognizer* longPressRecognizer = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPress:)];
//        [self addGestureRecognizer:longPressRecognizer];
//        [self addGestureRecognizer:tapRecognizer];
//        
//        _moveRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(moveLine:)];
//        _moveRecognizer.delegate = self;
//        _moveRecognizer.cancelsTouchesInView = NO;
//        [self addGestureRecognizer:_moveRecognizer];
    }
    return  self;
}

//-(void)moveLine:(UIPanGestureRecognizer*)panGesture {
//    Line* line = self.selectedLine;
//    if (line) {
//        if (panGesture.state == UIGestureRecognizerStateChanged) {
//            CGPoint translation = [panGesture locationInView:self];
//            CGPoint begin = line.begin;
//            begin.x += translation.x;
//            begin.y += translation.y;
//            line.begin = begin;
//            
//            CGPoint end = line.end;
//            end.x += translation.x;
//            end.y += translation.y;
//            line.end = end;
//            [panGesture setTranslation:CGPointZero inView:self];
//            [self setNeedsDisplay];
//        }
//    }else {
//        return;
//    }
//    
//}
//
//-(BOOL)canBecomeFirstResponder{
//    return YES;
//}

-(void)deleteLine:(id)sender{
    if (self.selectedLine) {
        [self.finishedLines removeObject:self.selectedLine];
        [self setNeedsDisplay];
    }
}
//-(void)longPress:(UILongPressGestureRecognizer*)longPressRecognizer {
//    if (longPressRecognizer.state == UIGestureRecognizerStateBegan) {
//        CGPoint location =  [longPressRecognizer locationInView:self];
//        self.selectedLine = [self lineAtPoint:location];
//        if (self.selectedLine) {
//            [self.currentLines removeAllObjects];
//        }
//    } else if(longPressRecognizer.state == UIGestureRecognizerStateEnded) {
//        self.selectedLine = nil;
//    }
//    [self setNeedsDisplay];
//    
//}
//-(void)tap:(UIGestureRecognizer*)gestureRecognizer {
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//    CGPoint location = [gestureRecognizer locationInView:self];
//    self.selectedLine = [self lineAtPoint:location];
//    UIMenuController* menucontroller = [UIMenuController sharedMenuController];
//    if (self.selectedLine) {
//        [self becomeFirstResponder];
//        UIMenuItem* deleteMenuItem = [[UIMenuItem alloc]initWithTitle:@"Delete" action:@selector(deleteLine:)];
//        menucontroller.menuItems = @[deleteMenuItem];
//        [menucontroller setTargetRect:CGRectMake(location.x, location.y, 2, 2) inView:self];
//        [menucontroller setMenuVisible:YES animated:YES];
//    } else{
//        [menucontroller setMenuVisible:NO animated:YES];
//    }
//
//    [self setNeedsDisplay];
//}
//-(void)doubleTap:(UITapGestureRecognizer*)gestureRecognizer {
//    NSLog(@"double tapp");
//    [self.currentLines removeAllObjects];
//    [self.finishedLines removeAllObjects];
//    
//    [self setNeedsDisplay];
//}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    for (UITouch* touch in touches) {
        CGPoint location = [touch locationInView:self];
        Line* newLine = [[Line alloc]initWithBegin:location end:location];
        NSValue *key = [NSValue valueWithNonretainedObject:touch];
        self.currentLines[key] = newLine;
    }
    
    [self setNeedsDisplay];
}
//-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    if (gestureRecognizer == _moveRecognizer) {
//        return YES;
//    }
//    return NO;
//}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch* touch in touches) {
        CGPoint location = [touch locationInView:self];
        NSValue *key = [NSValue valueWithNonretainedObject:touch];
        Line* line = self.currentLines[key];
        line.end = location;
    }
    
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    for (UITouch* touch in touches) {
        CGPoint location = [touch locationInView:self];
        NSValue* key = [NSValue valueWithNonretainedObject:touch];
        Line* line = self.currentLines[key];
        line.end = location;
        
        [self.finishedLines addObject:line];
        [self.currentLines removeObjectForKey:key];
        
    }
    
    [self setNeedsDisplay];
}
@end
