//
//  cell.h
//  QQQ
//
//  Created by yangchenyu on 2019/7/11.
//  Copyright © 2019 yangchenyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserTableViewCell : UITableViewCell
//设置一些状态
@property (strong,nonatomic) UIImageView *headerphoto; //头像
@property (strong,nonatomic) UILabel *nameLabel;//昵称
@property (strong,nonatomic) UILabel *isOnLine;//是否在线
@property (strong,nonatomic) UILabel *introductionLabel;//个性签名，动态等
@property (strong,nonatomic) UILabel *networkLabel;//网络状态
@end

NS_ASSUME_NONNULL_END
