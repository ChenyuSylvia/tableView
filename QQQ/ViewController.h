//
//  ViewController.h
//  QQQ
//
//  Created by yangchenyu on 2019/7/9.
//  Copyright © 2019 yangchenyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<
//实现数据视图的普通协议
//数据视图的普通事件处理
UITableViewDelegate,
//实现数据视图的数据代理协议
//处理数据视图的数据代理
UITableViewDataSource
>
//定义一个数据视图对象
//数据视图来显示大量相同格式的大量信息的视图
@property (nonatomic, strong) UITableView *tableview;
//声明一个数据源
@property (nonatomic, strong) NSMutableArray *arrayData;    //实现第一层数据
//第二层数据的分组
@property (nonatomic, strong) NSMutableArray *friendsArray;//好友列表
@property (nonatomic, strong) NSMutableArray *familyArray;//亲戚列表
@property (nonatomic, strong) NSMutableArray *schoolmateArray;//同学列表

@property (nonatomic, strong) NSMutableDictionary *dataDic;//第二层需要展示的数据


//添加导航栏按钮
@property (nonatomic, strong) UIBarButtonItem *btnEdit;
@property (nonatomic, strong) UIBarButtonItem *btnFinish;
@property (nonatomic, strong) UIBarButtonItem *btnDelete;
@property (nonatomic, strong) NSMutableArray *selectedArr;  //控制列表是否被打开


//设置编辑状态
@property (nonatomic, assign) BOOL isEdit;

@end

