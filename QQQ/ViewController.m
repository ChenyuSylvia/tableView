//
//  ViewController.m
//  QQQ
//
//  Created by yangchenyu on 2019/7/9.
//  Copyright © 2019 yangchenyu. All rights reserved.
//

#import "ViewController.h"
#import "UserTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建数据视图  数据视图的位置  数据视图的风格
    self.navigationItem.title = @"好友列表";
    
    _tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:
                                              UITableViewStyleGrouped];
    //自动调整子视图的大小
    _tableview.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    //[_tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    
    //数据视图的头部视图设定
    _tableview.tableHeaderView = nil;
    //数据视图的尾部设定
    _tableview.tableFooterView = nil;
    
    [self.view addSubview:_tableview];
    
    [self initDataSource];
    
    //当数据的数据源发生变化的时候 重新加载数据
    [self.tableview reloadData];
    [self createBtn];
}

//初始化数据
-(void) initDataSource
{
    _arrayData = [[NSMutableArray alloc] initWithObjects:@"朋友", @"亲戚", @"同学", nil];
    
    NSDictionary *dic01 = [[NSDictionary alloc] initWithObjectsAndKeys:@"张三丰", @"name", @"[在线]", @"isonline", @"我很好", @"intro", @"4G", @"net", nil];
    NSDictionary *dic02 = [[NSDictionary alloc] initWithObjectsAndKeys:@"邓超", @"name", @"[隐身]", @"isonline", @"我很好", @"intro", @"4G", @"net", nil];
    NSDictionary *dic03 = [[NSDictionary alloc] initWithObjectsAndKeys:@"吴奇隆", @"name", @"[离开]", @"isonline", @"我很好", @"intro", @"4G", @"net", nil];
    
    _friendsArray = [[NSMutableArray alloc] initWithObjects:dic01, dic02, dic03, nil];
    
    NSDictionary *dic11 = [[NSDictionary alloc] initWithObjectsAndKeys:@"爸爸", @"name", @"[在线]", @"isonline", @"我很好", @"intro", @"4G", @"net", nil];
    NSDictionary *dic12 = [[NSDictionary alloc] initWithObjectsAndKeys:@"弟弟", @"name", @"[在线]", @"isonline", @"我很好", @"intro", @"4G", @"net", nil];
    NSDictionary *dic13 = [[NSDictionary alloc] initWithObjectsAndKeys:@"三哥", @"name", @"[在线]", @"isonline", @"我很好", @"intro", @"4G", @"net", nil];
    NSDictionary *dic14 = [[NSDictionary alloc] initWithObjectsAndKeys:@"大伯", @"name", @"[在线]", @"isonline", @"我很好", @"intro", @"4G", @"net", nil];
    NSDictionary *dic15 = [[NSDictionary alloc] initWithObjectsAndKeys:@"二舅", @"name", @"[在线]", @"isonline", @"我很好", @"intro", @"4G", @"net", nil];
    
    _familyArray = [[NSMutableArray alloc] initWithObjects:dic11, dic12, dic13, dic14, dic15, nil];
    
    NSDictionary *dic21 = [[NSDictionary alloc] initWithObjectsAndKeys:@"胖子", @"name", @"[在线]", @"isonline", @"我很好", @"intro", @"4G", @"net", nil];
    NSDictionary *dic22 = [[NSDictionary alloc] initWithObjectsAndKeys:@"雄哥", @"name", @"[在线]", @"isonline", @"我很好", @"intro", @"4G", @"net", nil];
    NSDictionary *dic23 = [[NSDictionary alloc] initWithObjectsAndKeys:@"小六子", @"name", @"[在线]", @"isonline", @"我很好", @"intro", @"4G", @"net", nil];
    
    _schoolmateArray = [[NSMutableArray alloc] initWithObjects:dic21, dic22, dic23, nil];
    
    _dataDic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:_friendsArray, [_arrayData objectAtIndex:0], _familyArray, [_arrayData objectAtIndex:1], _schoolmateArray, [_arrayData objectAtIndex:2], nil];
}

-(void) createBtn
{
    _isEdit = NO;
    //创建功能按钮
    self.btnEdit = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(pressEdit)];
    self.btnFinish = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(pressFinish)];
    self.btnDelete = [[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStylePlain target:self action:@selector(pressDelete)];
    
    self.navigationItem.rightBarButtonItem = _btnEdit;
}

-(CGFloat) tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    return 30;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

//当手指在单元格上移动 可以显示编辑状态
-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //可以设置事件
    //删除数据源
    if (0 <= indexPath.section && indexPath.section  < _arrayData.count) {
        [_arrayData[indexPath.section] removeObjectAtIndex:indexPath.row];
    }
    //数据源更新
    [self.tableview reloadData];
}

//选中单元格 执行动作
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
//取消选中单元格
-(void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

//单元格显示效果协议
-(UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //默认为删除
    return UITableViewCellEditingStyleDelete;
}

-(void) pressEdit
{
    _isEdit = YES;
    self.navigationItem.rightBarButtonItem = _btnFinish;
    [_tableview setEditing:YES];   //开启编辑状态
    self.navigationItem.leftBarButtonItem = _btnDelete;
}

-(void) pressFinish
{
    _isEdit = NO;
    self.navigationItem.rightBarButtonItem = _btnEdit;
    [_tableview setEditing:NO];
    self.navigationItem.leftBarButtonItem = nil;
}

//---------------------------　协议函数 ------------------------

//获取每组元素的个数（必须实现）程序在显示数据视图时会调用 返回值表示每组元素的个数
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numrow = [[_dataDic objectForKey:[_arrayData objectAtIndex:section]] count];
    return numrow;
}
//设置数据视图的组数  默认组数返回1
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return _arrayData.count;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 30)];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, [[UIScreen mainScreen] bounds].size.width, 15)];
    titleLabel.text = [_arrayData objectAtIndex:section];
    [view addSubview:titleLabel];
    return view;
}

//创建单元格对象函数
//indexpath 索引的调用
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *str = [_arrayData objectAtIndex:indexPath.section];
    NSArray *arr = [_dataDic objectForKey:str];
    
    NSString *cellstr = @"cell";
    //UITableViewCell* cell = [_tableview dequeueReusableCellWithIdentifier:cellstr forIndexPath:indexPath];
    //尝试获得可复用单元格
    UserTableViewCell *cell = [_tableview dequeueReusableCellWithIdentifier:cellstr];
    //如果没有可复用的 则为nil 创建
    if(cell == nil)
    {
    //创建一个单元格 单元格的样式 单元格的复用标记
        cell = [[UserTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellstr];
    }
    //NSString* str = [NSString stringWithFormat:@"第%ld组,第%ld行！",indexPath.section,indexPath.row];
    //单元格主文字内容赋值

    cell.nameLabel.text = [[arr objectAtIndex:indexPath.row] valueForKey:@"name"];
//    cell.isOnLine.text = [[arr objectAtIndex:indexPath.row] valueForKey:@"isonline"];
    cell.introductionLabel.text = [[arr objectAtIndex:indexPath.row] valueForKey:@"intro"];
    cell.networkLabel.text = [[arr objectAtIndex:indexPath.row] valueForKey:@"net"];
    
    //显示头像
    NSString *pic = [NSString stringWithFormat:@"%ld.jpg", indexPath.row % 7+1];
    UIImage *image = [UIImage imageNamed:pic];
    //UIImageView* iview = [[UIImageView alloc] initWithImage:image];
    //cell.imageView.image = image;
    cell.headerphoto.image = image;
    return cell;
}



//其他协议
//获得单元格高度
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

@end
