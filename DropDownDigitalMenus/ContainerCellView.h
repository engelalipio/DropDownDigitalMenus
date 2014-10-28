//
//  ContainerCellView.h
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 10/24/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContainerCellView : UIView<UICollectionViewDataSource,UICollectionViewDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray* collectionData;

-(void) setCollectionData:(NSArray*) anyCollection;
@end
