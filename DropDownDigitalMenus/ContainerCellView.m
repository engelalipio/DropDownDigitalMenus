//
//  ContainerCellView.m
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 10/24/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import "ContainerCellView.h"
#import "ContainerCellViewCell.h"
#import "Constants.h"

@interface ContainerCellView()
  -(void) initCollectionView;
@end

@implementation ContainerCellView

@synthesize collectionData = _collectionData;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initCollectionView];
    }
    return self;
}

- (void)awakeFromNib {
    [self initCollectionView];

}

-(void) initCollectionView{
    NSString *message = @"";
    UICollectionViewFlowLayout *flowLayout = nil;
    @try {
        if (! self.collectionView){
            _collectionView = [[UICollectionView alloc] init];
        }
        
        [self.collectionView setBackgroundColor:[UIColor blackColor]];
        
        flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        
        [flowLayout setItemSize:CGSizeMake(500.0, 200.0)];
        
        [self.collectionView setCollectionViewLayout:flowLayout];
        
        // Register the collection cell
        [_collectionView registerNib:[UINib nibWithNibName:@"ContainerCellViewCell" bundle:nil]
          forCellWithReuseIdentifier:@"ContainerCellViewCell"];
        
        [self.collectionView setDelegate:self];
        [self.collectionView setDataSource:self];
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        if ([message length] > 0)
        {
            NSLog(@"%@",message);
        }
        message = @"";
        flowLayout = nil;
    }
}

#pragma -mark Collection View Events

-(UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ContainerCellViewCell *collCell = nil;
    NSDictionary *cellData = nil;
    NSString *message = @"",
             *imageName = @"";
    UIImage *image = nil;
    UIImageView *imageView = nil;
    @try {
        
        collCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ContainerCellViewCell"
                                                             forIndexPath:indexPath];
        
        cellData = [self.collectionData objectAtIndex:[indexPath row]];
        
        imageName = [cellData objectForKey:@"image"];
        
        image = [UIImage imageNamed:imageName];
        
        imageView = [[UIImageView alloc] initWithImage:image];
        
        [collCell setImageView:imageView];
    
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        if ([message length] > 0)
        {
            NSLog(@"%@",message);
        }
    }
    
    return collCell;
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSInteger items = 0;
    if (self.collectionData){
        items = self.collectionData.count;
    }
    return items;
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    NSInteger sections = 1;
    
    return sections;
}

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void) setCollectionData:(NSArray*) anyCollection{
    
    NSString *message = @"";
    
    @try {
    
        _collectionData = anyCollection;
        [_collectionView setContentOffset:CGPointZero animated:NO];
        [_collectionView reloadData];
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        if ([message length]> 0){
            NSLog(@"%@",message);
        }
        message = @"";
    }
}

 

 
@end
