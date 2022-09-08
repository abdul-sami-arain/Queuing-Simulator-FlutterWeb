import 'dart:js';
import 'package:path/path.dart' as Path;
import 'dart:math';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:queuesim/pages/mg.dart';

class XYDATA {
  late final double X;
  late final double Y;
  XYDATA(this.X, this.Y);
}

// InterArrival analysis Graph:
class HISTDATA {
  late final double Y;
  HISTDATA(this.Y);
}

// Arrival analysis Graph:
class HISTDATA_ARRIVAL {
  late final double Y;
  HISTDATA_ARRIVAL(this.Y);
}

// Service analysis:
class HISTDATA_SERVICE {
  late final double Y;
  HISTDATA_SERVICE(this.Y);
}

// Cust-WTQ-TAT graph:
class STEP1 {
  late var start;
  late var end;
  late var end1;
  STEP1(this.start, this.end, this.end1);
}

// Pie chart
class RADIAL1 {
  late var para;
  late var val;
  late final col;
  RADIAL1(this.para, this.val, this.col);
}

// TimelyInterArrival analysis Graph:
class TIMELYHISTDATA {
  late final double Y;
  TIMELYHISTDATA(this.Y);
}

// TimelyArrival analysis Graph:
class TIMELY_HISTDATA_ARRIVAL {
  late final double Y;
  TIMELY_HISTDATA_ARRIVAL(this.Y);
}

// TimelyService analysis:
class TIMELY_HISTDATA_SERVICE {
  late final double Y;
  TIMELY_HISTDATA_SERVICE(this.Y);
}

// Cust-WTQ-TAT graph:
class TIMELY_STEP1 {
  late var start;
  late var end;
  late var end1;
  TIMELY_STEP1(this.start, this.end, this.end1);
}

// TimelyPie chart
class TIMELYRADIAL1 {
  late var para;
  late var val;
  late final col;
  TIMELYRADIAL1(this.para, this.val, this.col);
}

class ABdata {
  // A --> interarrival
  // B --> service
  // C --> arrival
  // D --> service start
  // E --> service end
  // F --> idle
  // G --> Turn around time
  // H --> Wait in queue
  late final double A;
  late final double B;
  late final double C;
  late final double D;
  late final double E;
  late final double F;
  late final double G;
  late final double H;
  ABdata(this.A, this.B, this.C, this.D, this.E, this.F, this.G, this.H);
}

// random numbers info
class Randomdata {
  // A --> CDF
  // B --> CDF2
  // C --> Observations
  // D --> RANDOM NUMBERS
  // E --> IAT
  // F --> ARRIVAL
  // G --> SERVICE

  late final double A;
  late final double B;
  late final int C;
  late final double D;
  late final int E;
  late final int F;
  late final int G;

  Randomdata(this.A, this.B, this.C, this.D, this.E, this.F, this.G);
}

//Random timely

class RandomTimely {
  // A --> timelyinterarrival
  // B --> timelyservice
  // C --> timelyarrival
  // D --> timelyservice start
  // E --> timelyservice end
  // F --> timelyidle
  // G --> timelyTurn around time
  // H --> timelyWait in queue
  late final double A;
  late final double B;
  late final double C;
  late final double D;
  late final double E;
  late final double F;
  late final double G;
  late final double H;
  RandomTimely(this.A, this.B, this.C, this.D, this.E, this.F, this.G, this.H);
}

class History {
  late final int A;
  late final double B;
  late final double C;
  late final double D;
  late final double E;
  late final double F;
  History(this.A, this.B, this.C, this.D, this.E, this.F);
}

class RandomTimelyMulti {
  // A --> timelyinterarrival multi
  // B --> timelyservice multi
  // C --> timelyarrival multi
  // D --> timelyservice start multi
  // E --> timelyservice end multi
  // F --> timelyTurn around time multi
  // G --> timelyWait in queue multi
  // H --> timelyserver1multi
  // I --> timelyserver2multi
  late final double A;
  late final double B;
  late final double C;
  late final double D;
  late final double E;
  late final double F;
  late final double G;
  late final double H;
  late final double I;
  RandomTimelyMulti(
      this.A, this.B, this.C, this.D, this.E, this.F, this.G, this.H, this.I);
}

class CDdata {
  //MULTI SERVER INDIRECT
  // A --> interarrival
  // B --> service
  // C --> arrival
  // D --> service start
  // E --> service end
  // F --> Turn around time
  // G --> Wait in queue
  // H --> server1 utilization
  // I --> server1 utilization
  late final double A;
  late final double B;
  late final double C;
  late final double D;
  late final double E;
  late final double F;
  late final double G;
  late final double H;
  late final double I;
  CDdata(
      this.A, this.B, this.C, this.D, this.E, this.F, this.G, this.H, this.I);
}

class Randdata {
  late final double A; // cdf values
  late final double B; // cummulative values
  late final int C; // observations
  Randdata(this.A, this.B, this.C);
}

class meanTATscatter {
  late final int A;
  late final double B;
  meanTATscatter(this.A, this.B);
}

class meanSTscatter {
  late final int A;
  late final double B;
  meanSTscatter(this.A, this.B);
}

class meanIATscatter {
  late final int A;
  late final double B;
  meanIATscatter(this.A, this.B);
}

class meanWTscatter {
  late final int A;
  late final double B;
  meanWTscatter(this.A, this.B);
}

class meanWTTWscatter {
  late final int A;
  late final double B;
  meanWTTWscatter(this.A, this.B);
}

class AppState extends ChangeNotifier {
  // -----------------------Graphs:---------------------------//
  final List<meanTATscatter> meantatscatter = [];
  final List<meanWTscatter> meanwtscatter = [];
  final List<meanSTscatter> meanstscatter = [];
  final List<meanIATscatter> meaniatscatter = [];
  final List<meanWTTWscatter> meanwttwscatter = [];

  final List<HISTDATA> histData = []; // InterArrival analysis Graph:
  final List<HISTDATA_ARRIVAL> histDataArrival = []; // Arrival analysis Graph:
  final List<HISTDATA_SERVICE> histDataService = []; // service analysis Graph:
  final List<RADIAL1> radial1data = []; // pie Graph:
  final List<STEP1> step1data = []; // line Graph:

  final List<TIMELYHISTDATA> timelyhistData =
      []; // timelyInterArrival analysis Graph:
  final List<TIMELY_HISTDATA_ARRIVAL> timelyhistDataArrival =
      []; // timelyArrival analysis Graph:
  final List<TIMELY_HISTDATA_SERVICE> timelyhistDataService =
      []; // timelyservice analysis Graph:
  final List<TIMELYRADIAL1> timelyradial1data = []; // timelypie Graph:
  final List<TIMELY_STEP1> timelystep1data = []; // timelyline Graph:

