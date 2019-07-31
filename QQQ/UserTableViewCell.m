//
//  cell.m
//  QQQ
//
//  Created by yangchenyu on 2019/7/11.
//  Copyright © 2019 yangchenyu. All rights reserved.
//

#import "UserTableViewCell.h"

@implementation UserTableViewCell

#pragma mark - Life cycle

- (void)dealloc
{
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildViews];
    }
    return self;
}

#pragma mark - private

- (void)buildViews
{
    _headerphoto = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 50, 50)];
    [self.contentView addSubview:_headerphoto];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 5, 200, 25)];
    _nameLabel.backgroundColor = [UIColor clearColor];
    _nameLabel.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:_nameLabel];
    
    _isOnLine=[[UILabel alloc]initWithFrame:CGRectMake(70, 50, 50, 5)];
    _isOnLine.font=[UIFont systemFontOfSize:10];
    [self.contentView addSubview:_isOnLine];
    
    _introductionLabel=[[UILabel alloc]initWithFrame:CGRectMake(130, 50, 180, 5)];
    _introductionLabel.font=[UIFont systemFontOfSize:10];
    [self.contentView addSubview:_introductionLabel];
    
    _networkLabel=[[UILabel alloc]initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width - 50, 5, 50, 25)];
    _networkLabel.font=[UIFont systemFontOfSize:10];
    [self.contentView addSubview:_networkLabel];
}

@end
