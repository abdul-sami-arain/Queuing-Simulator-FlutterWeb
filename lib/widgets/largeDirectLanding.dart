import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:queuesim/controllers/stateProvider.dart';
import 'package:queuesim/pages/directDashboard.dart';
import 'package:queuesim/pages/directDashboardMulti.dart';
import 'package:queuesim/pages/gg.dart';
import 'package:queuesim/pages/mg.dart';
import 'package:queuesim/widgets/button2.dart';
import 'package:queuesim/widgets/mainHeading.dart';
import 'package:queuesim/widgets/paragraph.dart';
import 'package:queuesim/widgets/textfield.dart';

class LDL extends StatelessWidget {
  LDL({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/bubble.jpg"), fit: BoxFit.cover)),
            child: ModelGetter(),
          )),
    );
  }
}

class ModelGetter extends StatelessWidget {
  ModelGetter({Key? key}) : super(key: key);
  TextEditingController xyz = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>((context), listen: false);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 50.h),
      child: Container(
          width: 70.w,
          height: 70.h,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text('Markovian/Markovian/server(s)'),
                onPressed: () {
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
                              TexttField(Controller: state.meanInterArrival),
                              Paragraph(
                                  para: "Enter value of service mean:",
                                  R: 67,
                                  G: 162,
                                  B: 220),
                              TexttField(Controller: state.meanService),
                              Paragraph(
                                  para: "Enter number of server(s):",
                                  R: 67,
                                  G: 162,
                                  B: 220),
                              TexttField(Controller: state.no_of_server),
                            ],
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: Text('Markoveon/Markoveon'),
                              onPressed: () {
                                if(state.numericVal == 0 ){
                                  state.meanArrival =1/ (double.parse(state.meanInterArrival.text));
                                  state.meanservice =1/ (double.parse(state.meanService.text));
                                }
                                else if(state.numericVal == 1 ){
                                  state.meanArrival =(double.parse(state.meanInterArrival.text));
                                  state.meanservice =(double.parse(state.meanService.text));
                                }
                                state.MM();
                                if (state.servers==1) {
                                  Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DirectDashboard()),);
                                }
                                else{
                                  Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DirectDashboardMulti()),);
                                }
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
                },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(67, 162, 220, 1),
                    padding:
                        EdgeInsets.symmetric(horizontal: 150, vertical: 20),
                    textStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 20.h,
              ),
              ElevatedButton(
                child: Text('Markoveon/General'),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => MG()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(67, 162, 220, 1),
                    padding:
                        EdgeInsets.symmetric(horizontal: 150, vertical: 20),
                    textStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 20.h,
              ),
              ElevatedButton(
                child: Text('General/General'),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => GG()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(67, 162, 220, 1),
                    padding:
                        EdgeInsets.symmetric(horizontal: 150, vertical: 20),
                    textStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            ],
          )),
    );
  }
}

// class LDL extends StatelessWidget {
//   const LDL({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           flex:3 ,
//           child: Container(
//             color: Color.fromRGBO(67, 162, 220, 1),
//             child: Column(
//               children: [
//                 Expanded(    
//                   child: Container(
//                     child: MainHeading(heading: "Queuing Model Types :", R: 255, G: 255, B: 255),
//                   )
//                   ),
//                 Expanded(
//                   flex: 3,
//                   child: Padding(
//                     padding:  EdgeInsets.symmetric(vertical: 20.h),
//                     child: Container(
//                          child:Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children:[
//                             Expanded(
//                               flex: 1, 
//                               child:
//                                 GestureDetector(
//                                   child: Padding(
//                                     padding:  EdgeInsets.symmetric(vertical: 4.h),
//                                     child: Container(
//                                     child: Button2(text: "M/M/1", R: 255, G: 255, B: 255),
//                                     ),
//                                   ),
//                                   onTap: (){
//                                     Navigator.push(context,
//                                     MaterialPageRoute(builder: (context) => MM1()));
//                                   },
//                                 )
//                                 ),
//                             Expanded(
                           
//                               child:
//                                 GestureDetector(
//                                   child: Padding(
//                                     padding:  EdgeInsets.symmetric(vertical: 4.h),
//                                     child: Container(
//                                     child: Button2(text: "M/M/c", R: 255, G: 255, B: 255),
//                                     ),
//                                   ),
//                                   onTap: (){
//                                     Navigator.push(context,
//                                     MaterialPageRoute(builder: (context) => MMc()));
//                                   },
//                                 )
//                                 ),
//                             Expanded(
                            
//                               child:
//                                 GestureDetector(
//                                   child: Padding(
//                                     padding:  EdgeInsets.symmetric(vertical: 4.h),
//                                     child: Container(
//                                     child: Button2(text: "M/G/1", R: 255, G: 255, B: 255),
//                                     ),
//                                   ),
//                                   onTap: (){
//                                     Navigator.push(context,
//                                     MaterialPageRoute(builder: (context) => MG1()));
//                                   },
//                                 )
//                                 ),
//                             Expanded(
                              
//                               child:
//                                 GestureDetector(
//                                   child: Padding(
//                                     padding:  EdgeInsets.symmetric(vertical: 4.h),
//                                     child: Container(
//                                     child: Button2(text: "M/G/c", R: 255, G: 255, B: 255),
//                                     ),
//                                   ),
//                                   onTap: (){},
//                                 )
//                                 ),
//                             Expanded(
                               
//                               child:
//                                 GestureDetector(
//                                   child: Padding(
//                                     padding:  EdgeInsets.symmetric(vertical: 4.h),
//                                     child: Container(
//                                     child: Button2(text: "G/G/1", R: 255, G: 255, B: 255),
//                                     ),
//                                   ),
//                                   onTap: (){
//                                      Navigator.push(context,
//                                     MaterialPageRoute(builder: (context) => GG()));
//                                   },
//                                 )
//                                 ),
//                             Expanded(
                            
//                               child:
//                                 GestureDetector(
//                                   child: Padding(
//                                     padding:  EdgeInsets.symmetric(vertical: 4.h),
//                                     child: Container(
//                                     child: Button2(text: "G/G/c", R: 255, G: 255, B: 255),
//                                     ),
//                                   ),
//                                   onTap: (){},
//                                 )
//                                 ),

//                           ]
//                          ) ,
//                     ),
//                   )
//                   ),  
//               ],
//             ),
//           )
//           ),
//         Expanded(
          
//           child: Container(
//             decoration: BoxDecoration(   
//               image: DecorationImage(
                
//                 image: AssetImage("assets/bubble.jpg")
//                 ,fit: BoxFit.cover
//               )
//             ),
            
//           )
//           )  
//       ],
//     );
//   }
// }