  final List<RandomTimely> randomtimely = [];
  final List<RandomTimelyMulti> randomtimelymulti = [];
  final List<Randomdata> randomdata = [];
  final List<XYDATA> MergeXY = [];
  final List<History> historyList = [];
  final List X = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25
  ];
  late List Y = [];
  late List Z = Y.reversed.toList();
  final List<Randdata> RandData = [];
  int count = 1;
  void increment() {
    count++;
    notifyListeners();
  }

  fact(int x) {
    if (x == 0) {
      return 1;
    } else {
      return x * fact(x - 1);
    }
  }

  //-----------------controllersOfTextfield DIRECT MM MODEL---------------//

  final meanInterArrival = TextEditingController();
  final meanService = TextEditingController();
  final no_of_server = TextEditingController();

  //-----------------controllersOfTextfield Random---------------//

  final RandmeanArrival = TextEditingController();
  final RandmeanService = TextEditingController();
  final Time_of_simulation = TextEditingController();
  final Randno_of_server = TextEditingController();

  //-----------------controllersOfTextfield DIRECT MG MODEL---------------//

  final a = TextEditingController();
  final b = TextEditingController();

  //------------------Direct Method----------------------//

  late double numericVal;
  late double meanArrival = 0;
  late double meanservice = 0;
  late double servers = double.parse(no_of_server.text);
  late double RandMEANarrival = double.parse(RandmeanArrival.text);
  late double RandMEANservice = double.parse(RandmeanService.text);
  late double TimeSimulation = double.parse(Time_of_simulation.text);
  late double RandServers = double.parse(Randno_of_server.text);

  late double maximum = double.parse(b.text);
  late double minimum = double.parse(a.text);
  late double singleServerUtilization;
  late double multiServerUtilization;
  late double avgLengthQueue_singleServer;
  late double avgLengthQueue_multiServer;
  late double avgLengthSys_singleServer;
  late double avgLengthSys_multiServer;
  late double avgWaitSys_singleServer;
  late double avgWaitSys_multiServer;
  late double avgWaitQueue_singleServer;
  late double avgWaitQueue_multiServer;
  late double pnotSum = 0;
  late double pnotRemain = 0;
  late double pnot = (1 / (pnotSum + pnotRemain));
  late String kendallNotation;
  late String ArrivalDistr;
  late String ServiceDistr;

//---------------M/M/1------------------------------------------//

  //utilization factor for single server:
  singleserverRho(double meanArrival, double meanService) {
    singleServerUtilization = (meanArrival / meanService);
    notifyListeners();
  }

  //average length of single queue:
  singleServerLq() {
    avgLengthQueue_singleServer =
        ((singleServerUtilization * singleServerUtilization) /
            (1 - singleServerUtilization));
    notifyListeners();
  }

  //average length of single system:
  singleServerLs(
    double meanArrival,
    double meanService,
  ) {
    avgLengthSys_singleServer = (meanArrival / (meanService - meanArrival));
    notifyListeners();
  }

  //average waiting of single system:
  singleServerWs(
    double meanArrival,
    double meanService,
  ) {
    avgWaitSys_singleServer = (1 / (meanService - meanArrival));
    notifyListeners();
  }

  //average wait of single queue:
  singleServerWq(
    double meanArrival,
    double meanService,
  ) {
    avgWaitQueue_singleServer =
        (meanArrival / meanService) * (1 / (meanService - meanArrival));
    notifyListeners();
  }

  // n customers in the system
  Ncust(double singleServerRho) {
    for (var i = 0; i < 26; i++) {
      Y.add((pow(singleServerRho, i) * (1 - singleServerRho)));
    }
    for (var i = 0; i < 26; i++) {
      MergeXY.add(XYDATA(X[i], Z[i]));
    }
    notifyListeners();
  }

//---------------------------M/M/c-------------------------------------//

  //utilization factor for multi server:
  multiserverRho(double meanArrival, double meanService, double no_of_servers) {
    multiServerUtilization = (meanArrival / (no_of_servers * meanservice));
    notifyListeners();
  }

  pnotSumm(double meanArrival, double meanService, double no_of_server) {
    for (var i = 0; i < no_of_server; i++) {
      pnotSum += (pow(servers * (multiServerUtilization), i) / fact(i));
    }
    notifyListeners();
  }

  pnotRemaining(double no_of_server) {
    pnotRemain = (pow(no_of_server * (multiServerUtilization), no_of_server) /
        (fact(int.parse(no_of_server.toString())) *
            (1 - (multiServerUtilization))));
  }

  //average length of multi server queue:
  multiServerLq(
    double meanArrival,
    double meanService,
  ) {
    avgLengthQueue_multiServer = ((pnot *
            pow((meanArrival / meanservice), servers) *
            multiServerUtilization) /
        (fact(int.parse(servers.toString())) *
            pow((1 - multiServerUtilization), 2)));
    notifyListeners();
  }

  //average length of multi queue:
  multiServerLs(
    double meanArrival,
    double meanService,
  ) {
    avgLengthSys_multiServer =
        avgLengthQueue_multiServer + (meanArrival / meanservice);
    notifyListeners();
  }

  //average wait in multiserver queue:
  multiServerWq(
    double lenOfQueue,
    double meanArrival,
  ) {
    avgWaitQueue_multiServer = lenOfQueue / meanArrival;
    notifyListeners();
  }

  //average wait in multiserver system:
  multiServerWs(double waitQueueMulti, meanService) {
    avgWaitSys_multiServer = waitQueueMulti + (1 / meanservice);
    notifyListeners();
  }

