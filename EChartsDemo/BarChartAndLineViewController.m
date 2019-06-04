//
//  BarChartAndLineViewController.m
//  EChartsDemo
//
//  Created by 郑锐 on 2019/6/4.
//  Copyright © 2019 郑锐. All rights reserved.
//

#import "BarChartAndLineViewController.h"
#import <iOS_Echarts/iOS-Echarts.h>
#import "ZRChartsHelper.h"

#define getRectNavAndStatusHight self.navigationController.navigationBar.frame.size.height+[[UIApplication sharedApplication] statusBarFrame].size.height

@interface BarChartAndLineViewController ()

@property (nonatomic, strong)PYEchartsView *zrchartsView;

@property (nonatomic, strong)PYEchartsView *zrCombinChartView;

@end

@implementation BarChartAndLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self chartsViewLayout];
    
    [self zrConbineViewLayout];
    // Do any additional setup after loading the view.
}

#pragma mark 柱状图
//布局chartsView
- (void)chartsViewLayout{
    self.zrchartsView = [[PYEchartsView alloc] initWithFrame:CGRectMake(0, getRectNavAndStatusHight, [UIScreen mainScreen].bounds.size.width, 350)];
    self.zrchartsView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.zrchartsView];
    
    NSArray *chart1Array = @[
                             @[@"56",@"36",@"89",@"36",@"89",@"36",@"89",@"36",@"89",@"36",@"89"],
                             @[@"34",@"46",@"26",@"46",@"26",@"46",@"26",@"46",@"26",@"46",@"26"],
                             @[@"37",@"25",@"24",@"25",@"24",@"25",@"24",@"25",@"24",@"25",@"24"],
                             @[@"98",@"56",@"35",@"56",@"35",@"56",@"35",@"56",@"35",@"56",@"35"]
                             ];
    
    NSArray *titleArray = @[@"人员1",@"人员2",@"人员3",@"人员4",@"人员5",@"人员6",@"人员7",@"人员8",@"人员9",@"人员10",@"人员11"];
    
    //为内容进行渲染
    ZRChartsHelper *helper = [[ZRChartsHelper alloc] init];
    [helper setZRStackBarChartView:self.zrchartsView barValues:chart1Array xValues:titleArray];
    
}

#pragma mark 柱状图和折线图混合

- (void)zrConbineViewLayout{
    self.zrCombinChartView = [[PYEchartsView alloc] initWithFrame:CGRectMake(0,getRectNavAndStatusHight+400, self.view.frame.size.width, 300)];
    self.zrCombinChartView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.zrCombinChartView];
    
    NSArray *chart1Array = @[
                             @[@"56",@"36",@"89",@"32",@"23",@"35",@"49"],
                             @[@"34",@"46",@"14",@"57",@"86",@"46",@"34"],
                             ];
    
    NSArray *lineValues = @[@"20",@"60",@"120",@"20",@"10",@"67",@"100"];
    
    NSArray *titleArray = @[@"人员1",@"人员2",@"人员3",@"人员4",@"人员5",@"人员6",@"人员7"];
    
    //为内容进行渲染
    ZRChartsHelper *helper = [[ZRChartsHelper alloc] init];
    [helper setZRBarAndLineCombineChartView:self.zrCombinChartView barValues:chart1Array xValues:titleArray lineValues:lineValues lineTitle:@"销项率"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
