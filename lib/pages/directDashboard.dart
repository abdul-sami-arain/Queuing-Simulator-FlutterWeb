import 'package:countup/countup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odometer/odometer.dart';
import 'package:provider/provider.dart';
import 'package:queuesim/controllers/stateProvider.dart';
import 'package:queuesim/widgets/directInput.dart';
import 'package:queuesim/widgets/directInput1.dart';
import 'package:queuesim/widgets/heading3.dart';
import 'package:queuesim/widgets/hist.dart';
import 'package:queuesim/widgets/idlePerc.dart';
import 'package:queuesim/widgets/kendall.dart';
import 'package:queuesim/widgets/paragraph.dart';
import 'package:queuesim/widgets/percIndicator.dart';
import 'package:queuesim/widgets/subheading2.dart';
import 'package:queuesim/widgets/summary.dart';
import 'package:queuesim/widgets/textfield.dart';

class DirectDashboard extends StatelessWidget {
  const DirectDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>((context), listen: false);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(scaffoldBackgroundColor: Color.fromRGBO(240, 242, 246, 1)),
        home: Scaffold(
        
          appBar: AppBar(
             title: Text('Single Server Dashboard:'),
          backgroundColor: Colors.teal,
          ),
          body: Container(
            color: Color.fromRGBO(240, 242, 246, 1),
              child: Row(
            children: [
              Expanded(
                
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 20.h),
                        child: DirectInputContainer1(
                          val: state.meanArrival,
                          IR: 39,
                          IG: 91,
                          IB: 212,
                          Headval: "Arrival",
                          Unitval: "minutes",
                        ),
                      ),
                      
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 20.h),
                        child: DirectInputContainer1(
                          val: state.meanservice,
                          IR: 214,
                          IG: 1,
                          IB: 54,
                          Headval: "Service",
                          Unitval: "minutes",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 20.h),
                        child: DirectInputContainer1(
                          val: state.servers,
                          IR: 276,
                          IG: 176,
                          IB: 1,
                          Headval: "Servers",
                          Unitval: "server(s)",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 20.h),
                        child: Kendal(
                          val: state.kendallNotation,
                          KR: 1,
                          KG: 190,
                          KB: 117,
                          Headval: "Kendall Notation",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 20.h),
                        child: Kendal(
                          val: state.ArrivalDistr,
                          KR: 55,
                          KG: 57,
                          KB: 59,
                          Headval: "Arrival Distr:",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 20.h),
                        child: Kendal(
                          val: state.ServiceDistr,
                          KR: 39,
                          KG: 91,
                          KB: 212,
                          Headval: "Service Distr:",
                        ),
                      )
                    ],
                  ),
                ),
              
              Expanded(
                flex: 4,
                
                  
                    
                      
                        child: Column(
                          
                          children: [
                            SizedBox(height: 30.h,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 0.h),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                          width: 100.w,
                                          height: 600.h,
                                          color: Colors.white,
                                          child: Hist())),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        width: double.infinity,
                                        height: 600.h,
                                        color: Colors.white,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                Paragraph(
                                                    para: "Server Description:",
                                                    R: 153,
                                                    G: 153,
                                                    B: 153),
                                                Divider(
                                                  color: Color.fromRGBO(
                                                      239, 238, 243, 1),
                                                  thickness: 1.0,
                                                ),
                                              ],
                                            ),
                                            ServerBusy(
                                              busyTime: state.singleServerUtilization,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 25.w),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Head3(
                                                          heading: ((1 -
                                                            (state
                                                                .singleServerUtilization))*100).toStringAsFixed(2)+'%',
                                                          R: 255,
                                                          G: 193,
                                                          B: 7),
                                                      IdlePerc(
                                                        idleTime: 1 -
                                                            (state
                                                                .singleServerUtilization),
                                                      ),
                                                    ],
                                                  ),
                                                  subhead2(
                                                      heading: "Idle Percent",
                                                      R: 153,
                                                      G: 153,
                                                      B: 153),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(height: 40.h,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 0.h),
                              child: Container(
                                width: double.infinity,
                                
                                color: Colors.transparent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 0.w, vertical: 0.h),
                                      child: DirectInputContainer(
                                          val: state.avgLengthSys_singleServer,
                                          IR: 55,
                                          IG: 57,
                                          IB: 59,
                                          Headval: "Sytem Length:",
                                          Unitval: "customers"),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 0.w, vertical: 0.h),
                                      child: DirectInputContainer(
                                        val: state.avgLengthQueue_singleServer,
                                        IR: 39,
                                        IG: 91,
                                        IB: 212,
                                        Headval: "Queue Length:",
                                        Unitval: "customers",
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 0.w, vertical: 0.h),
                                      child: DirectInputContainer(
                                        val: state.avgWaitQueue_singleServer,
                                        IR: 214,
                                        IG: 1,
                                        IB: 54,
                                        Headval: "Wait Queue:",
                                        Unitval: "minutes",
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 0.w, vertical: 0.h),
                                      child: DirectInputContainer(
                                        val: state.avgWaitSys_singleServer.toDouble(),
                                        IR: 276,
                                        IG: 176,
                                        IB: 1,
                                        Headval: "Wait System:",
                                        Unitval: "minutes",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 40.h,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 0.h),
                              child: Summary(
                                utilize: (state.singleServerUtilization*100).toStringAsFixed(2), idle: ((1 -
                                                            (state
                                                                .singleServerUtilization))*100).toStringAsFixed(2), lq: state.avgLengthQueue_singleServer.toStringAsFixed(2), wq: state.avgWaitQueue_singleServer.toStringAsFixed(2), ls: state.avgLengthSys_singleServer.toStringAsFixed(2), ws: state.avgWaitSys_singleServer.toStringAsFixed(2)),
                            )
                          ],
                        ),
                      ),
                    
                  
                
              
            ],
          )),
        ));
  }
}
