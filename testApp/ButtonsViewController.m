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
    [self setTitle:@"ButtonsViewController"];
    self.view = [[UIView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //add button
    [self.view addSubview:[self getButton]];
    
    //add button with dialog
    UIButton* buttonWithAction = [self getButtonForAction];
    [buttonWithAction addTarget:self action:@selector(showDialog:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonWithAction];
}

- (UIButton*)getButton {
    // cant use origin as 0,0???why???
    UIButton* button = [[UIButton alloc]initWithFrame:CGRectMake(10, 100, 100, 30)];
    [button setTitle:@"button" forState:UIControlStateNormal];
    return button;
}


- (UIButton*)getButtonForAction {
    // cant use origin as 0,0???why???
    UIButton* button = [[UIButton alloc]initWithFrame:CGRectMake(10, 150, 100, 30)];
    [button setTitle:@"press me" forState:UIControlStateNormal];
    return button;
}

-(void)showDialog:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert title" message:@"Alert message" delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    
    [alert show];
}
@end
