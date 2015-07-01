//
//  ViceChinaModelCell.h
//  First
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViceChinaModelCell : UITableViewCell
@property (nonatomic , retain)UIImageView *imaView;
@property (nonatomic , retain)UILabel *label1;
@property (nonatomic , retain)UILabel *label2;
- (void)calculateHeight;
@end
