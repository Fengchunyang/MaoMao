//
//  ProgramView1.m
//  MONO-A
//
//  Created by lanouhn on 15/7/4.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "ProgramView1.h"
#import "ProgramCell.h"
@implementation ProgramView1

-(id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        
        
        [self registerClass:[ProgramCell class] forCellWithReuseIdentifier:@"cell"];
        //区头视图
        [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"foot"];
        //区尾视图
        [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        
        
        
        
        
        
        
        
    }
    return self;
    
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
