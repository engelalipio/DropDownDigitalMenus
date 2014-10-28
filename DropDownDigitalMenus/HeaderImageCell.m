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
        
        self.imageEstablishment = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, 160.0)];
        [self.imageEstablishment setHidden:NO];
        [self.imageEstablishment setImage:[UIImage imageNamed:@"Store.jpg"]];
  
        [self.contentView addSubview:self.imageEstablishment];
        
        NSArray *randomIcons = [[NSArray alloc] initWithObjects:[NSString stringWithFormat:@"wine_bottle-%@.png", kImageDimension],
                       [NSString stringWithFormat:@"wine-%@.png", kImageDimension],
                       [NSString stringWithFormat:@"coctail-%@.png", kImageDimension],
                       [NSString stringWithFormat:@"beer_glass-%@.png", kImageDimension],
                       [NSString stringWithFormat:@"beer-%@.png", kImageDimension],
                       [NSString stringWithFormat:@"beer_bottle-%@.png", kImageDimension],
                       nil];
        
        NSString *imageName = [randomIcons objectAtIndex:arc4random_uniform([randomIcons count])];
        
        self.imageCircle = [[UIImageView alloc] initWithFrame:CGRectMake(122.0, 60.0, 50.0, 50.0)];
        [self.imageCircle setHidden:NO];
        [self.imageCircle setImage:[UIImage imageNamed:imageName]];
        
        [self.contentView addSubview:self.imageCircle];
        
        self.labelName = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 113.0, size.width, 20.0)];
        [self.labelName setFont:[UIFont boldSystemFontOfSize:12.0]];
        [self.labelName setTextAlignment:NSTextAlignmentCenter];
        [self.labelName setNumberOfLines:1];
        [self.labelName setTextColor:[UIColor whiteColor]];
        [self.contentView addSubview:self.labelName];
        

        self.labeDetail = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 139.0, size.width, 20.0)];
        [self.labeDetail setFont:[UIFont boldSystemFontOfSize:10.0]];
        [self.labeDetail setTextAlignment:NSTextAlignmentCenter];
        [self.labeDetail setNumberOfLines:1];
        [self.labeDetail setTextColor:[UIColor whiteColor]];
        [self.contentView addSubview:self.labeDetail];
        
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
