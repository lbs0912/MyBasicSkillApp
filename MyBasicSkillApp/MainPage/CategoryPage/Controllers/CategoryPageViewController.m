//
//  CategoryPageViewController.m
//  MyBasicSkillApp
//
//  Created by Liu Baoshuai on 2019/6/23.
//  Copyright © 2019 Liu Baoshuai. All rights reserved.
//

#import "CategoryPageViewController.h"
#import "MBSContact.h"
#import "MBSContactGroup.h"

@interface CategoryPageViewController () <UITableViewDataSource, UITableViewDelegate> {
    UITableView *_tableView;
    NSMutableArray *_contacts; //联系人模型
    NSIndexPath *_selectedIndexPath;//当前选中的组和行
    
    //判断当前处于的状态
    BOOL *_isInsert;
}

@end

@implementation CategoryPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    //创建一个分组样式的UITableView
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style: UITableViewStyleGrouped];
    //设置数据源
    _tableView.dataSource = self;
    //设置委托协议
    _tableView.delegate = self;
    
    [self.view addSubview:_tableView];
    
    
}

//重写init方法
-(instancetype) init {
    if ([super init] != nil)
    {
        // 为该控制器设置标签项
        self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostViewed tag:2];
        self.tabBarItem.badgeValue = @"9";
        [self.navigationItem setTitle:@"TableView"];
        
        UIBarButtonItem *removeButton=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
                                 target:self
                                 action:@selector(removeBtn)];
        UIBarButtonItem *addButton=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                 target:self
                                 action:@selector(addBtn)];
        [self.navigationItem setLeftBarButtonItem:removeButton];
        [self.navigationItem setRightBarButtonItem:addButton];
       
        
    }
    return self;
}



#pragma mark 加载数据
-(void)initData{
    _contacts=[[NSMutableArray alloc]init]; //联系人模型
    
    // _contacts 是一个二维数组
    
    MBSContact *contact1=[MBSContact initWithFirstName:@"Cui" andLastName:@"Kenshin" andPhoneNumber:@"18500131234"];
    MBSContact *contact2=[MBSContact initWithFirstName:@"Cui" andLastName:@"Tom" andPhoneNumber:@"18500131237"];
    MBSContactGroup *group1=[MBSContactGroup initWithName:@"C" andDetail:@"With names beginning with C" andContacts:[NSMutableArray arrayWithObjects:contact1,contact2, nil]];
    [_contacts addObject:group1];
    
    
    MBSContact *contact3=[MBSContact initWithFirstName:@"Lee" andLastName:@"Terry" andPhoneNumber:@"18500131238"];
    MBSContact *contact4=[MBSContact initWithFirstName:@"Lee" andLastName:@"Jack" andPhoneNumber:@"18500131239"];
    MBSContact *contact5=[MBSContact initWithFirstName:@"Lee" andLastName:@"Rose" andPhoneNumber:@"18500131240"];
    MBSContactGroup *group2=[MBSContactGroup initWithName:@"L" andDetail:@"With names beginning with L" andContacts:[NSMutableArray arrayWithObjects:contact3,contact4,contact5, nil]];
    [_contacts addObject:group2];
    
    
    MBSContact *contact6=[MBSContact initWithFirstName:@"Sun" andLastName:@"Kaoru" andPhoneNumber:@"18500131235"];
    MBSContact *contact7=[MBSContact initWithFirstName:@"Sun" andLastName:@"Rosa" andPhoneNumber:@"18500131236"];
    
    MBSContactGroup *group3=[MBSContactGroup initWithName:@"S" andDetail:@"With names beginning with S" andContacts:[NSMutableArray arrayWithObjects:contact6,contact7, nil]];
    [_contacts addObject:group3];
    
    MBSContact *contact8=[MBSContact initWithFirstName:@"Wang" andLastName:@"Stephone" andPhoneNumber:@"18500131241"];
    MBSContact *contact9=[MBSContact initWithFirstName:@"Wang" andLastName:@"Lucy" andPhoneNumber:@"18500131242"];
    MBSContact *contact10=[MBSContact initWithFirstName:@"Wang" andLastName:@"Lily" andPhoneNumber:@"18500131243"];
    MBSContact *contact11=[MBSContact initWithFirstName:@"Wang" andLastName:@"Emily" andPhoneNumber:@"18500131244"];
    MBSContact *contact12=[MBSContact initWithFirstName:@"Wang" andLastName:@"Andy" andPhoneNumber:@"18500131245"];
    MBSContactGroup *group4=[MBSContactGroup initWithName:@"W" andDetail:@"With names beginning with W" andContacts:[NSMutableArray arrayWithObjects:contact8,contact9,contact10,contact11,contact12, nil]];
    [_contacts addObject:group4];
    
    
    MBSContact *contact13=[MBSContact initWithFirstName:@"Zhang" andLastName:@"Joy" andPhoneNumber:@"18500131246"];
    MBSContact *contact14=[MBSContact initWithFirstName:@"Zhang" andLastName:@"Vivan" andPhoneNumber:@"18500131247"];
    MBSContact *contact15=[MBSContact initWithFirstName:@"Zhang" andLastName:@"Joyse" andPhoneNumber:@"18500131248"];
    MBSContactGroup *group5=[MBSContactGroup initWithName:@"Z" andDetail:@"With names beginning with Z" andContacts:[NSMutableArray arrayWithObjects:contact13,contact14,contact15, nil]];
    [_contacts addObject:group5];
    
}

