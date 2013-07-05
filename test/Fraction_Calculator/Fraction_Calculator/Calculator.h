//
//  Calculator.h
//  Fraction_Calculator
//
//  Created by yangde on 13-7-1.
//  Copyright (c) 2013年 yangde. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"
@interface Calculator : NSObject
@property (strong,nonatomic) Fraction *accumulator;
@property (strong,nonatomic) NSMutableArray *operandArr;
-(Fraction *) performOperation;
-(void) clear;
@end
