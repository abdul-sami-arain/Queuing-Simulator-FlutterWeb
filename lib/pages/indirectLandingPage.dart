import 'dart:convert' as convert;
import 'dart:convert';
import 'package:queuesim/pages/directDashboard.dart';
import 'package:queuesim/pages/directDashboardMulti.dart';
import 'package:queuesim/pages/randomDashoboard.dart';
import 'package:queuesim/widgets/indirectLanding2.dart';
import 'package:queuesim/widgets/indirectLanding3.dart';
import 'package:queuesim/widgets/textfield.dart';
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

class Indirect extends StatelessWidget {
  const Indirect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>((context), listen: false);
    server1() {
      state.ServiceTime();
      print(state.InterArrivalList.length);
      print(state.ServiceList.length);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Indirect2()));
    }
    server2() {
      state.ServiceTime2();
      print(state.InterArrivalList.length);
      print(state.ServiceList.length);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Indirect3()));
    }
    Rand(){
      showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Markovian/Markovian/server(s):'),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Paragraph(
                                  para: "Enter value of arrival mean:",
                                  R: 67,
                                  G: 162,
                                  B: 220),
                              TexttField(Controller: state.RandmeanArrival),
                              Paragraph(
                                  para: "Enter value of service mean:",
                                  R: 67,
                                  G: 162,
                                  B: 220),
                              TexttField(Controller: state.RandmeanService),
                              Paragraph(
                                  para: "Enter number of server(s):",
                                  R: 67,
                                  G: 162,
                                  B: 220),
                              TexttField(Controller: state.Randno_of_server),
                            ],
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: Text('Random Simulation'),
                              onPressed: () {
                                state.RandomlyGeneration();
                               Navigator.push(
          context, MaterialPageRoute(builder: (context) => RandomDashboard1()));
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(67, 162, 220, 1),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 150, vertical: 20),
                                  textStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        );
                      });

    }

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            actions: [
               ElevatedButton(
            onPressed: () {
              server1();
            },
            child: Text("Single Server")),
        ElevatedButton(
            onPressed: () {
              server2();
            },
            child: Text("Multi Server")),
        ElevatedButton(
            onPressed: () {
              Rand();
              
            },
            child: Text("Random Numbers"))       
            ],
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/bubble.jpg"), fit: BoxFit.cover)),
            child:  Column(
      children: [
        
      ],
    ),
          )),
    );
    
    
    
    //  DataTable(
    //   columns: [
    //     DataColumn(
    //     label: Text("Arrival"),
    //  ),
    //  DataColumn(
    //     label: Text("Service"),
    //    ),
    //   ],
    //   rows:state.ArrivalService.map(
    //     (e) => DataRow(cells: [
    //        DataCell(
    //                   Text(e.A.toString()),
    //                 ),
    //                 DataCell(
    //                   Text(e.B.toString()),
    //                 ),
    //     ])
    //     ).toList()
    // );
  }
}

// class Indirect extends StatefulWidget {
//   const Indirect({Key? key}) : super(key: key);

//   @override
//   State<Indirect> createState() => _IndirectState();
// }

// class _IndirectState extends State<Indirect> {
//   List<GetExcel> data = [];
//   getDataFromSheet() async {
//     String url =
//         "script.google.com/macros/s/AKfycbwcN-ioRZjXHFujeawbkPUPlt_OCHX5-gRIBrDKLo_gOYyvBoDOSCzweRTW_DtMOk3N/exec";

//     var response = await http.get(Uri.https(url, "data"));
//     var jsondata = convert.jsonDecode(response.body);

//     print("jsondata.toString()");
//   }

//   @override
//   void initState() {
//     getDataFromSheet();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ElevatedButton(
//         onPressed: () {
//           getDataFromSheet();
//         },
//         child: Text("abc"),
//       ),
//     );
//   }
// }
