//
//  HeaderImageCell.m
//  iLush
//
//  Created by Engel Alipio on 10/17/14.
//  Copyright (c) 2014 Lush. All rights reserved.
//

#import "HeaderImageCell.h"

@implementation HeaderImageCell

+ (id)instanceFromNib
{
    NSString *className = @"HeaderImageCell";
    
    return [self instanceFromNibWithName:className];
}

- (IBAction)actionSendToKitchen:(UIButton *)sender {
}

+ (id)instanceFromNibWithName:(NSString *)nibName
{
    return [[[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil] objectAtIndex:0];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        CGSize size = self.contentView.frame.size;
        
        self.btnSendToKitchen = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.btnSendToKitchen setFrame:CGRectMake(86.0f, 65.0f, 149.0f, 30.0f)];
        [self.btnSendToKitchen setBackgroundColor:[UIColor colorWithHexString:@"800000"]];
        
        [self.btnSendToKitchen setTitleColor:[UIColor colorWithHexString:@"804000"]
                                    forState:UIControlStateNormal];
        
        [self.contentView addSubview:self.btnSendToKitchen];
        
        self.lblTotal = [[UILabel alloc] initWithFrame:CGRectMake(150.0f, 131.0f, 58.0f, 21.0f)];
        [self.lblTotal setText:@"$"];
        [self.lblTotal setTextColor:[UIColor blackColor]];
      
        [self.contentView addSubview:self.lblTotal];
        
        [self.contentView setBackgroundColor:[UIColor colorWithHexString:@"FFCC66"]];
        
        [self.contentView setHidden:NO];
        
        
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    
    frame.size	= size;
    self.frame	= CGRectIntegral(frame);
}

@end
