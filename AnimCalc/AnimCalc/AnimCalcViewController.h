//
//  AnimCalcViewController.h
//  AnimCalc
//
//  Created by Clovis Sangrail on 2012/09/22.
//  Copyright (c) 2012年 Systems Power. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimCalcViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *calculationResultLabel;

- (IBAction)numericButtonPressed:(id)sender;
- (void)updateResultLabel;
- (IBAction)clearButtonPressed;
- (IBAction)equalButtonPressed;
- (IBAction)operatorButtonPressed:(id)sender;

@end
