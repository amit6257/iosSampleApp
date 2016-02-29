//
//  UITextViewController.m
//  testApp
//
//  Created by Amit Agarwal on 2/28/16.
//  Copyright © 2016 Amit Agarwal. All rights reserved.
//

#import "UITextViewController.h"

@implementation UITextViewController
-(void) viewDidLoad {
    [self setTitle:@"UITextView"];
    self.view = [[UIView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor greenColor];
    
    //simple UItextview
    UITextView* tview = [[UITextView alloc]initWithFrame:CGRectMake(10, 150, 200, 100)];
    [self.view addSubview:tview];
    
}
@end
