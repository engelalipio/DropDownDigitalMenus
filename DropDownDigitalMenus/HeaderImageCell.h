//
//  HeaderImageCell.h
//  iLush
//
//  Created by Engel Alipio on 10/17/14.
//  Copyright (c) 2014 Lush. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "UIImage+ImageEffects.h"

@interface HeaderImageCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIButton *btnSendToKitchen;
@property (strong, nonatomic) IBOutlet UILabel  *lblTotal;

+ (id)instanceFromNibWithName:(NSString *)nibName;

+ (id)instanceFromNib;
- (IBAction)actionSendToKitchen:(UIButton *)sender;

@end
