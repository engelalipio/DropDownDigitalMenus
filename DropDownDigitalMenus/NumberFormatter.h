//
//  HPCNumberFormatter.h
//  Created by Engel Alipio
//  Copyright Agile Mobile Solutons L.L.C All rights reserved.
//

#import "Formatter.h"

@interface NumberFormatter : Formatter

@property (nonatomic, assign) NSInteger decimalDigitsCount;
@property (nonatomic, assign) NSInteger multiplier;

+ (NumberFormatter *)currencyFormatterWithDecimalDigitsCount:(NSInteger)digitsCount;
+ (NumberFormatter *)percentFormatterWithDecimalDigitsCount:(NSInteger)digitsCount;

@end
