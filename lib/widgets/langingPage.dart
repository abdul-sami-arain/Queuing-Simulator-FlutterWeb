import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:queuesim/controllers/stateProvider.dart';
import 'package:queuesim/pages/directLandingPage.dart';
import 'package:queuesim/pages/indirectLandingPage.dart';
import 'package:queuesim/pages/multiRandomDashboard.dart';
import 'package:queuesim/pages/randomDashoboard.dart';
import 'package:queuesim/widgets/button.dart';
import 'package:queuesim/widgets/paragraph.dart';
import 'package:http/http.dart' as http;
import 'package:queuesim/widgets/textfield.dart';
import 'dart:convert' as convert;
import 'dart:convert';
import 'package:universal_io/io.dart';
import '../model/ExcelGet.dart';

class largeLanding extends StatelessWidget {
  const largeLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>((context), listen: false);

    List<GetExcel> data = [];
    getDataFromSheet() async {
      var url = Uri.parse(
          "https://script.google.com/macros/s/AKfycbwcN-ioRZjXHFujeawbkPUPlt_OCHX5-gRIBrDKLo_gOYyvBoDOSCzweRTW_DtMOk3N/exec");

      var response = await http.get(url);
      try {
        if (response.statusCode == 200) {
          String data1 = response.body;
          var decodedData = convert.jsonDecode(data1);
          return decodedData.forEach((element) {
            GetExcel getExcel = new GetExcel();
            getExcel.ArrivalTime = element['ArrivalTime'];
            getExcel.ServiceTime = element['ServiceTime'];
            state.InterArrivalList.add(getExcel.ArrivalTime!.toDouble());
            state.ServiceList.add(getExcel.ServiceTime!.toDouble());
            print(state.InterArrivalList);
            print("object");
          });
        } else {
          return print('failed');
        }
      } catch (e) {
        return print('failed');
      }
    }

    Rand() {
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
                      para: "Simulation Time(min):", R: 67, G: 162, B: 220),
                  TexttField(Controller: state.Time_of_simulation),
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
                    if (state.RandServers == 1) {
                      state.RandomlyGeneration();
                      state.SingleTimeSimu();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RandomDashboard1()));
                    } else if (state.RandServers == 2) {
                      state.RandomlyGeneration();
                      state.multiSim();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MultiRandomDashboard1()));
                    } else {
                      print("error");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(67, 162, 220, 1),
                      padding:
                          EdgeInsets.symmetric(horizontal: 150, vertical: 20),
                      textStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ],
            );
          });
    }

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(67, 162, 220, 1)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Paragraph(
                              para:
                                  "On selecting this, it will give you six types\n\nof queue models, you have to select one option\n\nof them ,then it requires further info from you.. ",
                              R: 255,
                              G: 255,
                              B: 255),
                          SizedBox(
                            height: 20.h,
                          ),
                          GestureDetector(
                            child:
                                Button1(text: "Mean", R: 255, G: 255, B: 255),
                            onTap: () {
                              state.numericVal = 0;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DirectLandingPage()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Paragraph(
                              para:
                                  "On selecting this, it will give you six types\n\nof queue models, you have to select one option\n\nof them ,then it requires further info from you.. ",
                              R: 67,
                              G: 162,
                              B: 220),
                          SizedBox(
                            height: 20.h,
                          ),
                          GestureDetector(
                            child: Button1(text: "Rate", R: 67, G: 162, B: 220),
                            onTap: () {
                              state.numericVal = 1;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DirectLandingPage()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Paragraph(
                              para:
                                  "It requires indiviual arrivals and service ,you\n\nyou should give atleast 20 observations ,It simulates\n\nyour system & estimates each component of system.. ",
                              R: 67,
                              G: 162,
                              B: 220),
                          SizedBox(
                            height: 20.h,
                          ),
                          GestureDetector(
                            child: Button1(
                                text: "Simulation", R: 67, G: 162, B: 220),
                            onTap: () {
                              getDataFromSheet();
                              print(state.InterArrivalList.length);
                              print(state.ServiceList.length);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Indirect()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(67, 162, 220, 1)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Paragraph(
                              para:
                                  "It requires  arrival and service mean values. It\n\nGenerates random poisson arrivals and exponential\n\nservices & estimates each component of system.. ",
                              R: 255,
                              G: 255,
                              B: 255),
                          SizedBox(
                            height: 20.h,
                          ),
                          GestureDetector(
                            child:
                                Button1(text: "Random", R: 255, G: 255, B: 255),
                            onTap: () {
                              Rand();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
