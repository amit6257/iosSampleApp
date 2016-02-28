//
//  ButtonsViewController.m
//  testApp
//
//  Created by Amit Agarwal on 2/28/16.
//  Copyright © 2016 Amit Agarwal. All rights reserved.
//

#import "ButtonsViewController.h"

@implementation ButtonsViewController

- (void) viewDidLoad {
    self.view = [[UIView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    UIButton* button = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
    [button setTitle:@"button" forState:UIControlStateNormal];
    
    [self.view addSubview:button];
}

@end
