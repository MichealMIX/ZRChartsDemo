//
//  ZRChartsHelper.m
//  EChartsDemo
//
//  Created by 郑锐 on 2019/6/3.
//  Copyright © 2019 郑锐. All rights reserved.
//

#import "ZRChartsHelper.h"

@implementation ZRChartsHelper

- (void)setZRStackBarChartView:(PYZoomEchartsView *)chartView barValues:(NSArray *)barValues xValues:(NSArray *)xvals{
    PYOption *option = [PYOption initPYOptionWithBlock:^(PYOption *option) {
        
        option.tooltipEqual([PYTooltip initPYTooltipWithBlock:^(PYTooltip *tooltip) {
            tooltip.triggerEqual(PYTooltipTriggerAxis)
            .axisPointerEqual([PYAxisPointer initPYAxisPointerWithBlock:^(PYAxisPointer *axisPoint) {
                axisPoint.typeEqual(PYAxisPointerTypeShadow);
            }]);
        }])
        
      
        .legendEqual([PYLegend initPYLegendWithBlock:^(PYLegend *legend) {
            legend.dataEqual(@[@"已处理",@"待销项",@"已销项",@"新增事件"]);
            legend.yEqual(@300);
        }])
        .gridEqual([PYGrid initPYGridWithBlock:^(PYGrid *grid) {
            grid.xEqual(@40).x2Equal(@50);
            grid.yEqual(@10);
            grid.heightEqual(@250);
        }])
        
        .dataZoomEqual([PYDataZoom initPYDataZoomWithBlock:^(PYDataZoom *dataZoom) {
            dataZoom.yEqual(@335);
            dataZoom.heightEqual(@10);
            dataZoom.showEqual(YES)
            .startEqual(@30)
            .endEqual(@70);
        }])
        
        //设置工具栏，一般咱们这个项目用不到，也没必要让产品知道还有这个高级功能
        .toolboxEqual([PYToolbox initPYToolboxWithBlock:^(PYToolbox *toolbox) {
            toolbox.showEqual(NO)
            .orientEqual(PYOrientVertical)
            .xEqual(PYPositionRight)
            .yEqual(PYPositionCenter)
            .featureEqual([PYToolboxFeature initPYToolboxFeatureWithBlock:^(PYToolboxFeature *feature) {
                feature.markEqual([PYToolboxFeatureMark initPYToolboxFeatureMarkWithBlock:^(PYToolboxFeatureMark *mark) {
                    mark.showEqual(YES);
                }])
                .dataViewEqual([PYToolboxFeatureDataView initPYToolboxFeatureDataViewWithBlock:^(PYToolboxFeatureDataView *dataView) {
                    dataView.showEqual(YES).readOnlyEqual(NO);
                }])
                .magicTypeEqual([PYToolboxFeatureMagicType initPYToolboxFeatureMagicTypeWithBlock:^(PYToolboxFeatureMagicType *magicType) {
                    magicType.showEqual(YES).typeEqual(@[PYSeriesTypeLine, PYSeriesTypeBar, @"stack", @"tiled"]);
                }])
                .restoreEqual([PYToolboxFeatureRestore initPYToolboxFeatureRestoreWithBlock:^(PYToolboxFeatureRestore *restore) {
                    restore.showEqual(YES);
                }]);
            }]);
        }])
        .calculableEqual(NO)
        //设置X轴title，有多少个就在数组中写入多少个
        .addXAxis([PYAxis initPYAxisWithBlock:^(PYAxis *axis) {
            axis.typeEqual(PYAxisTypeCategory)
            .addDataArr(xvals);
        }])
        
        
        //设置Y轴title，一般默认是数字
        .addYAxis([PYAxis initPYAxisWithBlock:^(PYAxis *axis) {
            axis.typeEqual(PYAxisTypeValue);
            axis.positionEqual(PYPositionLeft);
        }])
        
        
        //这个地方设置X轴每个单位中有几个柱状图，每个柱状图有几层，这个🐔8玩意设置有够变态
        .addSeries([PYCartesianSeries initPYCartesianSeriesWithBlock:^(PYCartesianSeries *series) {
            series.stackEqual(@"事件类型")
            .nameEqual(@"已处理")
            .typeEqual(PYSeriesTypeBar)
            .itemStyleEqual([PYItemStyle initPYItemStyleWithBlock:^(PYItemStyle *itemStyle) {
                itemStyle.normalEqual([PYItemStyleProp initPYItemStylePropWithBlock:^(PYItemStyleProp *normal) {
                    normal.labelEqual([PYLabel initPYLabelWithBlock:^(PYLabel *label) {
                        label.showEqual(YES).positionEqual(@"inside");
                    }]);
                }]);
            }])
            .dataEqual(barValues[0]);
        }])
        .addSeries([PYCartesianSeries initPYCartesianSeriesWithBlock:^(PYCartesianSeries *series) {
            series.stackEqual(@"事件类型")
            .nameEqual(@"待销项")
            .typeEqual(PYSeriesTypeBar)
            .itemStyleEqual([PYItemStyle initPYItemStyleWithBlock:^(PYItemStyle *itemStyle) {
                itemStyle.normalEqual([PYItemStyleProp initPYItemStylePropWithBlock:^(PYItemStyleProp *normal) {
                    normal.labelEqual([PYLabel initPYLabelWithBlock:^(PYLabel *label) {
                        label.showEqual(YES).positionEqual(@"inside");
                    }]);
                }]);
            }])
            .dataEqual(barValues[1]);
            
        }])
        .addSeries([PYCartesianSeries initPYCartesianSeriesWithBlock:^(PYCartesianSeries *series) {
            series.stackEqual(@"事件类型")
            .nameEqual(@"已销项")
            .typeEqual(PYSeriesTypeBar)
            .itemStyleEqual([PYItemStyle initPYItemStyleWithBlock:^(PYItemStyle *itemStyle) {
                itemStyle.normalEqual([PYItemStyleProp initPYItemStylePropWithBlock:^(PYItemStyleProp *normal) {
                    normal.labelEqual([PYLabel initPYLabelWithBlock:^(PYLabel *label) {
                        label.showEqual(YES).positionEqual(@"inside");
                    }]);
                }]);
            }])
            .dataEqual(barValues[2]);
        }])
        .addSeries([PYCartesianSeries initPYCartesianSeriesWithBlock:^(PYCartesianSeries *series) {
            series.stackEqual(@"事件类型")
            .nameEqual(@"新增事件")
            .typeEqual(PYSeriesTypeBar)
            .dataEqual(barValues[3]);
        }]);
        
    }];
    
    [chartView setOption:option];
    [chartView loadEcharts];
}

