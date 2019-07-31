//
//  SLQMessage.m
//  QQQ
//
//  Created by yangchenyu on 2019/7/12.
//  Copyright © 2019 yangchenyu. All rights reserved.
//

#import "SLQMessage.h"

@implementation SLQMessage

+(instancetype)MessageWithDict:(NSDictionary *)dict

{
    
    SLQMessage *message = [[SLQMessage alloc] init];
    
    [message setValuesForKeysWithDictionary:dict];
    
    return  message;
    
}

@end
