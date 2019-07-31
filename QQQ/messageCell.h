//
//  messageCell.h
//  QQQ
//
//  Created by yangchenyu on 2019/7/12.
//  Copyright © 2019 yangchenyu. All rights reserved.
//
//对cell的封装

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SLQMessage;
@interface messageCell : UITableViewCell

@property (strong, nonatomic) SLQMessage *message;

+ (instancetype) cellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