#pragma mark - 数据源方法


#pragma mark 返回每组行数 必须实现的方法 （每个节中的行数）
-(NSInteger)tableView:(UITableView *)tableView  numberOfRowsInSection:(NSInteger)section{
    NSLog(@"计算每组(组%ld)行数",section);
    MBSContactGroup *group1=_contacts[section];
    return group1.contacts.count;
}

#pragma mark返回每行的单元格 必须实现的方法
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    //NSIndexPath是一个结构体，记录了组和行信息
//    NSLog(@"生成单元格(组：%ld,行%ld)",indexPath.section,indexPath.row);
//    MBSContactGroup *group=_contacts[indexPath.section];
//    MBSContact *contact=group.contacts[indexPath.row];
//    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
//    cell.textLabel.text=[contact getName];
//    cell.detailTextLabel.text=contact.phoneNumber;
//    return cell;
//}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSIndexPath是一个结构体，记录了组和行信息
    NSLog(@"生成单元格(组：%ld,行%ld)",indexPath.section,indexPath.row);
    MBSContactGroup *group=_contacts[indexPath.section];
    MBSContact *contact=group.contacts[indexPath.row];
    
//    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    //由于此方法调用十分频繁，cell的标示声明成静态变量有利于性能优化
    static NSString *cellIdentifier=@"UITableViewCellIdentifierKey1";
    static NSString *cellIdentifierForFirstRow=@"UITableViewCellIdentifierKeyWithSwitch";
    //首先根据标识去缓存池取
    UITableViewCell *cell;
    
    if (indexPath.row==0) {
        cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifierForFirstRow];
    }else{
        cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    }
    //如果缓存池没有取到则重新创建并放到缓存池中
    if(!cell){
        if (indexPath.row==0) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifierForFirstRow];
            UISwitch *sw=[[UISwitch alloc]init];
            [sw addTarget:self action:@selector(switchValueChange:) forControlEvents:UIControlEventValueChanged];
            cell.accessoryView=sw; // 设置tableViewCell 的 accessoryView 属性
            
        }else{
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
            cell.accessoryType=UITableViewCellAccessoryDetailButton;  // 设置tableViewCell 的 accessoryType
        }
    }
    
    if(indexPath.row==0){
        ((UISwitch *)cell.accessoryView).tag=indexPath.section; // 设置tab 用于点击识别
    }
    
    
    
    cell.textLabel.text=[contact getName];
    cell.detailTextLabel.text=contact.phoneNumber;
    
    NSLog(@"cell:%@",cell); //查看cell复用
    return cell;
}


#pragma mark 返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"计算分组数");
    return _contacts.count;
}



#pragma mark 返回每组头标题名称
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSLog(@"生成组（组%ld）名称",section);
    MBSContactGroup *group=_contacts[section];
    return group.name;
}

#pragma mark 返回每组尾部说明
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    NSLog(@"生成尾部（组%ld）详情",section);
    MBSContactGroup *group=_contacts[section];
    return group.detail;
}