- (void)setZRBarAndLineCombineChartView:(PYEchartsView *)chartView barValues:(NSArray *)barValues xValues:(NSArray *)xvals lineValues:(NSArray *)lineValues lineTitle:(NSString *)lineTitle{
    PYOption *option = [PYOption initPYOptionWithBlock:^(PYOption *option) {
        option.tooltipEqual([PYTooltip initPYTooltipWithBlock:^(PYTooltip *tooltip) {
            tooltip.triggerEqual(PYTooltipTriggerAxis)
            .axisPointerEqual([PYAxisPointer initPYAxisPointerWithBlock:^(PYAxisPointer *axisPoint) {
                axisPoint.typeEqual(PYAxisPointerTypeShadow);
            }]);
        }])
        .legendEqual([PYLegend initPYLegendWithBlock:^(PYLegend *legend) {
            legend.dataEqual(@[@"未销项",@"已销项",lineTitle]);
            legend.yEqual(@250);
        }])
        .gridEqual([PYGrid initPYGridWithBlock:^(PYGrid *grid) {
            grid.xEqual(@40).x2Equal(@50);
            grid.yEqual(@10);
            grid.heightEqual(@200);
        }])
        .dataZoomEqual([PYDataZoom initPYDataZoomWithBlock:^(PYDataZoom *dataZoom) {
            dataZoom.yEqual(@285);
            dataZoom.heightEqual(@10);
            dataZoom.showEqual(YES)
            .startEqual(@30)
            .endEqual(@70);
        }])
        
        //设置工具栏，一般咱们这个项目用不到，也没必要让产品知道还有这个高级功能
        .toolboxEqual([PYToolbox initPYToolboxWithBlock:^(PYToolbox *toolbox) {
            toolbox.showEqual(NO)
            .orientEqual(PYOrientVertical)
            .xEqual(PYPositionRight)
            .yEqual(PYPositionCenter)
            .featureEqual([PYToolboxFeature initPYToolboxFeatureWithBlock:^(PYToolboxFeature *feature) {
                feature.markEqual([PYToolboxFeatureMark initPYToolboxFeatureMarkWithBlock:^(PYToolboxFeatureMark *mark) {
                    mark.showEqual(YES);
                }])
                .dataViewEqual([PYToolboxFeatureDataView initPYToolboxFeatureDataViewWithBlock:^(PYToolboxFeatureDataView *dataView) {
                    dataView.showEqual(YES).readOnlyEqual(NO);
                }])
                .magicTypeEqual([PYToolboxFeatureMagicType initPYToolboxFeatureMagicTypeWithBlock:^(PYToolboxFeatureMagicType *magicType) {
                    magicType.showEqual(YES).typeEqual(@[PYSeriesTypeLine, PYSeriesTypeBar, @"stack", @"tiled"]);
                }])
                .restoreEqual([PYToolboxFeatureRestore initPYToolboxFeatureRestoreWithBlock:^(PYToolboxFeatureRestore *restore) {
                    restore.showEqual(YES);
                }]);
            }]);
        }])
        .calculableEqual(YES)
        //设置X轴title，有多少个就在数组中写入多少个
        .addXAxis([PYAxis initPYAxisWithBlock:^(PYAxis *axis) {
            axis.typeEqual(PYAxisTypeCategory)
            .addDataArr(xvals);
        }])
        
        
        .addYAxisArr(@[[PYAxis initPYAxisWithBlock:^(PYAxis *axis) {
            axis.typeEqual(PYAxisTypeValue);
            axis.positionEqual(PYPositionLeft);
            
        }],[PYAxis initPYAxisWithBlock:^(PYAxis *axis) {
            axis.typeEqual(PYAxisTypeValue);
            axis.positionEqual(PYPositionRight);
            axis.axisLabel.formatterEqual(@"{value} %");
        }]])
        
        .addSeriesArr(@[[PYCartesianSeries initPYCartesianSeriesWithBlock:^(PYCartesianSeries *series) {series.stackEqual(@"事件类型")
            .nameEqual(@"未销项")
            .typeEqual(PYSeriesTypeBar)
            .itemStyleEqual([PYItemStyle initPYItemStyleWithBlock:^(PYItemStyle *itemStyle) {
                itemStyle.normalEqual([PYItemStyleProp initPYItemStylePropWithBlock:^(PYItemStyleProp *normal) {
                    normal.labelEqual([PYLabel initPYLabelWithBlock:^(PYLabel *label) {
                        label.showEqual(YES).positionEqual(@"inside");
                    }]);
                }]);
            }])
            .dataEqual(barValues[0]);
            
        }],[PYCartesianSeries initPYCartesianSeriesWithBlock:^(PYCartesianSeries *series) {
            series.stackEqual(@"事件类型")
            .nameEqual(@"已销项")
            .typeEqual(PYSeriesTypeBar)
            .itemStyleEqual([PYItemStyle initPYItemStyleWithBlock:^(PYItemStyle *itemStyle) {
                itemStyle.normalEqual([PYItemStyleProp initPYItemStylePropWithBlock:^(PYItemStyleProp *normal) {
                    normal.labelEqual([PYLabel initPYLabelWithBlock:^(PYLabel *label) {
                        label.showEqual(YES).positionEqual(@"inside");
                    }]);
                }]);
            }])
            .dataEqual(barValues[1]);
            
        }],[PYCartesianSeries initPYCartesianSeriesWithBlock:^(PYCartesianSeries *series) {
            series.stackEqual(@"事件类型");
            series.nameEqual(@"销项率");
            series.yAxisIndexEqual(@(1))
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(lineValues)
            .itemStyleEqual([PYItemStyle initPYItemStyleWithBlock:^(PYItemStyle *itemStyle) {
                itemStyle.normalEqual([PYItemStyleProp initPYItemStylePropWithBlock:^(PYItemStyleProp *normal) {
                    normal.borderColorEqual([PYColor colorWithHexString:@"#fff"])
                    .borderWidthEqual(@2)
                    .labelEqual([PYLabel initPYLabelWithBlock:^(PYLabel *label) {
                        label.positionEqual(@"inside")
                        .formatterEqual(@"{c}%")
                        .textStyleEqual([PYTextStyle initPYTextStyleWithBlock:^(PYTextStyle *textStyle) {
                            textStyle.colorEqual([PYColor colorWithHexString:@"#fff"]);
                        }]);
                    }]);
                }]);
            }]);
        }]]);
        
        
    }];
    
    [chartView setOption:option];
    [chartView loadEcharts];
}

