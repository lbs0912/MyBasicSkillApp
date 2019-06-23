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

@interface CategoryPageViewController () <UITableViewDataSource> {
    UITableView *_tableView;
    NSMutableArray *_contacts; //联系人模型
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
    
    [self.view addSubview:_tableView];
    
    
}

//重写init方法
-(instancetype) init {
    if ([super init] != nil)
    {
        // 为该控制器设置标签项
        self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostViewed tag:2];
        self.tabBarItem.badgeValue = @"9";
        
    }
    return self;
}



#pragma mark 加载数据
-(void)initData{
    _contacts=[[NSMutableArray alloc]init];
    
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
#pragma mark 返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"计算分组数");
    return _contacts.count;
}

#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"计算每组(组%ld)行数",section);
    MBSContactGroup *group1=_contacts[section];
    return group1.contacts.count;
}

#pragma mark返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSIndexPath是一个结构体，记录了组和行信息
    NSLog(@"生成单元格(组：%ld,行%ld)",indexPath.section,indexPath.row);
    MBSContactGroup *group=_contacts[indexPath.section];
    MBSContact *contact=group.contacts[indexPath.row];
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text=[contact getName];
    cell.detailTextLabel.text=contact.phoneNumber;
    return cell;
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
@end
