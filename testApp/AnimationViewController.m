//
//  AnimationViewController.m
//  testApp
//
//  Created by Amit Agarwal on 3/1/16.
//  Copyright © 2016 Amit Agarwal. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()
@property (weak, nonatomic) IBOutlet UILabel *alphaLabel;
@property (weak, nonatomic) IBOutlet UILabel *leftToRightLabel;
- (IBAction)alphaButton:(id)sender;

- (IBAction)leftToRightButton:(id)sender;

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor magentaColor];
    self.alphaLabel.backgroundColor = [UIColor greenColor];
    self.leftToRightLabel.backgroundColor = [UIColor blueColor];
}

-(void)animateLabelAlpha {
}
-(void)moveLabelLeftToRight {
    
}

- (IBAction)alphaButton:(id)sender {
    self.alphaLabel.alpha = 0;
    [UIView animateWithDuration:3.0 animations:^{
        self.alphaLabel.alpha = 1;
    }];
}

- (IBAction)leftToRightButton:(id)sender {
    static int direction = 1;
    if (direction == 1) {
        direction = -1;
        CGRect frame = self.leftToRightLabel.frame;
        frame.origin.x = frame.origin.x + 100;
        [UIView animateWithDuration:2 animations:^{
            self.leftToRightLabel.frame = frame;
        } completion:^(BOOL finished){
            self.leftToRightLabel.backgroundColor = [UIColor greenColor];
            
        }];
    } else {
        direction = 1;
        CGRect frame = self.leftToRightLabel.frame;
        frame.origin.x = frame.origin.x - 100;
        [UIView animateWithDuration:2 animations:^{
            self.leftToRightLabel.frame = frame;
        } completion:^(BOOL finished){
            self.leftToRightLabel.backgroundColor = [UIColor redColor];
        }];
    }
}
@end
