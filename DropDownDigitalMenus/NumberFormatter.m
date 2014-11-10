//
//  HPCNumberFormatter.m
//  Created by Engel Alipio
//  Copyright Agile Mobile Solutions L.L.C All rights reserved.
//

#import "NumberFormatter.h"
#import "Formatter_Protected.h"
#import "Constants.h"

@implementation NumberFormatter

+ (NumberFormatter *)currencyFormatterWithDecimalDigitsCount:(NSInteger)digitsCount
{
    NumberFormatter *formatter = [NumberFormatter new];
    
    formatter.prefix				= @"$";
    formatter.decimalDigitsCount	= digitsCount;
    return formatter;
}

+ (NumberFormatter *)percentFormatterWithDecimalDigitsCount:(NSInteger)digitsCount
{
    NumberFormatter *formatter = [NumberFormatter new];
    
    formatter.sufix = @"%";
    formatter.decimalDigitsCount = digitsCount;
    return formatter;
}

- (id)init
{
    self = [super init];
    
    self.multiplier = 1;
    
    return self;
}

- (void)setDecimalDigitsCount:(NSInteger)decimalDigitsCount
{
    _decimalDigitsCount = decimalDigitsCount;
    self.multiplier		= -1 * decimalDigitsCount;
}

- (NSString *)plainValueString:(NSString *)string
{
    return [self plainValueString:string removesDecimalPoint:NO];
}

- (NSString *)plainValueString:(NSString *)string removesDecimalPoint:(BOOL)removesDecimalPoint
{
    NSString				*allDigits		= kAllDigits;
    NSMutableCharacterSet	*charsToKeep	= [NSMutableCharacterSet characterSetWithCharactersInString:allDigits];
    
    if (removesDecimalPoint == NO) {
        [charsToKeep addCharactersInString:@"."];
    }
    
    NSString *stringWithoutSymbols = [[string componentsSeparatedByCharactersInSet:[charsToKeep invertedSet]] componentsJoinedByString:@""];
    
    if (stringWithoutSymbols.length == 0) {
        stringWithoutSymbols = @"0";
    }
    
    return stringWithoutSymbols;
}

- (NSString *)stringFromValue:(id)number
{
    NSString *valueString = [NSString stringWithFormat:@"%@", number];
    
    NSString *stringWithoutSymbols = [self plainValueString:valueString removesDecimalPoint:NO];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    
    formatter.numberStyle			= NSNumberFormatterDecimalStyle;
    formatter.maximumFractionDigits = self.decimalDigitsCount;
    
    number = [NSDecimalNumber decimalNumberWithString:stringWithoutSymbols];
    
    return [NSString stringWithFormat:@"%@%@%@", self.prefix, [formatter stringFromNumber:number], self.sufix];
}

- (NSString *)maskedStringForTextField_old:(UITextField *)textField withRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *keyStrokes = [self keyStrokesForTextField:textField withRange:range replacementString:string];
    
    keyStrokes = [self plainValueString:keyStrokes removesDecimalPoint:YES];
    
    NSDecimalNumber *decimal = nil;
    
    if ([keyStrokes isEqualToString:@""] == NO) {
        decimal = [[NSDecimalNumber decimalNumberWithString:keyStrokes] decimalNumberByMultiplyingByPowerOf10:self.multiplier];
    } else {
        decimal = [NSDecimalNumber zero];
    }
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle			= NSNumberFormatterDecimalStyle;
    formatter.maximumFractionDigits = self.decimalDigitsCount;
    
    return [NSString stringWithFormat:@"%@%@%@", self.prefix, [formatter stringFromNumber:decimal], self.sufix];
}

- (NSString *)maskedStringForTextField:(UITextField *)textField withRange:(NSRange)range replacementString:(NSString *)replacementString
{
    NSString *keystrokes = [self keyStrokesForTextField:textField withRange:range replacementString:replacementString];
    
    return [self stringForValue:keystrokes];
}

- (NSString *)stringForValue:(NSString *)valueString
{
    NSString *string = [self plainValueString:valueString removesDecimalPoint:YES];
    
    // It is easier to work with the reversed string of the value
    NSMutableString *mutableString = [NSMutableString stringWithString:[self reverseString:string]];
    
    // Remove leading 0s
    for (int i = mutableString.length - 1; i >= self.decimalDigitsCount + 1; i--) {
        if ([[mutableString substringWithRange:NSMakeRange(i, 1)] isEqualToString:@"0"] == NO) {
            break;
        }
        
        [mutableString deleteCharactersInRange:NSMakeRange(i, 1)];
    }
    
    // Insert decimal separator. Pad the decimal part if needed
    NSString *decimalSeparator = [[NSLocale currentLocale] objectForKey:NSLocaleDecimalSeparator];
    
    if (self.decimalDigitsCount > 0) {
        if (self.decimalDigitsCount > mutableString.length) {
            for (int i = mutableString.length; i < self.decimalDigitsCount; i++) {
                [mutableString insertString:@"0" atIndex:i];
            }
        }
        
        [mutableString insertString:decimalSeparator atIndex:self.decimalDigitsCount];
    }
    
    // Add grouping separator
    NSString	*groupingSeparator	= [[NSLocale currentLocale] objectForKey:NSLocaleGroupingSeparator];
    NSInteger	groupedDigitsCount	= 0;
    NSInteger	startIndex			= (self.decimalDigitsCount > 0) ? self.decimalDigitsCount + 1 : 0;
    
    for (int i = startIndex; i < mutableString.length; i++) {
        if ((groupedDigitsCount != 0) && ((groupedDigitsCount % 3) == 0)) {
            [mutableString insertString:groupingSeparator atIndex:i];
            groupedDigitsCount = 0;
        } else {
            groupedDigitsCount += 1;
        }
    }
    
    // Avoid returning an empty string
    if (mutableString.length == 0) {
        [mutableString appendString:@"0"];
    }
    
    // Add a leading 0 if there's no integer part
    if ([mutableString rangeOfString:decimalSeparator].location == mutableString.length - 1) {
        [mutableString appendString:@"0"];
    }
    
    return [NSString stringWithFormat:@"%@%@%@", self.prefix, [self reverseString:mutableString], self.sufix];
}

- (NSString *)reverseString:(NSString *)string
{
    NSMutableString *reversedStr;
    int				len = [string length];
    
    // Auto released string
    reversedStr = [NSMutableString stringWithCapacity:len];
    
    // Probably woefully inefficient...
    while (len > 0) {
        [reversedStr appendString:
         [NSString stringWithFormat:@"%C", [string characterAtIndex:--len]]];
    }
    
    return reversedStr;
}

@end
