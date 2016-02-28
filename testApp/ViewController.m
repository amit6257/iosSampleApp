//
//  ViewController.m
//  testApp
//
//  Created by Amit Agarwal on 2/27/16.
//  Copyright © 2016 Amit Agarwal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view = [[UIView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)loadView {
    NSLog(@"loadView called");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
