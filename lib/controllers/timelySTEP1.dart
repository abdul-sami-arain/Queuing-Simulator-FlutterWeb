import 'package:flutter/material.dart';
import 'package:queuesim/controllers/stateProvider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class STEP1TIMELY extends StatefulWidget {
  const STEP1TIMELY({Key? key}) : super(key: key);

  @override
  State<STEP1TIMELY> createState() => _STEP1TIMELYState();
}

class _STEP1TIMELYState extends State<STEP1TIMELY> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>((context), listen: false);
    return Container(
      child: SfCartesianChart(
        title: ChartTitle(
                  text: 'TAT/WTQ - Customer',
                  backgroundColor: Colors.white,
                  borderColor: Colors.blue,
                  borderWidth: 2,
                  // Aligns the chart title to left
                  alignment: ChartAlignment.near,
                  textStyle: TextStyle(
                    color: Colors.teal,
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                  )
                ),
        legend: Legend(
                isVisible: true,
                // Overflowing legend content will be wraped
                offset: Offset(20, 40),
                
              ),
                        primaryXAxis: CategoryAxis(),
                        
                        series: <ChartSeries>[
                            // Renders step line chart
                            
                            LineSeries<TIMELY_STEP1, num>(
                              dataLabelSettings: DataLabelSettings(
                                    // Renders the data label
                                    isVisible: true,
                                    useSeriesColor: true,
                                ),
                              enableTooltip: true,
                                dataSource: state.timelystep1data,
                                name:'WTQ',
                                xValueMapper: (TIMELY_STEP1 data, _) => data.start ,
                                yValueMapper: (TIMELY_STEP1 data, _) => data.end,
                            ),
                            LineSeries<TIMELY_STEP1, num>(
                              dataLabelSettings: DataLabelSettings(
                                    // Renders the data label
                                    isVisible: true,
                                    useSeriesColor: true,
                                ),
                              enableTooltip: true,
                              name:'TAT',
                                dataSource: state.timelystep1data,
                                xValueMapper: (TIMELY_STEP1 data, _) => data.start ,
                                yValueMapper: (TIMELY_STEP1 data, _) => data.end1,
                            )
                        ]
                    ),
    );
  }
}