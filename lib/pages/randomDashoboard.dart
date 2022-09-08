import 'dart:convert' as convert;
import 'dart:convert';
import 'package:queuesim/controllers/timelyHIST2.dart';
import 'package:queuesim/controllers/timelyHIST3.dart';
import 'package:queuesim/controllers/timelyHIST4.dart';
import 'package:queuesim/controllers/timelySTEP1.dart';
import 'package:queuesim/pages/averageResults.dart';
import 'package:queuesim/pages/timelyRADIAL.dart';
import 'package:queuesim/widgets/directInput.dart';
import 'package:queuesim/widgets/hist2.dart';
import 'package:queuesim/widgets/hist3.dart';
import 'package:queuesim/widgets/hist4.dart';
import 'package:queuesim/widgets/indirectOutput.dart';
import 'package:queuesim/widgets/mainHeading.dart';
import 'package:queuesim/widgets/radialbar.dart';
import 'package:queuesim/widgets/step1.dart';
import 'package:queuesim/widgets/subhead.dart';
import 'package:queuesim/widgets/subheading2.dart';
import 'package:universal_io/io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:queuesim/controllers/stateProvider.dart';
import 'package:queuesim/pages/directLandingPage.dart';
import 'package:queuesim/pages/indirectLandingPage.dart';
import 'package:queuesim/widgets/button.dart';
import 'package:queuesim/widgets/paragraph.dart';
import 'package:http/http.dart' as http;

import '../model/ExcelGet.dart';

class RandomDashboard1 extends StatelessWidget {
  const RandomDashboard1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>((context), listen: false);
    int count1 = state.count;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.data_array,
                  color: Colors.white,
                ),
                text: "Random Data",
              ),
              Tab(
                  icon: Icon(Icons.data_array, color: Colors.white),
                  text: "Randsim Data"),
              Tab(
                icon: Icon(
                  Icons.data_array,
                  color: Colors.white,
                ),
                text: "Randsim Results",
              ),
              Tab(
                  icon: Icon(Icons.timelapse, color: Colors.white),
                  text: "Time Rand Data"),
              Tab(
                  icon: Icon(Icons.timelapse, color: Colors.white),
                  text: "TimeRandsim Data"),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(Icons.restart_alt_outlined),
                onPressed: () {
                  state.increment();
                  state.x = 0;
                  state.cdf.clear();
                  state.cdf2.clear();
                  state.obs.clear();
                  state.randomNumbers.clear();
                  state.Interarrivals.clear();
                  state.service.clear();
                  state.arrivals.clear();
                  state.customers.clear();
                  state.valuess.clear();
                  state.totalArrival = 0;
                  state.totalService = 0;
                  state.totalIAT = 0;
                  state.totalIdle = 0;
                  state.totalWTQ = 0;
                  state.totalTAT = 0;
                  state.AvgTimeCustSpendMartSingle = 0;
                  state.AvgTimeCustWaitMartSingle = 0;
                  state.AvgTimeServiceMartSingle = 0;
                  state.AvgIATSingle = 0;
                  state.AvgWaitTimeWhoWait = 0;
                  state.idlePercSingle = 0;
                  state.utilzePercSingle = 0;
                  state.InterArrivalList.clear();
                  state.ServiceList.clear();

                  state.timelyInterarrivals.clear();
                  state.timelyservice.clear();
                  state.timelyarrivals.clear();
                  state.timelyServiceStart.clear();
                  state.timelyServiceEnd.clear();
                  state.timelyIdle.clear();
                  state.timelyTAT.clear();
                  state.timelyWTQ.clear();
                  state.timelytotalArrival = 0;
                  state.timelytotalService = 0;
                  state.timelytotalIAT = 0;
                  state.timelytotalTAT = 0;
                  state.timelytotalWTQ = 0;
                  state.timelytotalIdle = 0;
                  state.timelytotalServer1 = 0;
                  state.timelytotalServer2 = 0;
                  state.timelyAvgTimeCustSpendMartSingle = 0;
                  state.timelyAvgTimeCustWaitMartSingle = 0;
                  state.timelyAvgTimeServiceMartSingle = 0;
                  state.timelyAvgIATSingle = 0;
                  state.timelyAvgWaitTimeWhoWait = 0;
                  state.timelyidlePercSingle = 0;
                  state.timelyutilzePercSingle = 0;
                  state.timelyutilzePercServer1 = 0;
                  state.timelyutilzePercServer2 = 0;

                  state.timelyserver1.clear();
                  state.timelyserver2.clear();
                  state.timelyvaluess.clear();
                  state.timelycustomers.clear();
                  state.radial1data.clear();

                  state.InterArrivalService.clear();
                  state.InterArrivalServiceMulti.clear();
                  state.InterArrivalList.clear();
                  state.ServiceList.clear();
                  state.ArrivalList.clear();
                  state.ServiceStart.clear();
                  state.ServiceEnd.clear();
                  state.Idle.clear();
                  state.TAT.clear();
                  state.WTQ.clear();

                  state.RandomlyGeneration();
                  state.SingleTimeSimu();
                  print(state.count);

                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text("Alert Dialog Box"),
                      content: Text("You iterate ${state.count} time"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: Container(
                            color: Colors.teal,
                            padding: const EdgeInsets.all(14),
                            child: const Text(
                              "okay",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    state.historySend();
                     Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AverageResults()));
                  },
                  child: Text("Avg Results")),
            )
          ],
          title: subhead(
              heading:
                  "Generation Of Poisson Arrivals & Service Time by Random Numbers",
              R: 255,
              G: 255,
              B: 255),
        ),
        body: TabBarView(
          children: [
            RandomResults(),
            SimulationResults(),
            Screen3(),
            RandomTimelyDATA(),
            Screen4(),
          ],
        ),
      ),
    );
  }
}

