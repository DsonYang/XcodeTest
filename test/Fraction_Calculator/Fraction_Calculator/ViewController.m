//
//  ViewController.m
//  Fraction_Calculator
//
//  Created by yangde on 13-7-1.
//  Copyright (c) 2013年 yangde. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
//    char op;
    int currentNumber;
    BOOL firstOperand,isNumerator,isError,isNegative,isOp;
    Calculator *myCalculator;
    Fraction *frac;
    NSMutableString *displayString;
}

@synthesize display;


- (void)viewDidLoad
{
    firstOperand=YES;
    isNumerator=YES;
    isError=NO;
    isNegative=NO;
    isOp=NO;
    displayString=[NSMutableString stringWithCapacity:40];
    myCalculator=[[Calculator alloc] init];
    frac=[[Fraction alloc] init];
}

-(void) processDigit:(int)digit{
    if (isNegative) {
        currentNumber=-(currentNumber*10+digit);
    } else {
        currentNumber=currentNumber*10+digit;
    }
    
    [displayString appendString:
    [NSString stringWithFormat:@"%i",digit]];
    display.text=displayString;
    if (!isNumerator&&currentNumber==0) {
        isError=YES;
    }
}

-(IBAction) clickDigit:(UIButton *)sender{
    int digit=sender.tag;
    [self processDigit:digit];
}

-(void) processOp:(char)theOp{
    NSString *opStr;
    
    switch (theOp) {
        case '+':
            opStr=@" + ";
            break;
        case '-':
            opStr=@" - ";
            break;
        case '*':
            opStr=@" * ";
            break;
        case '/':
            opStr=@" ÷ ";
            break;
        default:
            break;
    }
    if (theOp=='-'&&isNumerator&&!isOp) {
        isNegative=YES;
        isOp=YES;
    } else {
        
//        op=theOp;
        [self storeFracPart];
        [self storeOper:frac];
        [self storeOper:opStr];
        firstOperand=NO;
        isNumerator=YES;
        isNegative=NO;
        isOp=NO;
    }
    
    [displayString appendString:opStr];
    display.text=displayString;
}


-(void) storeFracPart{
//    if (firstOperand) {
        if (isNumerator) {
            frac.numerator=currentNumber;
            frac.denominator=1;
        }
        else{
            frac.denominator=currentNumber;
        }
//    } else if(isNumerator){
//        myCalculator.operand2.numerator=currentNumber;
//        myCalculator.operand2.denominator=1;
//    }
//    else{
//        myCalculator.operand2.denominator=currentNumber;
//        firstOperand=YES;
//    }
    currentNumber=0;
}

-(void) storeOper:(id)obj{
    [myCalculator.operandArr addObject:obj];
    frac=[[Fraction alloc] init];
}

-(IBAction)clickOver{
    [self storeFracPart];
    isNumerator=NO;
    isNegative=NO;
    [displayString appendString:@"/"];
    display.text=displayString;
}

-(IBAction)clickPlus{
    [self processOp:'+'];
}
-(IBAction)clickMinus{
    [self processOp:'-'];
}
-(IBAction)clickMultiply{
    [self processOp:'*'];
}
-(IBAction)clickDivide{
    [self processOp:'/'];
}

-(IBAction)clickEquals{
    if (isError) {
        display.text=@"ERROR!";
        currentNumber=0;
        isNumerator=YES;
        firstOperand=YES;
        [displayString setString:@""];
    } else {
        if (firstOperand==NO) {
            [self storeFracPart];
            [self storeOper:frac];
            [myCalculator performOperation];
            
            [displayString appendString:@" = "];
            [displayString appendString:[myCalculator.accumulator convertToString]];
            display.text=displayString;
            currentNumber=0;
            isNumerator=YES;
            firstOperand=YES;
            [displayString setString:@""];
        }
    }
    
}

-(IBAction)clickClear{
    isNumerator=YES;
    firstOperand=YES;
    currentNumber=0;
    [myCalculator clear];
    
    [displayString setString:@""];
    display.text=displayString;
}
-(IBAction)clickConvert{
    
    [displayString setString:[NSString stringWithFormat:@"%f",[myCalculator.accumulator convertToNum]]];
    display.text=displayString;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
