//
//  HorizontalTableViewCell.m
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 10/31/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import "HorizontalTableViewCell.h"

@implementation HorizontalTableViewCell
@synthesize items = _items;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (NSString *) reuseIdentifier
{
    return @"HorizontalCell";
}

-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0f;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"HorizontalCell";
    
    NSString *imageName= @"";
    
    NSArray  *keys   = nil,
             *values = nil;
    
    UIImage  *image = nil;
    
    UIImageView *imageView = nil;
    
    CGRect frameRect ;
    
    CGAffineTransform transform ;
    
    frameRect =  CGRectMake(0, 0, kCellHeight,kCellWidth);
    
    transform = CGAffineTransformMakeRotation(- M_PI * 0.5);
    
    HorizontalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell =  [[HorizontalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    [cell.contentView setFrame:frameRect];
    [cell.contentView setContentMode:UIViewContentModeScaleToFill];
 
    //[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
 
    if (self.items){
        keys = [self.items allKeys];
        values = [self.items allValues];
        
        imageName = [values  objectAtIndex:[indexPath row]];
        
        image = [UIImage imageNamed:imageName];
        
        imageView = [[UIImageView alloc] initWithFrame:frameRect];
        
        [imageView setImage:image];
        [imageView setTransform:transform];
        
        [cell.contentView addSubview:imageView];
        [imageView sizeThatFits:frameRect.size];
 
        [cell setBackgroundColor:kVerticalTableBackgroundColor];
        
        
        NSLog(@"%f",cell.frame.size.width);
    
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger  rows = self.items.count;
   
    return rows;
}

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        self.horizontalTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kCellHeight, kTableLength)];
        
        self.horizontalTableView.showsVerticalScrollIndicator = NO;
        self.horizontalTableView.showsHorizontalScrollIndicator = NO;
        self.horizontalTableView.transform = CGAffineTransformMakeRotation(M_PI * 0.5);
        
       // [self.horizontalTableView setFrame:CGRectMake(kRowHorizontalPadding * 0.5, kRowVerticalPadding * 0.5, kTableLength - kRowHorizontalPadding, kCellHeight)];
        [self.horizontalTableView setFrame:CGRectMake(0, 0, kTableLength, kCellHeight)];
        self.horizontalTableView.rowHeight = kCellWidth;
        self.horizontalTableView.backgroundColor = kVerticalTableBackgroundColor;
        
        self.horizontalTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
        self.horizontalTableView.separatorColor = [UIColor orangeColor];
        
        self.horizontalTableView.dataSource = self;
        self.horizontalTableView.delegate = self;
        
        self.selectedBackgroundView.backgroundColor =  kHorizontalTableSelectedBackgroundColor;
     
        [self addSubview:self.horizontalTableView];
    }
    
    return self;
}

@end