//---------------------------M/G/1---------------------------------//
  late double GammaMean;
  late double GammaVariance;
  late double UniformMean;
  late double UniformVariance;
  late double BetaMean;
  late double BetaVariance;
  late double SqCoefVarArr;
  late double SqCoefVarSer;

  GammaAverage(double maxi, double mini) {
    GammaMean = maxi * mini;
    notifyListeners();
  }

  GammaVar(double maxi, double mini) {
    GammaVariance = (maxi * maxi) * mini;
    notifyListeners();
  }

  UniformAverage(double maxi, double mini) {
    UniformMean = (maxi + mini) / 2;
    notifyListeners();
  }

  UniformVar(double maxi, double mini) {
    UniformVariance = (pow((maxi - mini), 2)) / 12;
    notifyListeners();
  }

  BetaAverage(double maxi, double mini) {
    BetaMean = mini / (maxi + mini);
    notifyListeners();
  }

  BetaVar(double maxi, double mini) {
    BetaVariance = (maxi * mini) / (pow((maxi + mini), 2) * (maxi + mini + 1));
    notifyListeners();
  }

  SqQuoArr(double variance1, double meanArrival) {
    SqCoefVarArr = variance1 / ((1 / meanArrival) * (1 / meanArrival));
  }

  SqQuoSer(double variance1, double meanService) {
    SqCoefVarSer = variance1 / ((meanService) * (meanService));
  }

  MGlq(double meanArrival, double rho, double variance_Sys) {
    avgLengthQueue_singleServer =
        (((meanArrival * meanArrival) * variance_Sys) +
                pow(singleServerUtilization, 2)) /
            (2 * (1 - singleServerUtilization));
    notifyListeners();
  }

  MGls(double meanArrival, double waitinSys) {
    avgLengthSys_singleServer = meanArrival * waitinSys;
    notifyListeners();
  }

  MGwq(double avgLengthQueue_singleServer, double meanArrival) {
    avgWaitQueue_singleServer = avgLengthQueue_singleServer / meanArrival;
  }

  MGws(double avgWaitQueue_singleServer, double meanService) {
    avgWaitSys_singleServer = avgWaitQueue_singleServer + (1 / meanService);
  }

  MGwqMulti(
      double avgWaitQueue_multiServer, double SqCoefArr, double SqCoefSer) {
    avgWaitQueue_multiServer = ((SqCoefArr + SqCoefSer) / 2);
  }

  MM() {
    if (servers == 1) {
      singleserverRho(meanArrival, meanservice);
      singleServerLq();
      singleServerLs(meanArrival, meanservice);
      singleServerWq(meanArrival, meanservice);
      singleServerWs(meanArrival, meanservice);
      Ncust(singleServerUtilization);
      kendallNotation = 'M/M/1';
      ArrivalDistr = 'Poisson';
      ServiceDistr = 'Exponential';
      print(meanArrival);
      print(meanservice);
      print(singleServerUtilization);
      print(avgLengthQueue_singleServer);
      print(avgLengthSys_singleServer);
      print(avgWaitQueue_singleServer);
      print(avgWaitSys_singleServer);
    } else {
      kendallNotation = 'M/M/$servers';
      ArrivalDistr = 'Poisson';
      ServiceDistr = 'Exponential';

      multiserverRho(meanArrival, meanservice, servers);
      pnotSumm(meanArrival, meanservice, double.parse(servers.toString()));
      pnotRemaining(double.parse(servers.toString()));
      multiServerLq(meanArrival, meanservice);
      multiServerLs(meanArrival, meanservice);
      multiServerWq(avgLengthQueue_multiServer, meanArrival);
      multiServerWs(avgWaitQueue_multiServer, meanservice);
      Ncust(multiServerUtilization);

      print(meanArrival);
      print(meanservice);
      print(multiServerUtilization);
      print(avgLengthQueue_multiServer);
      print(avgLengthSys_multiServer);
      print(avgWaitSys_multiServer);
      print(avgWaitQueue_multiServer);
      print(pnot);
      notifyListeners();
    }
  }

  MGGamma() {
    if (servers == 1) {
      GammaAverage(maximum, minimum);
      if (numericVal == 0) {
        meanservice = 1 / GammaMean;
      } else if (numericVal == 1) {
        meanservice = GammaMean;
      }
      GammaVar(maximum, minimum);
      SqQuoArr((1 / (meanArrival * meanArrival)), meanArrival);
      singleserverRho(meanArrival, meanservice);
      MGlq(meanArrival, singleServerUtilization, GammaVariance);
      MGwq(avgLengthQueue_singleServer, meanArrival);
      MGws(avgWaitQueue_singleServer, meanservice);
      MGls(meanArrival, avgWaitSys_singleServer);
      Ncust(singleServerUtilization);
      print(singleServerUtilization);
      print(avgLengthQueue_singleServer);
      print(avgWaitQueue_singleServer);
      print(avgWaitSys_singleServer);
      print(avgLengthSys_singleServer);
      kendallNotation = 'M/G/1';
      ArrivalDistr = 'Poisson';
      ServiceDistr = 'Gamma ';
    } else {
      kendallNotation = 'M/G/$servers';
      ArrivalDistr = 'Poisson';
      ServiceDistr = 'Gamma ';
      GammaAverage(maximum, minimum);
      if (numericVal == 0) {
        meanservice = 1 / GammaMean;
      } else if (numericVal == 1) {
        meanservice = GammaMean;
      }
      GammaVar(maximum, minimum);
      multiserverRho(meanArrival, meanservice, servers);
      pnotSumm(meanArrival, meanservice, double.parse(servers.toString()));
      pnotRemaining(double.parse(servers.toString()));
      multiServerLq(meanArrival, meanservice);
      multiServerWq(avgLengthQueue_multiServer, meanArrival);

      SqQuoArr((1 / (meanArrival * meanArrival)), meanArrival);
      SqQuoSer(GammaVariance, GammaMean);
      avgWaitQueue_multiServer =
          avgWaitQueue_multiServer * ((SqCoefVarArr + SqCoefVarSer) / 2);
      print(avgWaitQueue_multiServer);
      // print(SqCoefVarArr);
      // print(SqCoefVarSer);
      avgLengthQueue_multiServer = avgWaitQueue_multiServer * meanArrival;
      avgWaitSys_multiServer = avgWaitQueue_multiServer + GammaMean;
      avgLengthSys_multiServer = meanArrival * avgWaitSys_multiServer;
      Ncust(multiServerUtilization);
    }
    notifyListeners();
  }

  MGUniform() {
    if (servers == 1) {
      UniformAverage(maximum, minimum);
      if (numericVal == 0) {
        meanservice = 1 / UniformMean;
      } else if (numericVal == 1) {
        meanservice = UniformMean;
      }
      UniformVar(maximum, minimum);
      singleserverRho(meanArrival, meanservice);
      MGlq(meanArrival, singleServerUtilization, UniformVariance);
      MGwq(avgLengthQueue_singleServer, meanArrival);
      MGws(avgWaitQueue_singleServer, meanservice);
      MGls(meanArrival, avgWaitSys_singleServer);
      Ncust(singleServerUtilization);
      kendallNotation = 'M/G/1';
      ArrivalDistr = 'Poisson';
      ServiceDistr = 'Uniform ';
      print(singleServerUtilization);
      print(avgLengthQueue_singleServer);
      print(avgWaitQueue_singleServer);
      print(avgWaitSys_singleServer);
      print(avgLengthSys_singleServer);
    } else {
      kendallNotation = 'M/G/$servers';
      ArrivalDistr = 'Poisson';
      ServiceDistr = 'Uniform ';
      UniformAverage(maximum, minimum);
      if (numericVal == 0) {
        meanservice = 1 / UniformMean;
      } else if (numericVal == 1) {
        meanservice = UniformMean;
      }
      UniformVar(maximum, minimum);
      multiserverRho(meanArrival, meanservice, servers);
      pnotSumm(meanArrival, meanservice, double.parse(servers.toString()));
      pnotRemaining(double.parse(servers.toString()));
      multiServerLq(meanArrival, meanservice);
      multiServerWq(avgLengthQueue_multiServer, meanArrival);

      SqQuoArr((1 / (meanArrival * meanArrival)), meanArrival);
      SqQuoSer(UniformVariance, UniformMean);
      avgWaitQueue_multiServer =
          avgWaitQueue_multiServer * ((SqCoefVarArr + SqCoefVarSer) / 2);
      print(avgWaitQueue_multiServer);
      // print(SqCoefVarArr);
      // print(SqCoefVarSer);
      avgLengthQueue_multiServer = avgWaitQueue_multiServer * meanArrival;
      avgWaitSys_multiServer = avgWaitQueue_multiServer + UniformMean;
      avgLengthSys_multiServer = meanArrival * avgWaitSys_multiServer;
      Ncust(multiServerUtilization);
      print(UniformMean);
      print(UniformVariance);
    }
    notifyListeners();
  }

  MGBeta() {
    if (servers == 1) {
      BetaAverage(maximum, minimum);
      if (numericVal == 0) {
        meanservice = 1 / BetaMean;
      } else if (numericVal == 1) {
        meanservice = BetaMean;
      }
      BetaVar(maximum, minimum);
      singleserverRho(meanArrival, meanservice);
      MGlq(meanArrival, singleServerUtilization, BetaVariance);
      MGwq(avgLengthQueue_singleServer, meanArrival);
      MGws(avgWaitQueue_singleServer, meanservice);
      MGls(meanArrival, avgWaitSys_singleServer);
      Ncust(singleServerUtilization);
      print(singleServerUtilization);
      print(avgLengthQueue_singleServer);
      print(avgWaitQueue_singleServer);
      print(avgWaitSys_singleServer);
      print(avgLengthSys_singleServer);
      kendallNotation = 'M/G/1';
      ArrivalDistr = 'Poisson';
      ServiceDistr = 'Beta';
    } else {
      kendallNotation = 'M/G/$servers';
      ArrivalDistr = 'Poisson';
      ServiceDistr = 'Beta ';
      BetaAverage(maximum, minimum);
      BetaAverage(maximum, minimum);
      if (numericVal == 0) {
        meanservice = 1 / BetaMean;
      } else if (numericVal == 1) {
        meanservice = BetaMean;
      }
      BetaVar(maximum, minimum);
      multiserverRho(meanArrival, meanservice, servers);
      pnotSumm(meanArrival, meanservice, double.parse(servers.toString()));
      pnotRemaining(double.parse(servers.toString()));
      multiServerLq(meanArrival, meanservice);
      multiServerWq(avgLengthQueue_multiServer, meanArrival);

      SqQuoArr((1 / (meanArrival * meanArrival)), meanArrival);
      SqQuoSer(BetaVariance, BetaMean);
      avgWaitQueue_multiServer =
          avgWaitQueue_multiServer * ((SqCoefVarArr + SqCoefVarSer) / 2);
      print(avgWaitQueue_multiServer);
      // print(SqCoefVarArr);
      // print(SqCoefVarSer);
      avgLengthQueue_multiServer = avgWaitQueue_multiServer * meanArrival;
      avgWaitSys_multiServer = avgWaitQueue_multiServer + BetaMean;
      avgLengthSys_multiServer = meanArrival * avgWaitSys_multiServer;
      Ncust(multiServerUtilization);
    }
    notifyListeners();
  }