#pragma mark 返回每组标题索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSLog(@"生成组索引");
    NSMutableArray *indexs=[[NSMutableArray alloc]init];
    for(MBSContactGroup *group in _contacts){
        [indexs addObject:group.name];
    }
    return indexs;
}

#pragma mark - 代理方法
// 不要忘记设置委托协议   _tableView.delegate = self;
#pragma mark 设置分组标题内容高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section==0){
        return 50; //第1个表头
    }
    return 40;
}

#pragma mark 设置每行高度（每行高度可以不一样）
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

#pragma mark 设置尾部说明内容高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 40;
}


#pragma mark 点击行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _selectedIndexPath = indexPath;
    MBSContactGroup *group=_contacts[indexPath.section];
    MBSContact *contact=group.contacts[indexPath.row];
    //创建弹出窗口
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"System Info" message:[contact getName] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    alert.alertViewStyle=UIAlertViewStylePlainTextInput; //设置窗口内容样式
    UITextField *textField= [alert textFieldAtIndex:0]; //取得文本框
    textField.text=contact.phoneNumber; //设置文本框内容
    [alert show]; //显示窗口
}



#pragma mark 重写状态样式方法
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma mark 窗口的代理方法，用户保存数据
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    //当点击了第二个按钮（OK）
    if (buttonIndex==1) {
        UITextField *textField= [alertView textFieldAtIndex:0];
        //修改模型数据
        MBSContactGroup *group=_contacts[_selectedIndexPath.section];
        MBSContact *contact=group.contacts[_selectedIndexPath.row];
        contact.phoneNumber=textField.text;
        //刷新表格
        NSArray *indexPaths=@[_selectedIndexPath];//需要局部刷新的单元格的组、行
        [_tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationLeft];//后面的参数代表更新时的动画
    }
}


#pragma mark 切换开关转化事件
-(void)switchValueChange:(UISwitch *)sw{
    NSLog(@"section:%ld,switch:%l",sw.tag, sw.on);
}


#pragma mark - 导航栏按钮
- (void) removeBtn {
    //直接通过下面的方法设置编辑状态没有动画
    //_tableView.editing=!_tableView.isEditing;
     _isInsert = NO;
    [_tableView setEditing:!_tableView.isEditing animated:true];
}

- (void) addBtn {
    _isInsert = YES;
    [_tableView setEditing:!_tableView.isEditing animated:true];
}


#pragma mark 删除操作
//实现了此方法向左滑动就会显示删除按钮
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MBSContactGroup *group =_contacts[indexPath.section];
    MBSContact *contact=group.contacts[indexPath.row];
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        [group.contacts removeObject:contact];
        //考虑到性能这里不建议使用reloadData
        //[tableView reloadData];
        //使用下面的方法既可以局部刷新又有动画效果
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
        
        //如果当前组中没有数据则移除组刷新整个表格
        if (group.contacts.count==0) {
            [_contacts removeObject:group];
            [tableView reloadData];
        }
    }else if(editingStyle==UITableViewCellEditingStyleInsert){
        MBSContact *newContact=[[MBSContact alloc]init];
        newContact.firstName=@"first";
        newContact.lastName=@"last";
        newContact.phoneNumber=@"12345678901";
        [group.contacts insertObject:newContact atIndex:indexPath.row];
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];//注意这里没有使用reladData刷新
    }
}


#pragma mark 取得当前操作状态，根据不同的状态左侧出现不同的操作按钮
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_isInsert) {
        return UITableViewCellEditingStyleInsert;
    }
    return UITableViewCellEditingStyleDelete;
}


#pragma mark 排序
//只要实现这个方法在编辑状态右侧就有排序图标
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    MBSContactGroup *sourceGroup =_contacts[sourceIndexPath.section];
    MBSContact *sourceContact=sourceGroup.contacts[sourceIndexPath.row];
    MBSContactGroup *destinationGroup =_contacts[destinationIndexPath.section];
    
    [sourceGroup.contacts removeObject:sourceContact];
    if(sourceGroup.contacts.count==0){
        [_contacts removeObject:sourceGroup];
        [tableView reloadData];
    }
    
    [destinationGroup.contacts insertObject:sourceContact atIndex:destinationIndexPath.row];
    
}
@end
