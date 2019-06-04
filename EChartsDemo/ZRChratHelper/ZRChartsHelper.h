//
//  ZRChartsHelper.h
//  EChartsDemo
//
//  Created by 郑锐 on 2019/6/3.
//  Copyright © 2019 郑锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <iOS_Echarts/iOS-Echarts.h>
NS_ASSUME_NONNULL_BEGIN

@interface ZRChartsHelper : NSObject

/**
 堆叠柱状图的显示
 
 @param chartView 需要设置的BarChartView
 @param barValues 柱子内容的数组（数组中装数组）
 @param xvals     X轴的值数组
 */
- (void)setZRStackBarChartView:(PYEchartsView *)chartView barValues:(NSArray *)barValues xValues:(NSArray *)xvals;

/**
 混合柱状图图表的显示
 
 @param chartView 需要设置的BarChartView
 @param barValues 柱子内容的数组
 @param xvals     X轴的值数组
 @param lineValues     折线的值数组
 @param lineTitle     折线的表示名称
 */
- (void)setZRBarAndLineCombineChartView:(PYEchartsView *)chartView barValues:(NSArray *)barValues xValues:(NSArray *)xvals lineValues:(NSArray *)lineValues lineTitle:(NSString *)lineTitle;

/**
 简单柱状图的显示
 
 @param chartView 需要设置的BarChartView
 @param barValues 柱子内容的数组（数组中装元素即可）
 @param xvals     X轴的值数组
 */

- (void)setZRSimpleBarChartView:(PYEchartsView *)chartView barValues:(NSArray *)barValues xValues:(NSArray *)xvals;

/**
 多重柱状图的显示
 
 @param chartView 需要设置的BarChartView
 @param barValues 柱子内容的数组
 @param xvals     X轴的值数组
 */

- (void)setZRMutiBarChartView:(PYEchartsView *)chartView barValues:(NSArray *)barValues xValues:(NSArray *)xvals;

/**
 标准饼图的显示
 
 @param chartView 需要设置的BarChartView
 @param pieValues 饼图中类型的数组
 @param pieData   饼图类型以及占比的字典数组 @{@"value":@20,@"name":@"业主"}
 */

- (void)setZRSimplePieChartView:(PYEchartsView *)chartView pieValues:(NSArray *)pieValues pieData:(NSArray *)pieData;

/**
 标准环形图的显示
 
 @param chartView 需要设置的BarChartView
 @param pieValues 环形图类型的数组
 @param pieData   环形图类型以及占比的字典数组 @{@"value":@20,@"name":@"业主"}
 */

- (void)setZRSimpleRingChartView:(PYEchartsView *)chartView ringValues:(NSArray *)pieValues ringData:(NSArray *)pieData;
@end

NS_ASSUME_NONNULL_END
