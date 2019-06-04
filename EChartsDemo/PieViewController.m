//
//  PieViewController.m
//  EChartsDemo
//
//  Created by 郑锐 on 2019/6/4.
//  Copyright © 2019 郑锐. All rights reserved.
//

#import "PieViewController.h"
#import <iOS_Echarts/iOS-Echarts.h>
#import "ZRChartsHelper.h"

#define getRectNavAndStatusHight self.navigationController.navigationBar.frame.size.height+[[UIApplication sharedApplication] statusBarFrame].size.height

@interface PieViewController ()

@property (nonatomic, strong)PYEchartsView *zrPieChartsView;

@property (nonatomic, strong)PYEchartsView *zrRingChartsView;

@end

@implementation PieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self chartsViewLayout];
    [self ringChartViewLayout];
    // Do any additional setup after loading the view.
}

//布局饼形chartsView
- (void)chartsViewLayout{
    self.zrPieChartsView = [[PYEchartsView alloc] initWithFrame:CGRectMake(0, getRectNavAndStatusHight, [UIScreen mainScreen].bounds.size.width, 350)];
    self.zrPieChartsView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.zrPieChartsView];
    
    NSArray *chart1Array = @[@{@"value":@40,@"name":@"业主"},@{@"value":@20,@"name":@"租户"},@{@"value":@10,@"name":@"保安"},@{@"value":@10,@"name":@"保姆"},@{@"value":@15,@"name":@"访客"},@{@"value":@5,@"name":@"宠物"}];
    
    
    NSArray *titleArray = @[@"业主",@"租户",@"保安",@"保姆",@"访客",@"宠物"];
    
    //为内容进行渲染
    ZRChartsHelper *helper = [[ZRChartsHelper alloc] init];
    [helper setZRSimplePieChartView:self.zrPieChartsView pieValues:titleArray pieData:chart1Array];
    
}

//布局环形chartView

- (void)ringChartViewLayout{
    self.zrRingChartsView = [[PYEchartsView alloc] initWithFrame:CGRectMake(0, getRectNavAndStatusHight+400, [UIScreen mainScreen].bounds.size.width, 350)];
    self.zrRingChartsView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.zrRingChartsView];
    
    NSArray *chart1Array = @[@{@"value":@40,@"name":@"业主"},@{@"value":@20,@"name":@"租户"},@{@"value":@10,@"name":@"保安"},@{@"value":@10,@"name":@"保姆"},@{@"value":@15,@"name":@"访客"},@{@"value":@5,@"name":@"宠物"}];
    
    
    NSArray *titleArray = @[@"业主",@"租户",@"保安",@"保姆",@"访客",@"宠物"];
    
    //为内容进行渲染
    ZRChartsHelper *helper = [[ZRChartsHelper alloc] init];
    [helper setZRSimpleRingChartView:self.zrRingChartsView ringValues:titleArray ringData:chart1Array];
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
