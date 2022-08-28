import 'package:flutter/material.dart';
import 'package:queuesim/controllers/stateProvider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Step1 extends StatefulWidget {
  const Step1({Key? key}) : super(key: key);

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
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
                            
                            LineSeries<STEP1, num>(
                              dataLabelSettings: DataLabelSettings(
                                    // Renders the data label
                                    isVisible: true,
                                    useSeriesColor: true,
                                ),
                              enableTooltip: true,
                                dataSource: state.step1data,
                                name:'WTQ',
                                xValueMapper: (STEP1 data, _) => data.start ,
                                yValueMapper: (STEP1 data, _) => data.end,
                            ),
                            LineSeries<STEP1, num>(
                              dataLabelSettings: DataLabelSettings(
                                    // Renders the data label
                                    isVisible: true,
                                    useSeriesColor: true,
                                ),
                              enableTooltip: true,
                              name:'TAT',
                                dataSource: state.step1data,
                                xValueMapper: (STEP1 data, _) => data.start ,
                                yValueMapper: (STEP1 data, _) => data.end1,
                            )
                        ]
                    ),
    );
  }
}