- (void)setZRSimpleBarChartView:(PYEchartsView *)chartView barValues:(NSArray *)barValues xValues:(NSArray *)xvals{
    PYOption *option = [PYOption initPYOptionWithBlock:^(PYOption *option) {
        
        option.tooltipEqual([PYTooltip initPYTooltipWithBlock:^(PYTooltip *tooltip) {
            tooltip.triggerEqual(PYTooltipTriggerAxis)
            .axisPointerEqual([PYAxisPointer initPYAxisPointerWithBlock:^(PYAxisPointer *axisPoint) {
                axisPoint.typeEqual(PYAxisPointerTypeShadow);
            }]);
        }])
        
        
        .legendEqual([PYLegend initPYLegendWithBlock:^(PYLegend *legend) {
            legend.dataEqual(@[@"新增事件"]);
            legend.yEqual(@300);
        }])
        .gridEqual([PYGrid initPYGridWithBlock:^(PYGrid *grid) {
            grid.xEqual(@40).x2Equal(@50);
            grid.yEqual(@10);
            grid.heightEqual(@250);
        }])
        
        .dataZoomEqual([PYDataZoom initPYDataZoomWithBlock:^(PYDataZoom *dataZoom) {
            dataZoom.yEqual(@335);
            dataZoom.heightEqual(@10);
            dataZoom.showEqual(YES)
            .startEqual(@30)
            .endEqual(@70);
        }])
        
        //设置工具栏，一般咱们这个项目用不到，也没必要让产品知道还有这个高级功能
        .toolboxEqual([PYToolbox initPYToolboxWithBlock:^(PYToolbox *toolbox) {
            toolbox.showEqual(NO)
            .orientEqual(PYOrientVertical)
            .xEqual(PYPositionRight)
            .yEqual(PYPositionCenter)
            .featureEqual([PYToolboxFeature initPYToolboxFeatureWithBlock:^(PYToolboxFeature *feature) {
                feature.markEqual([PYToolboxFeatureMark initPYToolboxFeatureMarkWithBlock:^(PYToolboxFeatureMark *mark) {
                    mark.showEqual(YES);
                }])
                .dataViewEqual([PYToolboxFeatureDataView initPYToolboxFeatureDataViewWithBlock:^(PYToolboxFeatureDataView *dataView) {
                    dataView.showEqual(YES).readOnlyEqual(NO);
                }])
                .magicTypeEqual([PYToolboxFeatureMagicType initPYToolboxFeatureMagicTypeWithBlock:^(PYToolboxFeatureMagicType *magicType) {
                    magicType.showEqual(YES).typeEqual(@[PYSeriesTypeLine, PYSeriesTypeBar, @"stack", @"tiled"]);
                }])
                .restoreEqual([PYToolboxFeatureRestore initPYToolboxFeatureRestoreWithBlock:^(PYToolboxFeatureRestore *restore) {
                    restore.showEqual(YES);
                }]);
            }]);
        }])
        .calculableEqual(NO)
        //设置X轴title，有多少个就在数组中写入多少个
        .addXAxis([PYAxis initPYAxisWithBlock:^(PYAxis *axis) {
            axis.typeEqual(PYAxisTypeCategory)
            .addDataArr(xvals);
        }])
        
        
        //设置Y轴title，一般默认是数字
        .addYAxis([PYAxis initPYAxisWithBlock:^(PYAxis *axis) {
            axis.typeEqual(PYAxisTypeValue);
            axis.positionEqual(PYPositionLeft);
        }])
        
        
        .addSeries([PYCartesianSeries initPYCartesianSeriesWithBlock:^(PYCartesianSeries *series) {
            series.stackEqual(@"事件类型")
            .nameEqual(@"新增事件")
            .typeEqual(PYSeriesTypeBar)
            .itemStyleEqual([PYItemStyle initPYItemStyleWithBlock:^(PYItemStyle *itemStyle) {
                itemStyle.normalEqual([PYItemStyleProp initPYItemStylePropWithBlock:^(PYItemStyleProp *normal) {
                    normal.labelEqual([PYLabel initPYLabelWithBlock:^(PYLabel *label) {
                        label.showEqual(YES).positionEqual(@"inside");
                    }]);
                }]);
            }])
            .dataEqual(barValues);
        }]);
        
    }];
    
    [chartView setOption:option];
    [chartView loadEcharts];
}

