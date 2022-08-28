import 'dart:convert' as convert;
import 'dart:convert';
import 'package:queuesim/widgets/directInput.dart';
import 'package:queuesim/widgets/hist2.dart';
import 'package:queuesim/widgets/hist3.dart';
import 'package:queuesim/widgets/hist4.dart';
import 'package:queuesim/widgets/indirectOutput.dart';
import 'package:queuesim/widgets/mainHeading.dart';
import 'package:queuesim/widgets/step1.dart';
import 'package:queuesim/widgets/subhead.dart';
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

class Indirect2 extends StatelessWidget {
  const Indirect2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>((context), listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("SIMULATION OF IMTIAZ SUPER MARKET QUEUE"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: subhead(heading: "(M/M/1)(160 FCFS)", R: 255, G: 255, B: 255),
          )
        ]
      ),
      body:
       Row(
         children: [
           Container(
             child: SingleChildScrollView(
              controller: ScrollController(),
      scrollDirection: Axis.vertical,
             child: Theme(
               data: Theme.of(context).copyWith(
               dividerColor: Colors.teal
              ),
               child: DataTable(
                dataRowHeight: 50,
                headingRowHeight: 70,
                
                columns: [
                  DataColumn(
                  
                  label: Text("InterArrival",),
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
                rows:state.InterArrivalService.map(
                  (e) => DataRow(cells: [
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
                              
                  ])
                  ).toList()
                 ),
             ),
     ),
           ),
           SingleChildScrollView(
            scrollDirection: Axis.vertical,
            controller: ScrollController(),
             child: Container(
              color: Colors.white,
              child: Column(
                
                children:[
                  SizedBox(height: 10,),
                  MainHeading(heading: "Graphical Illustration Of Data:", R: 55, G: 57, B: 59),
                  SizedBox(height: 10,),
                  Container(
                    height: 400,
                    width: 400,
                    child: Hist2(),
                  ),
                  Container(
                    height: 400,
                    width: 400,
                    child: Step1(),
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
                  SizedBox(height: 10,),
                  MainHeading(heading: "Statistics of Simulation::", R: 55, G: 57, B: 59),
                  SizedBox(height: 10,),
                  Container(
                    child: InDirectInputContainer1(val: state.AvgTimeCustSpendMartSingle, IR: 55,
                                          IG: 57,
                                          IB: 59, Headval: "Avg Turn Around Time", Unitval: "minutes"),
                  ),
                  SizedBox(height: 10,),
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
                  SizedBox(height: 10,),
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
                  SizedBox(height: 10,),
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
                  SizedBox(height: 10,),
                  Container(
                    child:  InDirectInputContainer1(
                                          val: state.AvgWaitTimeWhoWait,
                                          IR: 55,
                                          IG: 57,
                                          IB: 59,
                                          Headval: "Avg WaitingTime of Those who wait:",
                                          Unitval: "minutes"),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: InDirectInputContainer1(val: state.idlePercSingle, IR: 55,
                                          IG: 57,
                                          IB: 59, Headval: "Server Idle", Unitval: "%"),
                  ),
                  SizedBox(height: 10,),
                   Container(
                    child:  InDirectInputContainer1(
                                        val: state.utilzePercSingle,
                                        IR: 276,
                                        IG: 176,
                                        IB: 1,
                                        Headval: "Server Utilization:",
                                        Unitval: "%",
                                      ),
                  ),
                ]
              ),
             ),
           )
         ],
       )
    );
  }
}


      