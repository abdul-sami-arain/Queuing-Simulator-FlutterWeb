import 'package:flutter/material.dart';
import 'package:queuesim/controllers/stateProvider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HIST3TIMELY extends StatefulWidget {
  const HIST3TIMELY({Key? key}) : super(key: key);

  @override
  State<HIST3TIMELY> createState() => _HIST3TIMELYState();
}

class _HIST3TIMELYState extends State<HIST3TIMELY> {
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
                  text: 'Arrival analysis',
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
      HistogramSeries<TIMELY_HISTDATA_ARRIVAL, double>(
          enableTooltip: true, 
          dataSource: state.timelyhistDataArrival,
          width: 0.5,
          showNormalDistributionCurve: true,
          curveColor: const Color.fromRGBO(192, 108, 132, 1),
          binInterval: 1,
          yValueMapper: (TIMELY_HISTDATA_ARRIVAL data, _) => data.Y,
      )
          
    ]));
  }
}