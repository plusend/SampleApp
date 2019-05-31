//
//  DeleteCellView.h
//  SampleApp
//
//  Created by jian.zhang on 2019/5/31.
//  Copyright © 2019 plusend. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DeleteCellView : UIView
- (void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t)clickBlock;
@end

NS_ASSUME_NONNULL_END
