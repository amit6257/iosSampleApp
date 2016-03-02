//
//  TabBarViewController.m
//  testApp
//
//  Created by Amit Agarwal on 3/1/16.
//  Copyright © 2016 Amit Agarwal. All rights reserved.
//

#import "TabBarViewController.h"
#import "ButtonsViewController.h"
#import "TextFieldViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.viewControllers = @[[[ButtonsViewController alloc] init], [[TextFieldViewController alloc] init]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
