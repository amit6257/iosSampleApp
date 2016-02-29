//
//  CoreGraphicsViewController.m
//  testApp
//
//  Created by Amit Agarwal on 2/28/16.
//  Copyright © 2016 Amit Agarwal. All rights reserved.
//

#import "CoreGraphicsViewController.h"

@implementation CoreGraphicsViewController
-(void) viewDidLoad {
    [self setTitle:@"Core Graphics"];
    self.view = [[UIView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor magentaColor];
    
}
@end
