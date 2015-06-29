//
//  ThirdModelCell.h
//  First
//
//  Created by lanouhn on 15/6/24.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ThirdModelCell : UITableViewCell
@property (nonatomic , retain)UIImageView *imaView;
@property (nonatomic , retain)UIImageView *headView;
@property (nonatomic , retain)UILabel *label1;
@property (nonatomic , retain)UILabel *label2;

- (void)calculateHeight;
@end
