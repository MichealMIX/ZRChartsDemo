//
//  ViewController.m
//  EChartsDemo
//
//  Created by 郑锐 on 2019/6/1.
//  Copyright © 2019 郑锐. All rights reserved.
//

#import "ViewController.h"
#import "BarChartAndLineViewController.h"
#import "SimpleBarChartViewController.h"
#import "PieViewController.h"

#define getRectNavAndStatusHight self.navigationController.navigationBar.frame.size.height+[[UIApplication sharedApplication] statusBarFrame].size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *typeArray;
}

@property (nonatomic, strong)UITableView *tableview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    typeArray = @[@"堆叠柱状图和折线柱状图",@"最简单的单柱图和多重柱状图",@"标准饼状图和标准环状图"];
    
    [self tableviewLayout];
    


}

- (void)tableviewLayout{
    [self.view addSubview:self.tableview];
}

#pragma mark tableview delegate&datesource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.text = typeArray[indexPath.row];
    }
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return typeArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        BarChartAndLineViewController *vc = [[BarChartAndLineViewController alloc] init];
        vc.title = typeArray[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){
        SimpleBarChartViewController *vc = [[SimpleBarChartViewController alloc] init];
        vc.title = typeArray[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 2){
        PieViewController *vc = [[PieViewController alloc] init];
        vc.title = typeArray[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark getter & setter

- (UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, getRectNavAndStatusHight, self.view.frame.size.width, self.view.frame.size.height-(getRectNavAndStatusHight)) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
    }
    return _tableview;
}










@end
