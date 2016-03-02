//
//  TextFieldViewController.m
//  testApp
//
//  Created by Amit Agarwal on 3/1/16.
//  Copyright © 2016 Amit Agarwal. All rights reserved.
//

#import "TextFieldViewController.h"

@interface TextFieldViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputCelsius;
@property (weak, nonatomic) IBOutlet UILabel *degreeFahLabel;

@end

@implementation TextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"TextField";
    [self.inputCelsius setDelegate:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//uitextfield delegate methods

-(BOOL)checkFormat:(NSString*) text {
    NSNumberFormatter* formatter = [self getNumberFormatter];
    NSNumber* num = [formatter numberFromString:text];

    if (num) {
        NSLog(@"The input is = %@", num);
    } else {
        NSLog(@"Incorrect input for number");
    }
    
    return num != nil;
}

-(NSNumberFormatter*) getNumberFormatter {
    static NSNumberFormatter* formatter = nil;
    if (!formatter) {
        formatter = [NSNumberFormatter new];
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        formatter.minimumFractionDigits = 0;
        formatter.maximumFractionDigits = 1;
    }
    
    return formatter;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"textFieldShouldReturn");
    if ([self checkFormat:textField.text]) {
        self.degreeFahLabel.text = [self getFahValue:textField.text];
    } else {
        self.degreeFahLabel.text = @"?? incorrect input ??";
    }
    
    return YES;
}// called when 'return' key pressed. return NO to ignore.

-(NSString*) getFahValue:(NSString*) input{
    NSNumberFormatter* formatter = [self getNumberFormatter];
    NSNumber* num = [formatter numberFromString:input];

    double fahVal = num.doubleValue * (9.0/5.0) + 32;
    return @(fahVal).stringValue;
}

@end
