//
//  LinesViewController.m
//  testApp
//
//  Created by Amit Agarwal on 3/3/16.
//  Copyright © 2016 Amit Agarwal. All rights reserved.
//

#import "LinesViewController.h"
#import "DrawView.h"

@interface LinesViewController ()

@end

@implementation LinesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Line Drawing";
    self.view = [DrawView new];
    self.view.backgroundColor = [UIColor orangeColor];
}

@end
