//
//  ViewController.h
//  Fraction_Calculator
//
//  Created by yangde on 13-7-1.
//  Copyright (c) 2013年 yangde. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calculator.h"
@interface ViewController : UIViewController
@property (strong,nonatomic) IBOutlet UILabel *display;

-(void) processDigit:(int) digit;
-(void) processOp:(char) theOp;
-(void) storeFracPart;
-(void) storeOper:(id)obj;

-(IBAction) clickDigit:(UIButton *)sender;

-(IBAction) clickPlus;
-(IBAction) clickMinus;
-(IBAction) clickMultiply;
-(IBAction) clickDivide;

-(IBAction) clickOver;
-(IBAction) clickEquals;
-(IBAction) clickClear;
-(IBAction) clickConvert;
@end