//----------------------------------------Indirect Method----------------------------//

  final List<ABdata> InterArrivalService = [];
  final List<CDdata> InterArrivalServiceMulti = [];
  List<double> InterArrivalList = [];
  List<double> ServiceList = [];
  List<double> ArrivalList = [];
  List<double> ServiceStart = [];
  List<double> ServiceEnd = [];
  List<double> Idle = [];
  List<double> TAT = [];
  List<double> WTQ = [];
  double totalArrival = 0;
  double totalService = 0;
  double totalIAT = 0;
  double totalTAT = 0;
  double totalWTQ = 0;
  double totalIdle = 0;
  double totalServer1 = 0;
  double totalServer2 = 0;
  double AvgTimeCustSpendMartSingle = 0;
  double AvgTimeCustWaitMartSingle = 0;
  double AvgTimeServiceMartSingle = 0;
  double AvgIATSingle = 0;
  double AvgWaitTimeWhoWait = 0;
  double idlePercSingle = 0;
  double utilzePercSingle = 0;
  double utilzePercServer1 = 0;
  double utilzePercServer2 = 0;

  List<double> server1 = [];
  List<double> server2 = [];

  ArrivServ() {
    //---------Arrival loop from interarrival---------//
    for (var i = 0; i < InterArrivalList.length; i++) {
      if (i == 0) {
        ArrivalList.add(InterArrivalList[i]);
      } else {
        ArrivalList.add(InterArrivalList[i] + ArrivalList[i - 1]);
      }
    }
    //----------Service start,end and idol loop------//
    for (var i = 0; i < ServiceList.length; i++) {
      if (i == 0) {
        ServiceStart.add(ArrivalList[i]);
        ServiceEnd.add(ServiceList[i]);
        Idle.add(0);
      } else {
        if (ServiceEnd[i - 1] < ArrivalList[i]) {
          ServiceStart.add(ArrivalList[i]);
          ServiceEnd.add(ArrivalList[i] + ServiceList[i]);
          Idle.add(ServiceStart[i] - ServiceEnd[i - 1]);
        } else {
          ServiceStart.add(ServiceEnd[i - 1]);
          ServiceEnd.add(ServiceStart[i] + ServiceList[i]);
          Idle.add(ServiceStart[i] - ServiceEnd[i - 1]);
        }
      }
    }
    //-------TAT,Wait in queue,Server Utilization------//

    for (var i = 0; i < ServiceList.length; i++) {
      TAT.add(ServiceEnd[i] - ArrivalList[i]);
    }
    for (var i = 0; i < ServiceList.length; i++) {
      WTQ.add(TAT[i] - ServiceList[i]);
    }
    for (var i = 0; i < ArrivalList.length; i++) {
      histData.add(HISTDATA(InterArrivalList[i]));
    }
    for (var i = 0; i < ArrivalList.length; i++) {
      histDataArrival.add(HISTDATA_ARRIVAL(ArrivalList[i]));
    }
    for (var i = 0; i < ArrivalList.length; i++) {
      histDataService.add(HISTDATA_SERVICE(ServiceList[i]));
    }
    //  List<dynamic> TimeRangeServiceStart = [];
    //  List<dynamic> TimeRangeServiceEnd = [];

    // for (var i = 0; i < ArrivalList.length; i++) {
    //   TimeRangeServiceStart.add(Duration(minutes: (ServiceStart[i]).toInt()));
    //   TimeRangeServiceEnd.add(Duration(minutes: (ServiceEnd[i]).toInt()));
    // }

    for (var i = 0; i < ArrivalList.length; i++) {
      step1data.add(STEP1(customers[i], WTQ[i], TAT[i]));
    }
    // -------uploading data from list to class--------//
    for (var i = 0; i < ServiceList.length; i++) {
      InterArrivalService.add(ABdata(
          InterArrivalList[i],
          ServiceList[i],
          ArrivalList[i],
          ServiceStart[i],
          ServiceEnd[i],
          Idle[i],
          TAT[i],
          WTQ[i]));
    }
  }

  ArrivServ2() {
    //---------Arrival loop from interarrival---------//
    for (var i = 0; i < InterArrivalList.length; i++) {
      if (i == 0) {
        ArrivalList.add(InterArrivalList[i]);
      } else {
        ArrivalList.add(InterArrivalList[i] + ArrivalList[i - 1]);
      }
    }
    //----------Service start,end and servers utilization loop------//
    for (var i = 0; i < ServiceList.length; i++) {
      if (i == 0) {
        ServiceStart.add(ArrivalList[i]);
        ServiceEnd.add(ServiceList[i]);
        server1.add(ServiceList[i]);
        server2.add(0);
      } else {
        if (ServiceEnd[i - 1] > ArrivalList[i]) {
          server2.add(ServiceList[i]);
          ServiceStart.add(ArrivalList[i]);
          ServiceEnd.add(ArrivalList[i] + server2[i]);

          server1.add(0);
        } else {
          server1.add(ServiceList[i]);
          ServiceStart.add(ArrivalList[i]);
          ServiceEnd.add(ServiceStart[i] + server1[i]);

          server2.add(0);
        }
      }
    }
    //-------TAT,Wait in queue,Server Utilization------//

    for (var i = 0; i < ServiceList.length; i++) {
      TAT.add(ServiceEnd[i] - ArrivalList[i]);
    }
    for (var i = 0; i < ServiceList.length; i++) {
      WTQ.add(TAT[i] - ServiceList[i]);
    }
    for (var i = 0; i < ArrivalList.length; i++) {
      histData.add(HISTDATA(InterArrivalList[i]));
    }
    for (var i = 0; i < ArrivalList.length; i++) {
      histDataArrival.add(HISTDATA_ARRIVAL(ArrivalList[i]));
    }
    for (var i = 0; i < ArrivalList.length; i++) {
      histDataService.add(HISTDATA_SERVICE(ServiceList[i]));
    }
    // -------uploading data from list to class--------//
    for (var i = 0; i < ServiceList.length; i++) {
      InterArrivalServiceMulti.add(CDdata(
          InterArrivalList[i],
          ServiceList[i],
          ArrivalList[i],
          ServiceStart[i],
          ServiceEnd[i],
          TAT[i],
          WTQ[i],
          server1[i],
          server2[i]));
    }
  }

  ServiceTime() {
    ArrivServ();
    totalArrival = ArrivalList.sum;
    totalService = ServiceList.sum;
    totalIAT = InterArrivalList.sum;
    totalIdle = Idle.sum;
    totalWTQ = WTQ.sum;
    totalTAT = TAT.sum;
    AvgTimeCustSpendMartSingle = (totalTAT / ArrivalList.length);
    AvgTimeCustWaitMartSingle = (totalWTQ / ArrivalList.length);
    AvgTimeServiceMartSingle = (totalService / ArrivalList.length);
    AvgIATSingle = (totalIAT / (ArrivalList.length - 1));
    AvgWaitTimeWhoWait = (totalWTQ / (ArrivalList.length - 1));
    idlePercSingle = (totalIdle / totalService) * 100;
    utilzePercSingle = 100 - idlePercSingle;
  }

  ServiceTime2() {
    ArrivServ2();
    totalArrival = ArrivalList.sum;
    totalService = ServiceList.sum;
    totalIAT = InterArrivalList.sum;
    totalWTQ = WTQ.sum;
    totalTAT = TAT.sum;
    totalServer1 = server1.sum;
    totalServer2 = server2.sum;
    AvgTimeCustSpendMartSingle = (totalTAT / ArrivalList.length);
    AvgTimeCustWaitMartSingle = (totalWTQ / ArrivalList.length);
    AvgTimeServiceMartSingle = (totalService / ArrivalList.length);
    AvgIATSingle = (totalIAT / (ArrivalList.length - 1));
    AvgWaitTimeWhoWait = (totalWTQ / (ArrivalList.length - 1));
    utilzePercServer1 = (totalServer1 / totalService) * 100;
    utilzePercServer2 = (totalServer2 / totalService) * 100;
  }

  //------------------------RANDOM NUMBER GENERATION-----------//

  double e = 2.718281828459045;
  int x = 0;
  List<double> cdf = [];
  List<double> cdf2 = [];
  List<int> obs = [];
  List<double> randomNumbers = [];
  List<int> Interarrivals = [];
  List<int> service = [];
  List<int> arrivals = [];
  List<int> customers = [];
  List<String> parameters = [
    'Avg TAT',
    'Avg wait time in mart',
    'Avg Service Time',
    'Avg IAT',
    'Avg WT of those Who Wait'
  ];
  List<double> valuess = [];
  final List<Color> colors = <Color>[
    Colors.red,
    Colors.blue,
    Colors.amber,
    Colors.teal,
    Colors.pink
  ];

  List<int> timelyInterarrivals = [];
  List<int> timelyservice = [];
  List<int> timelyarrivals = [];

  List<double> timelyServiceStart = [];
  List<double> timelyServiceEnd = [];
  List<double> timelyIdle = [];
  List<double> timelyTAT = [];
  List<double> timelyWTQ = [];
  int timelytotalArrival = 0;
  int timelytotalService = 0;
  int timelytotalIAT = 0;
  int timelytotalTAT = 0;
  int timelytotalWTQ = 0;
  int timelytotalIdle = 0;
  int timelytotalServer1 = 0;
  int timelytotalServer2 = 0;
  double timelyAvgTimeCustSpendMartSingle = 0;
  double timelyAvgTimeCustWaitMartSingle = 0;
  double timelyAvgTimeServiceMartSingle = 0;
  double timelyAvgIATSingle = 0;
  double timelyAvgWaitTimeWhoWait = 0;
  double timelyidlePercSingle = 0;
  double timelyutilzePercSingle = 0;
  double timelyutilzePercServer1 = 0;
  double timelyutilzePercServer2 = 0;

  List<double> timelyserver1 = [];
  List<double> timelyserver2 = [];

  List<double> timelyvaluess = [];
  List<int> timelycustomers = [];

  var random = new Random();

  List<double> historyAvgTATsingle = [];
  List<double> historyWaitTimesingle = [];
  List<double> historyAvgServiceTimesingle = [];
  List<double> historyAvgIATsingle = [];
  List<double> historyAvgWTTWWsingle = [];
  List<int> iteration = [];

  RandomlyGeneration() {
    double cdf1 =
        (((pow(e, -RandMEANarrival)) * (pow(RandMEANarrival, x))) / fact(x));
    x++;
    for (var i = 1; i == x; i++) {
      cdf1 +=
          (((pow(e, -RandMEANarrival)) * (pow(RandMEANarrival, x))) / fact(x));
      cdf.add(cdf1);

      if (cdf1 == 1) {
        break;
      } else {
        x++;
      }
    }
    for (var i = 0; i < cdf.length; i++) {
      cdf2.add(cdf[i]);
    }
    for (var i = 0; i < cdf.length; i++) {
      obs.add(i);
    }

    for (var i = 0; i < cdf.length; i++) {
      RandData.add(Randdata(cdf[i], cdf2[i], obs[i]));
    }

    for (var i = 0; i < cdf.length; i++) {
      randomNumbers.add(random.nextDouble());
    }

    for (int i = 0; i < cdf.length; i++) {
      for (int j = 0; j < cdf.length; j++) {
        if (randomNumbers[i] <= RandData[j].B &&
            randomNumbers[i] <= RandData[j].A) {
          Interarrivals.add(RandData[j].C);
          break;
        } else {
          print("nt happy");
        }
      }
    }

    cdf2.removeLast();
    cdf2.insert(0, 0);
    Interarrivals[0] = 0;
    for (var i = 0; i < cdf.length; i++) {
      if (i == 0) {
        arrivals.add(Interarrivals[i]);
      } else {
        arrivals.add(Interarrivals[i] + arrivals[i - 1]);
      }
    }
    //Service generation
    for (int i = 0; i < cdf.length; i++) {
      service.add((-RandMEANservice * log(random.nextDouble())).round());
    }
    // uploading data from list to class list:
    for (var i = 0; i < cdf.length; i++) {
      randomdata.add(Randomdata(cdf[i], cdf2[i], obs[i], randomNumbers[i],
          Interarrivals[i], arrivals[i], service[i]));
    }

    notifyListeners();
  }

  SingleTimeSimu() {
    // customers
    for (int i = 1; i < arrivals.length + 1; i++) {
      customers.add(i);
    }

    //------time simulation------//
    for (int i = 0; i < arrivals.length; i++) {
      if (arrivals[i] <= TimeSimulation) {
        timelyarrivals.add(arrivals[i]);
      } else {
        break;
      }
    }
    for (int i = 0; i < timelyarrivals.length; i++) {
      timelyInterarrivals.add(Interarrivals[i]);
    }
    for (int i = 0; i < timelyarrivals.length; i++) {
      timelyservice.add(service[i]);
    }
    //TIMELY CUSTOMERS
    for (int i = 1; i < timelyarrivals.length + 1; i++) {
      timelycustomers.add(i);
    }

    //----------Service start,end and idol loop------//
    for (var i = 0; i < timelyservice.length; i++) {
      if (i == 0) {
        timelyServiceStart.add(timelyarrivals[i].toDouble());
        timelyServiceEnd.add(timelyservice[i].toDouble());
        timelyIdle.add(0);
      } else {
        if (timelyServiceEnd[i - 1] < timelyarrivals[i]) {
          timelyServiceStart.add(timelyarrivals[i].toDouble());
          timelyServiceEnd
              .add(timelyarrivals[i].toDouble() + timelyservice[i].toDouble());
          timelyIdle.add(timelyServiceStart[i] - timelyServiceEnd[i - 1]);
        } else {
          timelyServiceStart.add(timelyServiceEnd[i - 1]);
          timelyServiceEnd.add(timelyServiceStart[i] + timelyservice[i]);
          timelyIdle.add(timelyServiceStart[i] - timelyServiceEnd[i - 1]);
        }
      }
    }
    //-------TAT,Wait in queue,Server Utilization------//

    for (var i = 0; i < timelyservice.length; i++) {
      timelyTAT.add(timelyServiceEnd[i] - timelyarrivals[i]);
    }
    for (var i = 0; i < timelyservice.length; i++) {
      timelyWTQ.add(timelyTAT[i] - timelyservice[i]);
    }

    ///---- upload timelydata to class---//
    for (var i = 0; i < timelyservice.length; i++) {
      randomtimely.add(RandomTimely(
          timelyInterarrivals[i].toDouble(),
          timelyservice[i].toDouble(),
          timelyarrivals[i].toDouble(),
          timelyServiceStart[i],
          timelyServiceEnd[i],
          timelyIdle[i],
          timelyTAT[i],
          timelyWTQ[i]));
    }

    //-------timely graphs -----//
    for (var i = 0; i < timelyarrivals.length; i++) {
      timelyhistData.add(TIMELYHISTDATA(timelyInterarrivals[i].toDouble()));
    }
    for (var i = 0; i < timelyarrivals.length; i++) {
      timelyhistDataArrival
          .add(TIMELY_HISTDATA_ARRIVAL(timelyarrivals[i].toDouble()));
    }
    for (var i = 0; i < timelyarrivals.length; i++) {
      timelyhistDataService
          .add(TIMELY_HISTDATA_SERVICE(timelyservice[i].toDouble()));
    }

    //---------
    for (int i = 0; i < Interarrivals.length; i++) {
      InterArrivalList.add(Interarrivals[i].toDouble());
      ServiceList.add(service[i].toDouble());
    }

    print(cdf2);
    print(cdf);
    print(randomNumbers);
    print(Interarrivals);
    print(timelyInterarrivals);
    print(arrivals);
    print(timelyarrivals);
    print(service);
    print(timelyservice);

    // -- simulation piechart data---//
    ServiceTime();
    print(AvgTimeCustSpendMartSingle);

    valuess.add(AvgTimeCustSpendMartSingle);
    valuess.add(AvgTimeCustWaitMartSingle);
    valuess.add(AvgTimeServiceMartSingle);
    valuess.add(AvgIATSingle);
    valuess.add(AvgWaitTimeWhoWait);

    //--HISTORY MAINTAIN--//
    historyAvgTATsingle.add(AvgTimeCustSpendMartSingle);
    historyWaitTimesingle.add(AvgTimeCustWaitMartSingle);
    historyAvgServiceTimesingle.add(AvgTimeServiceMartSingle);
    historyAvgIATsingle.add(AvgIATSingle);
    historyAvgWTTWWsingle.add(AvgWaitTimeWhoWait);
    iteration.add(count);
    print(historyAvgTATsingle);
    print(historyWaitTimesingle);
    print(historyAvgServiceTimesingle);
    print(historyAvgIATsingle);
    print(historyAvgWTTWWsingle);
    print(iteration);

    for (var i = 0; i < parameters.length; i++) {
      radial1data.add(RADIAL1(parameters[i], valuess[i], colors[i]));
    }

    timelytotalArrival = (timelyarrivals).sum;
    timelytotalService = timelyservice.sum;
    timelytotalIAT = timelyInterarrivals.sum;
    timelytotalIdle = timelyIdle.sum.toInt();
    timelytotalWTQ = timelyWTQ.sum.toInt();
    timelytotalTAT = timelyTAT.sum.toInt();
    timelyAvgTimeCustSpendMartSingle = (timelytotalTAT / timelyarrivals.length);
    timelyAvgTimeCustWaitMartSingle = (timelytotalWTQ / timelyarrivals.length);
    timelyAvgTimeServiceMartSingle =
        (timelytotalService / timelyarrivals.length);
    timelyAvgIATSingle = (timelytotalIAT / (timelyarrivals.length - 1));
    timelyAvgWaitTimeWhoWait = (timelytotalWTQ / (timelyarrivals.length - 1));
    timelyidlePercSingle = (timelytotalIdle / timelytotalService) * 100;
    timelyutilzePercSingle = 100 - timelyidlePercSingle;

//----------------Timely Pie chart data-------//
    timelyvaluess.add(timelyAvgTimeCustSpendMartSingle);
    timelyvaluess.add(timelyAvgTimeCustWaitMartSingle);
    timelyvaluess.add(timelyAvgTimeServiceMartSingle);
    timelyvaluess.add(timelyAvgIATSingle);
    timelyvaluess.add(timelyAvgWaitTimeWhoWait);

    for (var i = 0; i < parameters.length; i++) {
      timelyradial1data
          .add(TIMELYRADIAL1(parameters[i], timelyvaluess[i], colors[i]));
    }
    for (var i = 0; i < timelyarrivals.length; i++) {
      timelystep1data
          .add(TIMELY_STEP1(timelycustomers[i], timelyWTQ[i], timelyTAT[i]));
    }
    notifyListeners();
  }

  double meanHistoryTAT = 0;
  double meanHistoryWT = 0;
  double meanHistoryST = 0;
  double meanHistoryIAT = 0;
  double meanHistoryWTTWW = 0;

  double medHistoryTAT = 0;
  double medHistoryWT = 0;
  double medHistoryST = 0;
  double medHistoryIAT = 0;
  double medHistoryWTTWW = 0;

  double varHistoryTAT = 0;
  double varHistoryWT = 0;
  double varHistoryST = 0;
  double varHistoryIAT = 0;
  double varHistoryWTTWW = 0;

  double sdHistoryTAT = 0;
  double sdHistoryWT = 0;
  double sdHistoryST = 0;
  double sdHistoryIAT = 0;
  double sdHistoryWTTWW = 0;

  List<double> varHistoryTAT1 = [];
  List<double> varHistoryWT1 = [];
  List<double> varHistoryST1 = [];
  List<double> varHistoryIAT1 = [];
  List<double> varHistoryWTTWW1 = [];

  historySend() {
    for (var i = 0; i < historyAvgIATsingle.length; i++) {
      historyList.add(History(
          iteration[i],
          historyAvgTATsingle[i],
          historyWaitTimesingle[i],
          historyAvgServiceTimesingle[i],
          historyAvgIATsingle[i],
          historyAvgWTTWWsingle[i]));
    }
    ////-----------average----------///
    meanHistoryTAT = historyAvgTATsingle.sum / iteration.length;
    meanHistoryWT = historyWaitTimesingle.sum / iteration.length;
    meanHistoryST = historyAvgServiceTimesingle.sum / iteration.length;
    meanHistoryIAT = historyAvgIATsingle.sum / iteration.length;
    meanHistoryWTTWW = historyAvgWTTWWsingle.sum / iteration.length;

    ////-----------median----------///
    historyAvgTATsingle.sort();
    historyWaitTimesingle.sort();
    historyAvgServiceTimesingle.sort();
    historyAvgIATsingle.sort();
    historyAvgWTTWWsingle.sort();

    if (historyAvgTATsingle.length % 2 == 0) {
      double index1 = historyAvgTATsingle.length / 2;
      medHistoryTAT = (historyAvgTATsingle[index1.toInt()] +
              historyAvgTATsingle[(index1.toInt()) - 1]) /
          2;

      medHistoryWT = (historyWaitTimesingle[index1.toInt()] +
              historyWaitTimesingle[(index1.toInt()) - 1]) /
          2;

      medHistoryST = (historyAvgServiceTimesingle[index1.toInt()] +
              historyAvgServiceTimesingle[(index1.toInt()) - 1]) /
          2;

      medHistoryIAT = (historyAvgIATsingle[index1.toInt()] +
              historyAvgIATsingle[(index1.toInt()) - 1]) /
          2;

      medHistoryWTTWW = (historyAvgWTTWWsingle[index1.toInt()] +
              historyAvgWTTWWsingle[(index1.toInt()) - 1]) /
          2;
    } else {
      double index1 = (historyAvgTATsingle.length / 2).floorToDouble();
      medHistoryTAT = historyAvgTATsingle[index1.toInt()];
      medHistoryWT = historyWaitTimesingle[index1.toInt()];
      medHistoryST = historyAvgServiceTimesingle[index1.toInt()];
      medHistoryIAT = historyAvgIATsingle[index1.toInt()];
      medHistoryWTTWW = historyAvgWTTWWsingle[index1.toInt()];
    }

    ////-----------variance----------///

    for (var i = 0; i < historyAvgIATsingle.length; i++) {
      varHistoryTAT1
          .add(pow((historyAvgTATsingle[i] - meanHistoryTAT), 2).toDouble());
      varHistoryWT1
          .add(pow((historyWaitTimesingle[i] - meanHistoryWT), 2).toDouble());
      varHistoryST1.add(
          pow((historyAvgServiceTimesingle[i] - meanHistoryST), 2).toDouble());
      varHistoryIAT1
          .add(pow((historyAvgIATsingle[i] - meanHistoryIAT), 2).toDouble());
      varHistoryWTTWW1.add(
          pow((historyAvgWTTWWsingle[i] - meanHistoryWTTWW), 2).toDouble());
    }

    varHistoryTAT = ((varHistoryTAT1.sum) / (iteration.length - 1));
    varHistoryWT = ((varHistoryWT1.sum) / (iteration.length - 1));
    varHistoryST = ((varHistoryST1.sum) / (iteration.length - 1));
    varHistoryIAT = ((varHistoryIAT1.sum) / (iteration.length - 1));
    varHistoryWTTWW = ((varHistoryWTTWW1.sum) / (iteration.length - 1));

    ///--------------standard deviation------------////

    sdHistoryTAT = sqrt(varHistoryTAT);
    sdHistoryWT = sqrt(varHistoryWT);
    sdHistoryST = sqrt(varHistoryST);
    sdHistoryIAT = sqrt(varHistoryIAT);
    sdHistoryWTTWW = sqrt(varHistoryWTTWW);

    ///------------scatterd graphs--------------////

    for (var i = 0; i < iteration.length; i++) {
      meantatscatter.add(meanTATscatter(iteration[i], historyAvgTATsingle[i]));
      meanwtscatter.add(meanWTscatter(iteration[i], historyWaitTimesingle[i]));
      meanstscatter
          .add(meanSTscatter(iteration[i], historyAvgServiceTimesingle[i]));
      meaniatscatter.add(meanIATscatter(iteration[i], historyAvgIATsingle[i]));
      meanwttwscatter
          .add(meanWTTWscatter(iteration[i], historyAvgWTTWWsingle[i]));
    }

    print(meanHistoryST);
    print(medHistoryST);
    notifyListeners();
  }

  List<double> timelyServiceStartmulti = [];
  List<double> timelyServiceEndmulti = [];
  List<double> timelyIdlemulti = [];
  List<double> timelyTATmulti = [];
  List<double> timelyWTQmulti = [];
  int timelytotalArrivalmulti = 0;
  int timelytotalServicemulti = 0;
  int timelytotalIATmulti = 0;
  int timelytotalTATmulti = 0;
  int timelytotalWTQmulti = 0;
  int timelytotalIdlemulti = 0;
  int timelytotalServer1multi = 0;
  int timelytotalServer2multi = 0;
  double timelyAvgTimeCustSpendMartSinglemulti = 0;
  double timelyAvgTimeCustWaitMartSinglemulti = 0;
  double timelyAvgTimeServiceMartSinglemulti = 0;
  double timelyAvgIATSinglemulti = 0;
  double timelyAvgWaitTimeWhoWaitmulti = 0;
  double timelyidlePercSinglemulti = 0;
  double timelyutilzePercSinglemulti = 0;
  double timelyutilzePercServer1multi = 0;
  double timelyutilzePercServer2multi = 0;

  List<double> timelyserver1multi = [];
  List<double> timelyserver2multi = [];

  List<double> timelyvaluessmulti = [];

  multiSim() {
    // customers
    for (int i = 1; i < arrivals.length + 1; i++) {
      customers.add(i);
    }

    //------time simulation------//
    for (int i = 0; i < arrivals.length; i++) {
      if (arrivals[i] <= TimeSimulation) {
        timelyarrivals.add(arrivals[i]);
      } else {
        break;
      }
    }

    for (int i = 0; i < timelyarrivals.length; i++) {
      timelyInterarrivals.add(Interarrivals[i]);
    }
    for (int i = 0; i < timelyarrivals.length; i++) {
      timelyservice.add(service[i]);
    }
    //TIMELY CUSTOMERS
    for (int i = 1; i < timelyarrivals.length + 1; i++) {
      timelycustomers.add(i);
    }

    //----------Service start,end and servers utilization loop------//
    for (var i = 0; i < timelyservice.length; i++) {
      if (i == 0) {
        timelyServiceStartmulti.add(timelyarrivals[i].toDouble());
        timelyServiceEndmulti.add(timelyservice[i].toDouble());
        timelyserver1multi.add(timelyservice[i].toDouble());
        timelyserver2multi.add(0);
      } else {
        if (timelyServiceEndmulti[i - 1] > timelyarrivals[i]) {
          timelyserver2multi.add(timelyservice[i].toDouble());
          timelyServiceStartmulti.add(timelyarrivals[i].toDouble());
          timelyServiceEndmulti.add(timelyarrivals[i] + timelyserver2multi[i]);

          timelyserver1multi.add(0);
        } else {
          timelyserver1multi.add(timelyservice[i].toDouble());
          timelyServiceStartmulti.add(timelyarrivals[i].toDouble());
          timelyServiceEndmulti
              .add(timelyServiceStartmulti[i] + timelyserver1multi[i]);

          timelyserver2multi.add(0);
        }
      }
    }

    //-------TAT,Wait in queue,Server Utilization------//

    for (var i = 0; i < timelyservice.length; i++) {
      timelyTATmulti.add(timelyServiceEndmulti[i] - timelyarrivals[i]);
    }
    for (var i = 0; i < timelyTATmulti.length; i++) {
      timelyWTQmulti.add(timelyTATmulti[i] - timelyservice[i]);
    }
    print(timelyInterarrivals);
    print(timelyservice);
    print(timelyarrivals);
    print(timelyServiceStartmulti);
    print(timelyServiceEndmulti);
    print(timelyTATmulti);
    print(timelyWTQmulti);
    print(timelyserver1multi);
    print(timelyserver2multi);

    ///---- upload timelydata to class---//
    for (var i = 0; i < timelyservice.length; i++) {
      randomtimelymulti.add(RandomTimelyMulti(
          timelyInterarrivals[i].toDouble(),
          timelyservice[i].toDouble(),
          timelyarrivals[i].toDouble(),
          timelyServiceStartmulti[i].toDouble(),
          timelyServiceEndmulti[i].toDouble(),
          timelyTATmulti[i].toDouble(),
          timelyWTQmulti[i].toDouble(),
          timelyserver1multi[i].toDouble(),
          timelyserver2multi[i].toDouble()));
    }

    //-------timely graphs -----//
    for (var i = 0; i < timelyarrivals.length; i++) {
      timelyhistData.add(TIMELYHISTDATA(timelyInterarrivals[i].toDouble()));
    }
    for (var i = 0; i < timelyarrivals.length; i++) {
      timelyhistDataArrival
          .add(TIMELY_HISTDATA_ARRIVAL(timelyarrivals[i].toDouble()));
    }
    for (var i = 0; i < timelyarrivals.length; i++) {
      timelyhistDataService
          .add(TIMELY_HISTDATA_SERVICE(timelyservice[i].toDouble()));
    }

    // uploading data from list to class list:
    for (var i = 0; i < cdf.length; i++) {
      randomdata.add(Randomdata(cdf[i], cdf2[i], obs[i], randomNumbers[i],
          Interarrivals[i], arrivals[i], service[i]));
    }

    // -- simulation piechart data---//

    for (var i = 0; i < Interarrivals.length; i++) {
      InterArrivalList.add(Interarrivals[i].toDouble());
      ServiceList.add(service[i].toDouble());
    }
    ServiceTime2();
    print(AvgTimeCustSpendMartSingle);
    valuess.add(AvgTimeCustSpendMartSingle);
    valuess.add(AvgTimeCustWaitMartSingle);
    valuess.add(AvgTimeServiceMartSingle);
    valuess.add(AvgIATSingle);
    valuess.add(AvgWaitTimeWhoWait);

    for (var i = 0; i < parameters.length; i++) {
      radial1data.add(RADIAL1(parameters[i], valuess[i], colors[i]));
    }

    timelytotalArrival = (timelyarrivals).sum;
    timelytotalService = timelyservice.sum;
    timelytotalIAT = timelyInterarrivals.sum;
    timelytotalIdle = timelyIdle.sum.toInt();
    timelytotalWTQ = timelyWTQ.sum.toInt();
    timelytotalTAT = timelyTAT.sum.toInt();
    timelyAvgTimeCustSpendMartSingle = (timelytotalTAT / timelyarrivals.length);
    timelyAvgTimeCustWaitMartSingle = (timelytotalWTQ / timelyarrivals.length);
    timelyAvgTimeServiceMartSingle =
        (timelytotalService / timelyarrivals.length);
    timelyAvgIATSingle = (timelytotalIAT / (timelyarrivals.length - 1));
    timelyAvgWaitTimeWhoWait = (timelytotalWTQ / (timelyarrivals.length - 1));
    timelyidlePercSingle = (timelytotalIdle / timelytotalService) * 100;
    timelyutilzePercSingle = 100 - timelyidlePercSingle;

//----------------Timely Pie chart data-------//
    timelyvaluess.add(timelyAvgTimeCustSpendMartSingle);
    timelyvaluess.add(timelyAvgTimeCustWaitMartSingle);
    timelyvaluess.add(timelyAvgTimeServiceMartSingle);
    timelyvaluess.add(timelyAvgIATSingle);
    timelyvaluess.add(timelyAvgWaitTimeWhoWait);

    for (var i = 0; i < parameters.length; i++) {
      timelyradial1data
          .add(TIMELYRADIAL1(parameters[i], timelyvaluess[i], colors[i]));
    }

    for (var i = 0; i < timelyWTQ.length; i++) {
      timelystep1data
          .add(TIMELY_STEP1(timelycustomers[i], timelyWTQ[i], timelyTAT[i]));
    }
    print("---------------------//////////\nyes\nyes");
    notifyListeners();
  }

  notifyListeners();
}
