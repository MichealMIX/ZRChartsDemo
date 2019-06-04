//
//  SimpleBarChartViewController.m
//  EChartsDemo
//
//  Created by 郑锐 on 2019/6/4.
//  Copyright © 2019 郑锐. All rights reserved.
//

#import "SimpleBarChartViewController.h"
#import <iOS_Echarts/iOS-Echarts.h>
#import "ZRChartsHelper.h"

#define getRectNavAndStatusHight self.navigationController.navigationBar.frame.size.height+[[UIApplication sharedApplication] statusBarFrame].size.height

@interface SimpleBarChartViewController ()

@property (nonatomic, strong)PYEchartsView *zrSimpleChartsView;

@property (nonatomic, strong)PYEchartsView *zrMutiChartsView;

@end

@implementation SimpleBarChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self chartsViewLayout];
    
    [self mutiChartViewLayout];
    // Do any additional setup after loading the view.
}

#pragma mark 柱状图
//布局chartsView
- (void)chartsViewLayout{
    self.zrSimpleChartsView = [[PYEchartsView alloc] initWithFrame:CGRectMake(0, getRectNavAndStatusHight, [UIScreen mainScreen].bounds.size.width, 350)];
    self.zrSimpleChartsView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.zrSimpleChartsView];
    
    NSArray *chart1Array = @[@"56",@"36",@"89",@"36",@"89",@"36",@"89",@"36",@"89",@"36",@"89"];
   
    
    NSArray *titleArray = @[@"人员1",@"人员2",@"人员3",@"人员4",@"人员5",@"人员6",@"人员7",@"人员8",@"人员9",@"人员10",@"人员11"];
    
    //为内容进行渲染
    ZRChartsHelper *helper = [[ZRChartsHelper alloc] init];
    [helper setZRSimpleBarChartView:self.zrSimpleChartsView barValues:chart1Array xValues:titleArray];
    
}

//布局mutiChart

- (void)mutiChartViewLayout{
    self.zrMutiChartsView = [[PYEchartsView alloc] initWithFrame:CGRectMake(0, getRectNavAndStatusHight+400, [UIScreen mainScreen].bounds.size.width, 350)];
    self.zrMutiChartsView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.zrMutiChartsView];
    
    NSArray *chart1Array = @[@"56",@"36",@"89",@"36",@"89",@"36",@"89",@"36",@"89",@"36",@"89"];
    
    NSArray *chart2Array = @[@"11",@"33",@"22",@"13",@"45",@"97",@"34",@"57",@"79",@"23",@"46"];
    
    NSArray *dataArray = @[chart1Array,chart2Array];
    
    NSArray *titleArray = @[@"人员1",@"人员2",@"人员3",@"人员4",@"人员5",@"人员6",@"人员7",@"人员8",@"人员9",@"人员10",@"人员11"];
    
    //为内容进行渲染
    ZRChartsHelper *helper = [[ZRChartsHelper alloc] init];
    [helper setZRMutiBarChartView:self.zrMutiChartsView barValues:dataArray xValues:titleArray];
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
