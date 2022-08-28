import 'package:flutter/material.dart';
import 'package:queuesim/controllers/stateProvider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Hist2 extends StatefulWidget {
  const Hist2({Key? key}) : super(key: key);

  @override
  State<Hist2> createState() => _Hist2State();
}

class _Hist2State extends State<Hist2> {
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
                  text: 'InterArrival analysis',
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
      HistogramSeries<HISTDATA, double>(
          enableTooltip: true,
          dataSource: state.histData,
          width: 0.5,
          showNormalDistributionCurve: true,
          curveColor: const Color.fromRGBO(192, 108, 132, 1),
          binInterval: 1,
          yValueMapper: (HISTDATA data, _) => data.Y)
          
    ]));
  }
}
