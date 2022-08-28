import 'package:flutter/material.dart';
import 'package:queuesim/controllers/stateProvider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HIST2TIMELY extends StatefulWidget {
  const HIST2TIMELY({Key? key}) : super(key: key);

  @override
  State<HIST2TIMELY> createState() => _HIST2TIMELYState();
}

class _HIST2TIMELYState extends State<HIST2TIMELY> {
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
      HistogramSeries<TIMELYHISTDATA, double>(
          enableTooltip: true,
          dataSource: state.timelyhistData,
          width: 0.5,
          showNormalDistributionCurve: true,
          curveColor: const Color.fromRGBO(192, 108, 132, 1),
          binInterval: 1,
          yValueMapper: (TIMELYHISTDATA data, _) => data.Y)
          
    ]));
  }
}