- (void)setZRMutiBarChartView:(PYEchartsView *)chartView barValues:(NSArray *)barValues xValues:(NSArray *)xvals{
    PYOption *option = [PYOption initPYOptionWithBlock:^(PYOption *option) {
        
        option.tooltipEqual([PYTooltip initPYTooltipWithBlock:^(PYTooltip *tooltip) {
            tooltip.triggerEqual(PYTooltipTriggerAxis)
            .axisPointerEqual([PYAxisPointer initPYAxisPointerWithBlock:^(PYAxisPointer *axisPoint) {
                axisPoint.typeEqual(PYAxisPointerTypeShadow);
            }]);
        }])
        
        
        .legendEqual([PYLegend initPYLegendWithBlock:^(PYLegend *legend) {
            legend.dataEqual(@[@"已处理",@"新增事件"]);
            legend.yEqual(@300);
        }])
        .gridEqual([PYGrid initPYGridWithBlock:^(PYGrid *grid) {
            grid.xEqual(@40).x2Equal(@50);
            grid.yEqual(@10);
            grid.heightEqual(@250);
        }])
        
        .dataZoomEqual([PYDataZoom initPYDataZoomWithBlock:^(PYDataZoom *dataZoom) {
            dataZoom.yEqual(@335);
            dataZoom.heightEqual(@10);
            dataZoom.showEqual(YES)
            .startEqual(@30)
            .endEqual(@70);
        }])
        
        //设置工具栏，一般咱们这个项目用不到，也没必要让产品知道还有这个高级功能
        .toolboxEqual([PYToolbox initPYToolboxWithBlock:^(PYToolbox *toolbox) {
            toolbox.showEqual(NO)
            .orientEqual(PYOrientVertical)
            .xEqual(PYPositionRight)
            .yEqual(PYPositionCenter)
            .featureEqual([PYToolboxFeature initPYToolboxFeatureWithBlock:^(PYToolboxFeature *feature) {
                feature.markEqual([PYToolboxFeatureMark initPYToolboxFeatureMarkWithBlock:^(PYToolboxFeatureMark *mark) {
                    mark.showEqual(YES);
                }])
                .dataViewEqual([PYToolboxFeatureDataView initPYToolboxFeatureDataViewWithBlock:^(PYToolboxFeatureDataView *dataView) {
                    dataView.showEqual(YES).readOnlyEqual(NO);
                }])
                .magicTypeEqual([PYToolboxFeatureMagicType initPYToolboxFeatureMagicTypeWithBlock:^(PYToolboxFeatureMagicType *magicType) {
                    magicType.showEqual(YES).typeEqual(@[PYSeriesTypeLine, PYSeriesTypeBar, @"stack", @"tiled"]);
                }])
                .restoreEqual([PYToolboxFeatureRestore initPYToolboxFeatureRestoreWithBlock:^(PYToolboxFeatureRestore *restore) {
                    restore.showEqual(YES);
                }]);
            }]);
        }])
        .calculableEqual(NO)
        //设置X轴title，有多少个就在数组中写入多少个
        .addXAxis([PYAxis initPYAxisWithBlock:^(PYAxis *axis) {
            axis.typeEqual(PYAxisTypeCategory)
            .addDataArr(xvals);
        }])
        
        
        //设置Y轴title，一般默认是数字
        .addYAxis([PYAxis initPYAxisWithBlock:^(PYAxis *axis) {
            axis.typeEqual(PYAxisTypeValue);
            axis.positionEqual(PYPositionLeft);
        }])
        
        
        //这个地方设置X轴每个单位中有几个柱状图，每个柱状图有几层，这个🐔8玩意设置有够变态。stackEqual这个属性相同，nameEqual不同就会绘制堆积柱状图。stackEqual属性不同，就会绘制多个柱子
        .addSeries([PYCartesianSeries initPYCartesianSeriesWithBlock:^(PYCartesianSeries *series) {
            series.stackEqual(@"事件类型1")
            .nameEqual(@"已处理")
            .typeEqual(PYSeriesTypeBar)
            .itemStyleEqual([PYItemStyle initPYItemStyleWithBlock:^(PYItemStyle *itemStyle) {
                itemStyle.normalEqual([PYItemStyleProp initPYItemStylePropWithBlock:^(PYItemStyleProp *normal) {
                    normal.labelEqual([PYLabel initPYLabelWithBlock:^(PYLabel *label) {
                        label.showEqual(YES).positionEqual(@"inside");
                    }]);
                }]);
            }])
            .dataEqual(barValues[0]);
        }])
        .addSeries([PYCartesianSeries initPYCartesianSeriesWithBlock:^(PYCartesianSeries *series) {
            series.stackEqual(@"事件类型2")
            .nameEqual(@"新增事件")
            .typeEqual(PYSeriesTypeBar)
            .itemStyleEqual([PYItemStyle initPYItemStyleWithBlock:^(PYItemStyle *itemStyle) {
                itemStyle.normalEqual([PYItemStyleProp initPYItemStylePropWithBlock:^(PYItemStyleProp *normal) {
                    normal.labelEqual([PYLabel initPYLabelWithBlock:^(PYLabel *label) {
                        label.showEqual(YES).positionEqual(@"inside");
                    }]);
                }]);
            }])
            .dataEqual(barValues[1]);
        }]);
        
    }];
    
    [chartView setOption:option];
    [chartView loadEcharts];
}

