//
//  SLQMessage.h
//  QQQ
//
//  Created by yangchenyu on 2019/7/12.
//  Copyright © 2019 yangchenyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum{
    SLQMessageTypeMe = 0,
    SLQMessageTypeOther = 1
}SLQMessageType;

@interface SLQMessage : NSObject

//会话消息单元格
@property (nonatomic, strong) NSString *text;//文本
@property (nonatomic, strong) NSString *time;//显示时间
@property (nonatomic, assign) SLQMessageType type; //消息类型
@property (nonatomic, assign) CGFloat cellHeight; //单元格的高度
@property (assign, nonatomic, getter=isHideTime) BOOL hideTime;  //是否隐藏时间

+ (instancetype)MessageWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
