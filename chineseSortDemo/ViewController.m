//
//  ViewController.m
//  chineseSortDemo
//
//  Created by Y杨定甲 on 16/3/15.
//  Copyright © 2016年 damai. All rights reserved.
//

#import "ViewController.h"
#import "ChineseString.h"
#import "AddNameViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,addNameToVC>

@property(nonatomic,strong)NSMutableArray *indexArray;
@property(nonatomic,strong)NSMutableArray *letterResultArr;
@property (strong, nonatomic)NSMutableArray *array;
@property (weak, nonatomic) IBOutlet UITableView *nameTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _array = [NSMutableArray arrayWithObjects:@"中国",@"日本",@"朝鲜",@"韩国",@"￥hhh, .$",@" ￥Chin ese ",@"开源中国 ",@"www.oschina.net",@"开源技术",@"社区",@"开发者",@"传播", nil];

    _indexArray = [ChineseString IndexArray:_array];
    _letterResultArr = [ChineseString LetterSortArray:_array];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addName:(UIBarButtonItem *)sender {
    AddNameViewController *addNameVC = [[AddNameViewController alloc] init];
    addNameVC.delegate = self;
    [self presentViewController:addNameVC animated:YES completion:nil];
}


#pragma mark - tableDelegate
//-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//    return self.indexArray;
//}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.indexArray objectAtIndex:section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _indexArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[_letterResultArr objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [[_letterResultArr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    return cell;
}




- (void)addNameWithStr:(NSString *)str{
    
    [_array addObject:str];
    _indexArray = [ChineseString IndexArray:_array];
    _letterResultArr = [ChineseString LetterSortArray:_array];
    [self.nameTableView reloadData];
}








@end
