//
//  Created by Engel Alipio.
//  Copyright Agile Mobile Solutions L.L.C. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Formatter : NSObject

@property (nonatomic, strong) NSString	*prefix;
@property (nonatomic, strong) NSString	*sufix;

- (NSString *)plainValueString:(NSString *)string;

- (NSString *)stringFromValue:(id)value;

- (NSString *)maskedStringForTextField:(UITextField *)textField
                             withRange:(NSRange)range
                     replacementString:(NSString *)replacementString;

@end

