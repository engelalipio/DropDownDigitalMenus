//
//  CBFormatter.m
//  ChaseBook
//
//  Created by Mariano Donati on 5/20/13.
//  Copyright (c) 2013 Luciano Castro. All rights reserved.
//

#import "Formatter.h"

@implementation Formatter

- (id)init
{
    self = [super init];
    
    self.prefix = @"";
    self.sufix	= @"";
    
    return self;
}

- (NSString *)plainValueString:(NSString *)string
{
    NSString *result = @"";
    
    if (string.length > 0){
        result = string;
    }
    
    return result;
}

- (NSString *)stringFromValue:(id)value
{
    NSString *result = @"";
    
    if (value != [NSNull null] && value != nil){
        result = [NSString stringWithFormat:@"%@",value];
    }
    return result;
}

- (NSString *)maskedStringForTextField:(UITextField *)textField withRange:(NSRange)range replacementString:(NSString *)replacementString
{
    return [self keyStrokesForTextField:textField withRange:range replacementString:replacementString];
}

- (NSString *)keyStrokesForTextField:(UITextField *)textField withRange:(NSRange)range replacementString:(NSString *)string
{
    // For storing the keystrokes as user types in
    NSMutableString *textFieldValue = [textField.text mutableCopy];
    
    // Check whether an insert or delete is taking place
    if (string.length > 0) {// Insert
        [textFieldValue insertString:string atIndex:range.location];
    } else {			// Delete
        // If the formatter has been setup with a prefix then we should avoid letting the user to remove any part of it
        if ((self.prefix != nil) && (range.location < self.prefix.length)) {
            range.location	= self.prefix.length;
            range.length	-= self.prefix.length;
        }
        
        // If the formatter has been setup with a suffix then we should ignore it when deleting the string.
        // We should delete the chars next to it.
        if ((self.sufix != nil) && (range.location + range.length == textField.text.length)) {
            if (range.location == 0) {
                range.length -= self.sufix.length;
            } else {
                range.location -= self.sufix.length;
            }
        }
        
        // The range has been adjusted according to both prefix and suffix, it is safe to delete now
        [textFieldValue deleteCharactersInRange:range];
    }
    
    return textFieldValue;
}

@end
