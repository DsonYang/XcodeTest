//
//  Calculator.m
//  Fraction_Calculator
//
//  Created by yangde on 13-7-1.
//  Copyright (c) 2013年 yangde. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator
@synthesize operandArr,accumulator;

-(id) init
{
    self =[super init];
    if(self){
        operandArr=[NSMutableArray array];
        accumulator=[[Fraction alloc]init];
    }
    
    return self;
}

-(void) clear
{
    accumulator.numerator=0;
    accumulator.denominator=0;
    operandArr=[NSMutableArray array];
    accumulator=[[Fraction alloc]init];
}

-(Fraction *) performOperation
{
    Fraction *result=(Fraction *) [operandArr objectAtIndex:0];
    for (int i=1; i<operandArr.count; i+=2) {
//        char p[1];
//        NSLog(@"%s",p);
        char op=[(NSString *)[operandArr objectAtIndex:i] UTF8String][1];
        Fraction *frac=(Fraction *)[operandArr objectAtIndex:i+1];
        switch (op) {
            case  '+':
                result = [result add:frac];
                break;
            case '-':
                result =[result subtract:frac];
                break;
            case '*':
                result=[result multiply:frac];
                break;
            case '/':
                result=[result divide:frac];
                break;
                
            default:
                break;
            }
    }
    
    accumulator.numerator=result.numerator;
    accumulator.denominator=result.denominator;
    return accumulator;
}

@end