class RandomResults extends StatelessWidget {
  const RandomResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>((context), listen: false);
    return SingleChildScrollView(
      controller: ScrollController(),
      scrollDirection: Axis.vertical,
      child: Column(children: [
        SizedBox(
          height: 10,
        ),
        Container(
          child: DataTable(
              dataRowHeight: 50,
              headingRowHeight: 70,
              columns: [
                DataColumn(
                  label: Text(
                    "Cummulative Probability",
                  ),
                ),
                DataColumn(
                  label: Text("Probability Lookup"),
                ),
                DataColumn(
                  label: Text("Random Variables"),
                ),
                DataColumn(
                  label: Text("Random Numbers"),
                ),
                DataColumn(
                  label: Text("Inter Arrival Time"),
                ),
                DataColumn(
                  label: Text("Arrival Time"),
                ),
                DataColumn(
                  label: Text("Service Time"),
                ),
              ],
              rows: state.randomdata
                  .map((e) => DataRow(cells: [
                        DataCell(
                          Text(e.A.toString()),
                        ),
                        DataCell(
                          Text(e.B.toString()),
                        ),
                        DataCell(
                          Text(e.C.toString()),
                        ),
                        DataCell(
                          Text(e.D.toString()),
                        ),
                        DataCell(
                          Text(e.E.toString()),
                        ),
                        DataCell(
                          Text(e.F.toString()),
                        ),
                        DataCell(
                          Text(e.G.toString()),
                        ),
                      ]))
                  .toList()),
        )
      ]),
    );
  }
}

