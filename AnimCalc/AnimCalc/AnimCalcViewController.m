//
//  AnimCalcViewController.m
//  AnimCalc
//
//  Created by Clovis Sangrail on 2012/09/22.
//  Copyright (c) 2012年 Systems Power. All rights reserved.
//

#import "AnimCalcViewController.h"

@interface AnimCalcViewController ()

@end

@implementation AnimCalcViewController

@synthesize calculationResultLabel = _calculationResultLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)numericButtonPressed:(id)sender {
    UIButton *button = (UIButton*)sender;
    NSString *numericChar = button.titleLabel.text;
    _calculationResultLabel.text = numericChar;

    //calculationResultLabel.text = numericChar;
}
- (void)viewDidUnload {
    [self setCalculationResultLabel:nil];
    [self setCalculationResultLabel:nil];
    [super viewDidUnload];
}
@end
