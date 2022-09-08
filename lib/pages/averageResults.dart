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

class AverageResults extends StatelessWidget {
  const AverageResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>((context), listen: false);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: subhead(
              heading:
                  "Statistic of Each Iteration:",
              R: 255,
              G: 255,
              B: 255),
            backgroundColor: Colors.teal,
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.data_array,
                    color: Colors.white,
                  ),
                  text: "Iteration Data",
                ),
                Tab(
                  icon: Icon(
                    Icons.data_array,
                    color: Colors.white,
                  ),
                  text: "Statistics",
                ),
              ],
            )),
        body: TabBarView(children: [Average(), ResultsAvg()]),
      ),
    );
  }
}

class Average extends StatelessWidget {
  const Average({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>((context), listen: false);
    return SingleChildScrollView(
      controller: ScrollController(),
      scrollDirection: Axis.vertical,
      child: Container(
          child: DataTable(
              dataRowHeight: 50,
              headingRowHeight: 70,
              columns: [
                DataColumn(
                  label: Text("Iteration"),
                ),
                DataColumn(
                  label: Text(
                    "TAT",
                  ),
                ),
                DataColumn(
                  label: Text("Wait Time"),
                ),
                DataColumn(
                  label: Text("Service Time"),
                ),
                DataColumn(
                  label: Text("IAT"),
                ),
                DataColumn(
                  label: Text("Wait Time Those Who Wait"),
                ),
              ],
              rows: state.historyList
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
                      ]))
                  .toList())),
    );
  }
}

class ResultsAvg extends StatelessWidget {
  const ResultsAvg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        var state = Provider.of<AppState>((context), listen: false);
    return Container(
      child:  SingleChildScrollView(
        controller: ScrollController(),
      scrollDirection: Axis.vertical,
        child: Column(
          children: [
             MainHeading(
                heading: "Mean values:", R: 55, G: 57, B: 59),
            Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: InDirectInputContainer1(
                          val: state.meanHistoryTAT,
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
                        val: state.meanHistoryWT,
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
                        val: state.meanHistoryST,
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
                        val: state.meanHistoryIAT,
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
                     Container(
                  child: InDirectInputContainer1(
                      val: state.meanHistoryWTTWW,
                      IR: 55,
                      IG: 57,
                      IB: 59,
                      Headval: "Avg WaitingTime of Those who wait:",
                      Unitval: "min"),
                ),
                
                  ],
                ),
         
            SizedBox(
              height: 20,
            ),
            
             MainHeading(
                heading: "Median values:", R: 55, G: 57, B: 59),
      
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: InDirectInputContainer1(
                          val: state.medHistoryTAT,
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
                        val: state.medHistoryWT,
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
                        val: state.medHistoryST,
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
                        val: state.medHistoryIAT,
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
                    Container(
                  child: InDirectInputContainer1(
                      val: state.medHistoryWTTWW,
                      IR: 55,
                      IG: 57,
                      IB: 59,
                      Headval: "Avg WaitingTime of Those who wait:",
                      Unitval: "min"),
                ),
                  ],
                ),
         
           
      
             SizedBox(
              height: 20,
            ),
            
             MainHeading(
                heading: "Variance values:", R: 55, G: 57, B: 59),
      
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: InDirectInputContainer1(
                          val: state.varHistoryTAT,
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
                        val: state.varHistoryWT,
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
                        val: state.varHistoryST,
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
                        val: state.varHistoryIAT,
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
                    Container(
                  child: InDirectInputContainer1(
                      val: state.varHistoryWTTWW,
                      IR: 55,
                      IG: 57,
                      IB: 59,
                      Headval: "Avg WaitingTime of Those who wait:",
                      Unitval: "min"),
                ),
                  ],
                ),
      SizedBox(
              height: 20,
            ),
                 MainHeading(
                heading: "Standard Deviation values:", R: 55, G: 57, B: 59),
      
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: InDirectInputContainer1(
                          val: state.sdHistoryTAT,
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
                        val: state.sdHistoryWT,
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
                        val: state.sdHistoryST,
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
                        val: state.sdHistoryIAT,
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
                    Container(
                  child: InDirectInputContainer1(
                      val: state.sdHistoryWTTWW,
                      IR: 55,
                      IG: 57,
                      IB: 59,
                      Headval: "Avg WaitingTime of Those who wait:",
                      Unitval: "min"),
                ),
                  ],
                ),
           
          ]),
      ) 
      );
  }
}
