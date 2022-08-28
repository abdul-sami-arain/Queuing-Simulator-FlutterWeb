import 'package:flutter/material.dart';
import 'package:queuesim/controllers/stateProvider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Hist4 extends StatefulWidget {
  const Hist4({Key? key}) : super(key: key);

  @override
  State<Hist4> createState() => _Hist4State();
}

class _Hist4State extends State<Hist4> {
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
          tooltipBehavior: _tooltipBehavior,
          title: ChartTitle(
                  text: 'Service analysis',
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
                palette: <Color>[
                            Colors.teal,],
          series: <ChartSeries>[
      HistogramSeries<HISTDATA_SERVICE, double>(
          enableTooltip: true,
          dataSource: state.histDataService,
          width: 0.5,
          showNormalDistributionCurve: true,
          curveColor: const Color.fromRGBO(192, 108, 132, 1),
          binInterval: 1,
          yValueMapper: (HISTDATA_SERVICE data, _) => data.Y)
    ]));
    
  }
}
