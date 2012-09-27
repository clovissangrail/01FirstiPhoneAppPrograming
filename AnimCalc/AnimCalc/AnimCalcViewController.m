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

@implementation AnimCalcViewController{
    double calculationValue;
    double previousCalculationValue;
    NSString *operatorString;
    BOOL operatorApplied;
}

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
    [self animateButton:button];
    NSString *numericChar = button.titleLabel.text;
    int number = [numericChar intValue];
    
    if ([operatorString isEqualToString:@"="]) {
        calculationValue = 0;
        operatorString = nil;
    }
    
    
    calculationValue = calculationValue * 10 + number;
    operatorApplied = NO;
    [self updateResultLabel];
    
    
    
    
    //_calculationResultLabel.text = numericChar;




}
- (void)viewDidUnload {
    [self setCalculationResultLabel:nil];
    [self setCalculationResultLabel:nil];
    [super viewDidUnload];
}

-(void)updateResultLabel{
    NSNumber *number = [NSNumber numberWithDouble:calculationValue];
    NSString *valueString = [number stringValue];
    _calculationResultLabel.text = valueString;
}

-(IBAction)equalButtonPressed{
    if(operatorApplied){
        return;
    }
    if(operatorString == nil){
        previousCalculationValue = calculationValue;
    }else if ([operatorString isEqualToString:@"+"]){
        calculationValue = previousCalculationValue + calculationValue;
    }else if ([operatorString isEqualToString:@"-"]){
        calculationValue = previousCalculationValue - calculationValue;
    }else if ([operatorString isEqualToString:@"*"]){
        calculationValue = previousCalculationValue * calculationValue;
    }else if ([operatorString isEqualToString:@"/"]){
        calculationValue = previousCalculationValue / calculationValue;
    }
    operatorApplied = YES;
    previousCalculationValue = calculationValue;
    operatorString = @"=";
    [self updateResultLabel];


    
}

-(IBAction)operatorButtonPressed:(id)sender{
    [self equalButtonPressed];
    if(operatorApplied){
        calculationValue = 0;
    }
    
    UIButton *button = (UIButton*)sender;
    operatorString = button.titleLabel.text;
}

-(IBAction)clearButtonPressed{
    calculationValue = 0;
    previousCalculationValue =0;
    operatorString = nil;
    operatorApplied = NO;
    [self updateResultLabel];
}

- (void)animateButton:(UIButton*)button{
    [UIView animateWithDuration:0.3
                          delay:0
                        options:(UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveEaseOut)
                     animations:^{
                         button.transform = CGAffineTransformMakeScale(1.2, 1.2);
                     }
                     completion:^(BOOL complete){
                         [UIView
                          animateWithDuration:0.1
                                               delay:0
                                             options:(UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveEaseIn)
                                          animations:^{
                                              button.transform = CGAffineTransformIdentity;
                                          }
                     completion:^(BOOL complete){}];
                     }];
}

@end
