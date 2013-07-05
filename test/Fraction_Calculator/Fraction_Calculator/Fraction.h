//
//  Fraction.h
//  Fraction_Calculator
//
//  Created by yangde on 13-7-1.
//  Copyright (c) 2013年 yangde. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject

@property int numerator,denominator;

-(void) print;
-(void) setTo:(int) n over:(int) d;
-(Fraction *) add:(Fraction *) f;
-(Fraction *) subtract:(Fraction *) f;
-(Fraction *) multiply:(Fraction *) f;
-(Fraction *) divide:(Fraction *) f;
-(void) reduce;
-(double) convertToNum;
-(NSString *) convertToString;
@end