class SimulationResults extends StatelessWidget {
  const SimulationResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>((context), listen: false);
    return SingleChildScrollView(
      controller: ScrollController(),
      scrollDirection: Axis.vertical,
      child: Column(children: [
        SizedBox(
          height: 10,
        ),
        Container(
          child: DataTable(
              dataRowHeight: 50,
              headingRowHeight: 70,
              columns: [
                DataColumn(
                  label: Text(
                    "InterArrival",
                  ),
                ),
                DataColumn(
                  label: Text("Arrival"),
                ),
                DataColumn(
                  label: Text("Service"),
                ),
                DataColumn(
                  label: Text("Service Start"),
                ),
                DataColumn(
                  label: Text("Service End"),
                ),
                DataColumn(
                  label: Text("Idle"),
                ),
                DataColumn(
                  label: Text("TAT"),
                ),
                DataColumn(
                  label: Text("WTQ"),
                ),
              ],
              rows: state.InterArrivalService.map((e) => DataRow(cells: [
                    DataCell(
                      Text(e.A.toString()),
                    ),
                    DataCell(
                      Text(e.C.toString()),
                    ),
                    DataCell(
                      Text(e.B.toString()),
                    ),
                    DataCell(
                      Text(e.D.toString()),
                    ),
                    DataCell(
                      Text(e.E.toString()),
                    ),
                    DataCell(
                      Text(e.F.toString()),
                    ),
                    DataCell(
                      Text(e.G.toString()),
                    ),
                    DataCell(
                      Text(e.H.toString()),
                    ),
                  ])).toList()),
        )
      ]),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>((context), listen: false);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      controller: ScrollController(),
      child: Container(
        color: Colors.white,
        child: Column(children: [
          SizedBox(
            height: 10,
          ),
          MainHeading(
              heading: "Graphical Illustration Of Data:", R: 55, G: 57, B: 59),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 400,
                width: 400,
                child: RadialBar1(),
              ),
              Container(
                height: 400,
                width: 700,
                child: Step1(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 400,
                width: 400,
                child: Hist2(),
              ),
              Container(
                height: 400,
                width: 400,
                child: Hist3(),
              ),
              Container(
                height: 400,
                width: 400,
                child: Hist4(),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          MainHeading(
              heading: "Statistics of Simulation::", R: 55, G: 57, B: 59),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: InDirectInputContainer1(
                    val: state.AvgTimeCustSpendMartSingle,
                    IR: 55,
                    IG: 57,
                    IB: 59,
                    Headval: "Avg Turn Around Time",
                    Unitval: "min"),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: InDirectInputContainer1(
                  val: state.AvgTimeCustWaitMartSingle,
                  IR: 39,
                  IG: 91,
                  IB: 212,
                  Headval: "Avg Wait time in Mart:",
                  Unitval: "min",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: InDirectInputContainer1(
                  val: state.AvgTimeServiceMartSingle,
                  IR: 214,
                  IG: 1,
                  IB: 54,
                  Headval: "Avg Service Time of Mart:",
                  Unitval: "min",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: InDirectInputContainer1(
                  val: state.AvgIATSingle,
                  IR: 276,
                  IG: 176,
                  IB: 1,
                  Headval: "Avg InterArrival Time:",
                  Unitval: "min",
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: InDirectInputContainer1(
                    val: state.AvgWaitTimeWhoWait,
                    IR: 55,
                    IG: 57,
                    IB: 59,
                    Headval: "Avg WaitingTime of Those who wait:",
                    Unitval: "min"),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: InDirectInputContainer1(
                    val: state.idlePercSingle,
                    IR: 55,
                    IG: 57,
                    IB: 59,
                    Headval: "Server Idle",
                    Unitval: "%"),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: InDirectInputContainer1(
                  val: state.utilzePercSingle,
                  IR: 276,
                  IG: 176,
                  IB: 1,
                  Headval: "Server Utilization:",
                  Unitval: "%",
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ]),
      ),
    );
  }
}

class RandomTimelyDATA extends StatefulWidget {
  const RandomTimelyDATA({Key? key}) : super(key: key);

  @override
  State<RandomTimelyDATA> createState() => _RandomTimelyDATAState();
}

class _RandomTimelyDATAState extends State<RandomTimelyDATA> {
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>((context), listen: false);
    return SingleChildScrollView(
      controller: ScrollController(),
      scrollDirection: Axis.vertical,
      child: Column(children: [
        SizedBox(
          height: 10,
        ),
        Container(
          child: DataTable(
              dataRowHeight: 50,
              headingRowHeight: 70,
              columns: [
                DataColumn(
                  label: Text(
                    "InterArrival",
                  ),
                ),
                DataColumn(
                  label: Text("Arrival"),
                ),
                DataColumn(
                  label: Text("Service"),
                ),
                DataColumn(
                  label: Text("Service Start"),
                ),
                DataColumn(
                  label: Text("Service End"),
                ),
                DataColumn(
                  label: Text("Idle"),
                ),
                DataColumn(
                  label: Text("TAT"),
                ),
                DataColumn(
                  label: Text("WTQ"),
                ),
              ],
              rows: state.randomtimely
                  .map((e) => DataRow(cells: [
                        DataCell(
                          Text(e.A.toString()),
                        ),
                        DataCell(
                          Text(e.C.toString()),
                        ),
                        DataCell(
                          Text(e.B.toString()),
                        ),
                        DataCell(
                          Text(e.D.toString()),
                        ),
                        DataCell(
                          Text(e.E.toString()),
                        ),
                        DataCell(
                          Text(e.F.toString()),
                        ),
                        DataCell(
                          Text(e.G.toString()),
                        ),
                        DataCell(
                          Text(e.H.toString()),
                        ),
                      ]))
                  .toList()),
        )
      ]),
    );
  }
}

class Screen4 extends StatelessWidget {
  const Screen4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>((context), listen: false);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      controller: ScrollController(),
      child: Container(
        color: Colors.white,
        child: Column(children: [
          SizedBox(
            height: 10,
          ),
          MainHeading(
              heading: "Graphical Illustration Of Data:", R: 55, G: 57, B: 59),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 400,
                width: 400,
                child: TIMELYRADIAL(),
              ),
              Container(
                height: 400,
                width: 700,
                child: STEP1TIMELY(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 400,
                width: 400,
                child: HIST2TIMELY(),
              ),
              Container(
                height: 400,
                width: 400,
                child: HIST3TIMELY(),
              ),
              Container(
                height: 400,
                width: 400,
                child: HIST4TIMELY(),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          MainHeading(
              heading: "Statistics of Simulation::", R: 55, G: 57, B: 59),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: InDirectInputContainer1(
                    val: state.timelyAvgTimeCustSpendMartSingle,
                    IR: 55,
                    IG: 57,
                    IB: 59,
                    Headval: "Avg Turn Around Time",
                    Unitval: "min"),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: InDirectInputContainer1(
                  val: state.timelyAvgTimeCustWaitMartSingle,
                  IR: 39,
                  IG: 91,
                  IB: 212,
                  Headval: "Avg Wait time in Mart:",
                  Unitval: "min",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: InDirectInputContainer1(
                  val: state.timelyAvgTimeServiceMartSingle,
                  IR: 214,
                  IG: 1,
                  IB: 54,
                  Headval: "Avg Service Time of Mart:",
                  Unitval: "min",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: InDirectInputContainer1(
                  val: state.timelyAvgIATSingle,
                  IR: 276,
                  IG: 176,
                  IB: 1,
                  Headval: "Avg InterArrival Time:",
                  Unitval: "min",
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: InDirectInputContainer1(
                    val: state.timelyAvgWaitTimeWhoWait,
                    IR: 55,
                    IG: 57,
                    IB: 59,
                    Headval: "Avg WaitingTime of Those who wait:",
                    Unitval: "min"),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: InDirectInputContainer1(
                    val: state.timelyidlePercSingle,
                    IR: 55,
                    IG: 57,
                    IB: 59,
                    Headval: "Server Idle",
                    Unitval: "%"),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: InDirectInputContainer1(
                  val: state.timelyutilzePercSingle,
                  IR: 276,
                  IG: 176,
                  IB: 1,
                  Headval: "Server Utilization:",
                  Unitval: "%",
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ]),
      ),
    );
  }
}
