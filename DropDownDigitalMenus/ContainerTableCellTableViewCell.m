//
//  ContainerTableCellTableViewCell.m
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 10/24/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import "ContainerTableCellTableViewCell.h"
#import "ContainerCellView.h"

@interface ContainerTableCellTableViewCell(){
    ContainerCellView *containerCell;
}
@end
@implementation ContainerTableCellTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    
    if (self) {
        // Initialization code
         containerCell = [[NSBundle mainBundle] loadNibNamed:@"ContainerCellView"
                                                       owner:self
                                                     options:nil][0];
        [containerCell setFrame:self.bounds];
        [self.contentView addSubview:containerCell];
    }
    return self;
}


- (void)setCollectionData:(NSArray *)collectionData{
    [containerCell setCollectionData:collectionData];
}

@end
