import 'package:flutter/material.dart';
import 'package:queuesim/controllers/stateProvider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TIMELYRADIAL extends StatefulWidget {
  const TIMELYRADIAL({Key? key}) : super(key: key);

  @override
  State<TIMELYRADIAL> createState() => _TIMELYRADIALState();
}

class _TIMELYRADIALState extends State<TIMELYRADIAL> {
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
      child: SfCircularChart(
        legend: Legend(isVisible: true,overflowMode: LegendItemOverflowMode.wrap),
        title: ChartTitle(
                  text: 'Customer Time Distr',
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
                        series: <CircularSeries>[
                          
                            // Renders radial bar chart
                            PieSeries<TIMELYRADIAL1, String>(
                              
                             
                              radius: '100%',
                              
                                dataSource: state.timelyradial1data,
                                xValueMapper: (TIMELYRADIAL1 data, _) => data.para,
                                yValueMapper: (TIMELYRADIAL1 data, _) => data.val,
                                pointColorMapper:(TIMELYRADIAL1 data, _) => data.col,
                               
                               
                            ),
                            
                        ]
                    ),
    );
  }
}