- (void)setZRSimplePieChartView:(PYEchartsView *)chartView pieValues:(NSArray *)pieValues pieData:(NSArray *)pieData{
    PYOption *option = [PYOption initPYOptionWithBlock:^(PYOption *option) {

        option.tooltipEqual([PYTooltip initPYTooltipWithBlock:^(PYTooltip *tooltip) {
            tooltip.triggerEqual(PYTooltipTriggerItem)
            .formatterEqual(@"{a} <br/>{b} : {c} ({d}%)");
        }])
        .legendEqual([PYLegend initPYLegendWithBlock:^(PYLegend *legend) {
            legend.orientEqual(PYOrientHorizontal)
            .xEqual(PYPositionCenter)
            .yEqual(@300)
            .dataEqual(pieValues);
        }])
        
        .toolboxEqual([PYToolbox initPYToolboxWithBlock:^(PYToolbox *toolbox) {
            toolbox.showEqual(NO)
            .featureEqual([PYToolboxFeature initPYToolboxFeatureWithBlock:^(PYToolboxFeature *feature) {
                feature.markEqual([PYToolboxFeatureMark initPYToolboxFeatureMarkWithBlock:^(PYToolboxFeatureMark *mark) {
                    mark.showEqual(YES);
                }])
                .dataViewEqual([PYToolboxFeatureDataView initPYToolboxFeatureDataViewWithBlock:^(PYToolboxFeatureDataView *dataView) {
                    dataView.showEqual(YES).readOnlyEqual(NO);
                }])
                .magicTypeEqual([PYToolboxFeatureMagicType initPYToolboxFeatureMagicTypeWithBlock:^(PYToolboxFeatureMagicType *magicType) {
                    magicType.showEqual(YES).typeEqual(@[PYSeriesTypePie, PYSeriesTypeFunnel]).optionEqual(@{@"funnel":@{@"x":@"25%",@"width":@"50%",@"funnelAlign":PYPositionLeft,@"max":@(1548)}});
                    
                }])
                .restoreEqual([PYToolboxFeatureRestore initPYToolboxFeatureRestoreWithBlock:^(PYToolboxFeatureRestore *restore) {
                    restore.showEqual(YES);
                }]);
            }]);
        }])
        .addSeries([PYPieSeries initPYPieSeriesWithBlock:^(PYPieSeries *series) {
            //显示饼的大小，百分比越大饼图越大
            series.radiusEqual(@"55%")
            //圆饼中点在图中的位置，第一个为X轴，第二个为Y轴
            .centerEqual(@[@"50%",@"40%"])
            .nameEqual(@"访问来源")
            .typeEqual(PYSeriesTypePie)
            .itemStyleEqual([PYItemStyle initPYItemStyleWithBlock:^(PYItemStyle *itemStyle) {
                itemStyle.normalEqual([PYItemStyleProp initPYItemStylePropWithBlock:^(PYItemStyleProp *itemStyleProp){
                    itemStyleProp.labelEqual([PYLabel initPYLabelWithBlock:^(PYLabel *label) {
                        //是否显示文字
                        label.showEqual(YES);
                        //这里设置的是显示的类型，百分比或者别的
                        label.formatterEqual(@"{c}%");
                        
                    }])
                    .labelLineEqual([PYLabelLine initPYLabelLineWithBlock:^(PYLabelLine *labelLine) {
                        //是否显示线条
                        labelLine.showEqual(YES);
                    }]);
                }]);
                
            }])
            .dataEqual(pieData);
        }]);
    }];
    
    [chartView setOption:option];
    [chartView loadEcharts];
}

