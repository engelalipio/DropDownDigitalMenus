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



-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"HorizontalCell";
    
    NSString *imageName= @"";
    
    NSArray  *keys   = nil,
             *values = nil;
    
    UIImage  *image = nil;
    
    CGRect frameRect ;
    
    frameRect =  CGRectMake(0, 0, kCellHeight,kTableLength);
    
    HorizontalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell =  [[HorizontalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    
    if (self.items){
        keys = [self.items allKeys];
        values = [self.items allValues];
        
        imageName = [values  objectAtIndex:[indexPath row]];
        
        
        image = [UIImage imageNamed:imageName];
        
        //[cell.textLabel setText:[NSString stringWithFormat:@"%f",image.size.height]];
    
        //[cell.imageView setFrame:frameRect];
        [cell.imageView setImage:image];
        [cell.imageView setTransform:CGAffineTransformMakeRotation(- M_PI * 0.5)];
        
        [cell setContentMode:UIViewContentModeScaleAspectFill];
        [cell setBackgroundColor:[UIColor blackColor]];
        //[cell setFrame:CGRectMake(kRowHorizontalPadding * 0.5, kRowVerticalPadding * 0.5, kTableLength - kRowHorizontalPadding, kCellHeight)];
        //[cell setFrame:CGRectMake(0, 0, kCellWidth, kCellHeight)];
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
        
        self.horizontalTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.horizontalTableView.separatorColor = [UIColor clearColor];
        
        self.horizontalTableView.dataSource = self;
        self.horizontalTableView.delegate = self;
        
     
        [self addSubview:self.horizontalTableView];
    }
    
    return self;
}

@end
