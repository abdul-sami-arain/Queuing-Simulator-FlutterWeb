import 'dart:convert' as convert;
import 'dart:convert';
import 'package:queuesim/controllers/timelyHIST2.dart';
import 'package:queuesim/controllers/timelyHIST3.dart';
import 'package:queuesim/controllers/timelyHIST4.dart';
import 'package:queuesim/controllers/timelySTEP1.dart';
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

class MultiRandomDashboard1 extends StatelessWidget {
  const MultiRandomDashboard1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>((context), listen: false);
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
          title: MainHeading(
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
    return Container(
      child: SingleChildScrollView(
        controller: ScrollController(),
        scrollDirection: Axis.vertical,
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.teal),
          child: DataTable(
              dataRowHeight: 50,
              headingRowHeight: 70,
              columns: [
                DataColumn(
                  label: Container(
                      width: 20,
                      child: Text(
                        "IAT",
                      )),
                ),
                DataColumn(
                  label: Container(width: 50, child: Text("Arrival")),
                ),
                DataColumn(
                  label: Container(width: 50, child: Text("Service")),
                ),
                DataColumn(
                  label: Container(width: 50, child: Text("Start")),
                ),
                DataColumn(
                  label: Container(width: 25, child: Text("End")),
                ),
                DataColumn(
                  label: Container(width: 25, child: Text("TAT")),
                ),
                DataColumn(
                  label: Container(width: 40, child: Text("WTQ")),
                ),
                DataColumn(
                  label: Container(width: 50, child: Text("Server1")),
                ),
                DataColumn(
                  label: Container(width: 50, child: Text("Server2")),
                ),
              ],
              rows: state.InterArrivalServiceMulti.map((e) => DataRow(cells: [
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
                    DataCell(
                      Text(e.I.toString()),
                    ),
                  ])).toList()),
        ),
      ),
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
                    child: InDirectInputContainer1(val: state.AvgTimeCustSpendMartSingle, IR: 55,
                                          IG: 57,
                                          IB: 59, Headval: "Avg Turn Around Time", Unitval: "minutes"),
                  ),
              SizedBox(
                height: 10,
              ),
               Container(
                    child:  InDirectInputContainer1(
                                        val: state.AvgTimeCustWaitMartSingle,
                                        IR: 39,
                                        IG: 91,
                                        IB: 212,
                                        Headval: "Avg Wait time in Mart:",
                                        Unitval: "minutes",
                          ),
                  ),
              SizedBox(
                height: 10,
              ),
               Container(
                    child:  InDirectInputContainer1(
                                        val: state.AvgTimeServiceMartSingle,
                                        IR: 214,
                                        IG: 1,
                                        IB: 54,
                                        Headval: "Avg Service Time of Mart:",
                                        Unitval: "minutes",
                                      ),
                  ),
              SizedBox(
                height: 10,
              ),
              Container(
                    child:  InDirectInputContainer1(
                                        val: state.AvgIATSingle,
                                        IR: 276,
                                        IG: 176,
                                        IB: 1,
                                        Headval: "Avg InterArrival Time:",
                                        Unitval: "minutes",
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
                    child:  InDirectInputContainer1(
                                          val: state.AvgWaitTimeWhoWait,
                                          IR: 55,
                                          IG: 57,
                                          IB: 59,
                                          Headval: "Avg WaitingTime of Those who wait:",
                                          Unitval: "minutes"),
                  ),
              SizedBox(
                height: 10,
              ),
              Container(
                    child: InDirectInputContainer1(val: state.utilzePercServer1, IR: 55,
                                          IG: 57,
                                          IB: 59, Headval: "Server1 Idle", Unitval: "%"),
                  ),
              SizedBox(
                height: 10,
              ),
              Container(
                    child: InDirectInputContainer1(val: state.utilzePercServer2, IR: 55,
                                          IG: 57,
                                          IB: 59, Headval: "Server2 Idle", Unitval: "%"),
                  ),
                   SizedBox(height: 10,),
                   Container(
                    child:  InDirectInputContainer1(
                                        val:100 -  state.utilzePercServer1,
                                        IR: 276,
                                        IG: 176,
                                        IB: 1,
                                        Headval: "Server1 Utilization:",
                                        Unitval: "%",
                                      ),
                  ),
                    SizedBox(height: 10,),
                   Container(
                    child:  InDirectInputContainer1(
                                        val:100 -  state.utilzePercServer2,
                                        IR: 276,
                                        IG: 176,
                                        IB: 1,
                                        Headval: "Server2 Utilization:",
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
          child:DataTable(
              dataRowHeight: 50,
              headingRowHeight: 70,
              columns: [
                DataColumn(
                  label: Container(
                      width: 20,
                      child: Text(
                        "IAT",
                      )),
                ),
                DataColumn(
                  label: Container(width: 50, child: Text("Arrival")),
                ),
                DataColumn(
                  label: Container(width: 50, child: Text("Service")),
                ),
                DataColumn(
                  label: Container(width: 50, child: Text("Start")),
                ),
                DataColumn(
                  label: Container(width: 25, child: Text("End")),
                ),
                DataColumn(
                  label: Container(width: 25, child: Text("TAT")),
                ),
                DataColumn(
                  label: Container(width: 40, child: Text("WTQ")),
                ),
                DataColumn(
                  label: Container(width: 50, child: Text("Server1")),
                ),
                DataColumn(
                  label: Container(width: 50, child: Text("Server2")),
                ),
              ],
              rows: state.randomtimelymulti.map((e) => DataRow(cells: [
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
                    DataCell(
                      Text(e.I.toString()),
                    ),
                  ])).toList()),
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
              heading: "Statistics of Simulation:", R: 55, G: 57, B: 59),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               Container(
                    child: InDirectInputContainer1(val: state.timelyAvgTimeCustSpendMartSingle, IR: 55,
                                          IG: 57,
                                          IB: 59, Headval: "Avg Turn Around Time", Unitval: "minutes"),
                  ),
              SizedBox(
                height: 10,
              ),
               Container(
                    child:  InDirectInputContainer1(
                                        val: state.timelyAvgTimeCustWaitMartSingle,
                                        IR: 39,
                                        IG: 91,
                                        IB: 212,
                                        Headval: "Avg Wait time in Mart:",
                                        Unitval: "minutes",
                          ),
                  ),
              SizedBox(
                height: 10,
              ),
               Container(
                    child:  InDirectInputContainer1(
                                        val: state.timelyAvgTimeServiceMartSingle,
                                        IR: 214,
                                        IG: 1,
                                        IB: 54,
                                        Headval: "Avg Service Time of Mart:",
                                        Unitval: "minutes",
                                      ),
                  ),
              SizedBox(
                height: 10,
              ),
              Container(
                    child:  InDirectInputContainer1(
                                        val: state.timelyAvgIATSingle,
                                        IR: 276,
                                        IG: 176,
                                        IB: 1,
                                        Headval: "Avg InterArrival Time:",
                                        Unitval: "minutes",
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
                    child:  InDirectInputContainer1(
                                          val: state.timelyAvgWaitTimeWhoWait,
                                          IR: 55,
                                          IG: 57,
                                          IB: 59,
                                          Headval: "Avg WaitingTime of Those who wait:",
                                          Unitval: "minutes"),
                  ),
              SizedBox(
                height: 10,
              ),
              Container(
                    child: InDirectInputContainer1(val: state.timelyutilzePercServer1, IR: 55,
                                          IG: 57,
                                          IB: 59, Headval: "Server1 Idle", Unitval: "%"),
                  ),
              SizedBox(
                height: 10,
              ),
              Container(
                    child: InDirectInputContainer1(val: state.timelyutilzePercServer2, IR: 55,
                                          IG: 57,
                                          IB: 59, Headval: "Server2 Idle", Unitval: "%"),
                  ),
                   SizedBox(height: 10,),
                   Container(
                    child:  InDirectInputContainer1(
                                        val:100 -  state.timelyutilzePercServer1,
                                        IR: 276,
                                        IG: 176,
                                        IB: 1,
                                        Headval: "Server1 Utilization:",
                                        Unitval: "%",
                                      ),
                  ),
                    SizedBox(height: 10,),
                   Container(
                    child:  InDirectInputContainer1(
                                        val:100 -  state.timelyutilzePercServer2,
                                        IR: 276,
                                        IG: 176,
                                        IB: 1,
                                        Headval: "Server2 Utilization:",
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
    );  }
}