- (void)setZRSimpleRingChartView:(PYEchartsView *)chartView ringValues:(NSArray *)pieValues ringData:(NSArray *)pieData{
    
    PYOption *option = [PYOption initPYOptionWithBlock:^(PYOption *option) {
        option.tooltipEqual([PYTooltip initPYTooltipWithBlock:^(PYTooltip *tooltip) {
            tooltip.triggerEqual(PYTooltipTriggerItem)
            .formatterEqual(@"{a} <br/>{b} : {c} ({d}%)");
        }])
        .legendEqual([PYLegend initPYLegendWithBlock:^(PYLegend *legend) {
            legend.orientEqual(PYOrientHorizontal)
            .xEqual(PYPositionCenter)
            .yEqual(@300)
            .dataEqual(pieValues);
        }])
        .toolboxEqual([PYToolbox initPYToolboxWithBlock:^(PYToolbox *toolbox) {
            toolbox.showEqual(NO)
            .featureEqual([PYToolboxFeature initPYToolboxFeatureWithBlock:^(PYToolboxFeature *feature) {
                feature.markEqual([PYToolboxFeatureMark initPYToolboxFeatureMarkWithBlock:^(PYToolboxFeatureMark *mark) {
                    mark.showEqual(YES);
                }])
                .dataViewEqual([PYToolboxFeatureDataView initPYToolboxFeatureDataViewWithBlock:^(PYToolboxFeatureDataView *dataView) {
                    dataView.showEqual(YES).readOnlyEqual(NO);
                }])
                .magicTypeEqual([PYToolboxFeatureMagicType initPYToolboxFeatureMagicTypeWithBlock:^(PYToolboxFeatureMagicType *magicType) {
                    magicType.showEqual(YES).typeEqual(@[PYSeriesTypePie, PYSeriesTypeFunnel]).optionEqual(@{@"funnel":@{@"x":@"25%",@"width":@"50%",@"funnelAlign":PYPositionCenter,@"max":@(1548)}});
                    
                }])
                .restoreEqual([PYToolboxFeatureRestore initPYToolboxFeatureRestoreWithBlock:^(PYToolboxFeatureRestore *restore) {
                    restore.showEqual(YES);
                }]);
            }]);
        }])
        .calculableEqual(YES)
        .addSeries([PYPieSeries initPYPieSeriesWithBlock:^(PYPieSeries *series) {
            series.radiusEqual(@[@"40%",@"60%"])
            .nameEqual(@"访问来源")
            .typeEqual(PYSeriesTypePie)
            .dataEqual(pieData)
            .itemStyleEqual([PYItemStyle initPYItemStyleWithBlock:^(PYItemStyle *itemStyle) {
                itemStyle.normalEqual([PYItemStyleProp initPYItemStylePropWithBlock:^(PYItemStyleProp *itemStyleProp){
                    itemStyleProp.labelEqual([PYLabel initPYLabelWithBlock:^(PYLabel *label) {
                        label.showEqual(YES);
                    }])
                    .labelLineEqual([PYLabelLine initPYLabelLineWithBlock:^(PYLabelLine *labelLine) {
                        labelLine.showEqual(YES);
                    }]);
                }])
                .emphasisEqual([PYItemStyleProp initPYItemStylePropWithBlock:^(PYItemStyleProp *itemStyleProp){
                    itemStyleProp.labelEqual([PYLabel initPYLabelWithBlock:^(PYLabel *label) {
                        label.showEqual(YES).positionEqual(PYPositionCenter)
                        .textStyleEqual([PYTextStyle initPYTextStyleWithBlock:^(PYTextStyle *textStyle) {
                            textStyle.fontSizeEqual(@30)
                            .fontWeightEqual(PYTextStyleFontWeightBold);
                        }]);
                    }]);
                }]);
            }]);
        }]);
    }];
    
    [chartView setOption:option];
    [chartView loadEcharts];
}

@end
