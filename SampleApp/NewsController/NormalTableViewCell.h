//
//  NormalTableViewCell.h
//  SampleApp
//
//  Created by plusend on 2019/5/18.
//  Copyright © 2019 plusend. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NormalTableViewCellDelegate <NSObject>
- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton;
@end

@interface NormalTableViewCell : UITableViewCell

@property (nonatomic, weak, readwrite) id<NormalTableViewCellDelegate> delegate;

- (void)layoutTableViewCell;

@end
