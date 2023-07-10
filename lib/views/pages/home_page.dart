part of 'pages.dart';






class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {





  @override
  Widget build(BuildContext context) {

    TextAlarmColor textCardColor1 = TextAlarmColor(Colors.black, Colors.black, Colors.black, Colors.black);
    TextAlarmColor textCardColor2 = TextAlarmColor(Colors.black, Colors.black, Colors.black, Colors.black);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Row(
          children: [
            Text(
              'Energy Meter',
              style: whiteTextStyleInter.copyWith(
                fontWeight: regular,
                fontSize: 14,
              )
            ),
            const SizedBox(width: 240),
            Auth()._signOutButton(),
          ],
        ),
      ),
      body: SingleChildScrollView(
            child: Column(
              children:  [
                StreamBuilder<QuerySnapshot>(
                  stream: getDataNodeStream('Node1_Data'),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if(!snapshot.hasData) {
                      return Text("No Data");
                    }

                    if (snapshot.hasData) {
                      final documents = snapshot.data!.docs;
                      documents.forEach((element) {
                        dbNode1.dbVoltage = element["Voltage"];
                        dbNode1.dbEnergy = (toDouble(element["Energy"]) * 1000.0).toString();
                        dbNode1.dbCurrent = (toDouble(element["Current"]) * 1000.0).toString();
                        dbNode1.dbPower = element["Power"];
                        dbNode1.dbFrequency = element["Frequency"];
                        dbNode1.dbPowerFactor = element["PowerFactor"];
                        dbNode1.dbHumidity = element["Humidity"];
                        dbNode1.dbTemperature = element["Temperature"];
                      });
                    }




                    return StreamBuilder<DocumentSnapshot>(
                      stream: getAlarmValue('Node1'),
                      builder: (context, snapshot) {
                        if(!snapshot.hasData) {
                          return const CircularProgressIndicator();
                        }
                        final alarmVol = snapshot.data!.get('Voltage');
                        final alarmCur = snapshot.data!.get('Current');
                        final alarmEne = snapshot.data!.get('Energy');
                        final alarmPow = snapshot.data!.get('Power');

                        textCardColor1 = getTextCard(dbNode1, alarmVol, alarmCur, alarmEne, alarmPow);
                        return CustomCardRoom(
                          lImage: 'assets/2706.jpg',
                          tRoom: 'NODE 01',
                          sEnergy: '${dbNode1.dbEnergy} Wh',
                          cVoltage: '${dbNode1.dbVoltage} V',
                          cCurrent: '${dbNode1.dbCurrent} mA',
                          cPower: '${dbNode1.dbPower} W',
                          cFrequency: '${dbNode1.dbFrequency} Hz',
                          cPowerFactor: '${dbNode1.dbPowerFactor} ',
                          textCardColor: textCardColor1,
                        );
                      }
                    );
                  }
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: getDataNodeStream('Node2_Data'),
                    builder: (context, snapshot) {

                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if(!snapshot.hasData) {
                        return Text("No Data");
                      }

                      if (snapshot.hasData) {
                        final documents = snapshot.data!.docs;
                        documents.forEach((element) {
                          dbNode2.dbVoltage = element["Voltage"];
                          dbNode2.dbEnergy = (toDouble(element["Energy"]) * 1000.0).toString();
                          dbNode2.dbCurrent = (toDouble(element["Current"]) * 1000.0).toString();
                          dbNode2.dbPower = element["Power"];
                          dbNode2.dbFrequency = element["Frequency"];
                          dbNode2.dbPowerFactor = element["PowerFactor"];
                          dbNode2.dbHumidity = element["Humidity"];
                          dbNode2.dbTemperature = element["Temperature"];
                        });
                      }

                      return StreamBuilder<DocumentSnapshot>(
                        stream: getAlarmValue('Node2'),
                        builder: (context, snapshot) {
                          if(!snapshot.hasData) {
                            return const CircularProgressIndicator();
                          }
                          final alarmVol = snapshot.data!.get('Voltage');
                          final alarmCur = snapshot.data!.get('Current');
                          final alarmEne = snapshot.data!.get('Energy');
                          final alarmPow = snapshot.data!.get('Power');

                          textCardColor2 = getTextCard(dbNode2, alarmVol, alarmCur, alarmEne, alarmPow);
                          return CustomCardRoom(
                            lImage: 'assets/2706.jpg',
                            tRoom: 'NODE 02',
                            sEnergy: '${dbNode2.dbEnergy} Wh',
                            cVoltage: '${dbNode2.dbVoltage} V',
                            cCurrent: '${dbNode2.dbCurrent} mA',
                            cPower: '${dbNode2.dbPower} W',
                            cFrequency: '${dbNode2.dbFrequency} Hz',
                            cPowerFactor: '${dbNode2.dbPowerFactor} ',
                            textCardColor: textCardColor2,
                          );
                        }
                      );
                    }
                ),
                const SizedBox(
                  height: 65,
                ),
              ],
            ),

          )

    );
  }
}
