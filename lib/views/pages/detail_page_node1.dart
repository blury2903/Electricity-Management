part of 'pages.dart';



class DetailPageNode1 extends StatefulWidget {
  const DetailPageNode1({super.key});


  @override
  State<DetailPageNode1> createState() => _DetailPageNode1State();
}


class _DetailPageNode1State extends State<DetailPageNode1> {

  @override
  void initState() {
    super.initState();
    _nameNodeCollection = 'Node1_Data';
  }




  Widget contentFirst() {

    return Padding(
      padding: const EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
        top: defaultMargin,
      ),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height/4,
        child:
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                         const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Energy',
                          style: greyTextStyleInter,
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${dbNode1.dbEnergy} Wh',
                          style: blackTextStyleInter.copyWith(
                            fontSize: 24,
                            fontWeight: bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      'Voltage',
                      style: greyTextStyleInter
                    ),
                    Text(
                      '${dbNode1.dbVoltage} V',
                      style: blackTextStyleInter.copyWith(
                        fontWeight: bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Current',
                      style: greyTextStyleInter,
                    ),
                    Text(
                      '${dbNode1.dbCurrent} mA',
                      style: blackTextStyleInter.copyWith(
                        fontWeight: bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Power',
                      style: greyTextStyleInter,
                    ),
                    Text(
                      '${dbNode1.dbPower} W',
                      style: blackTextStyleInter.copyWith(
                        fontWeight: bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                        'Frequency',
                        style: greyTextStyleInter
                    ),
                    Text(
                      '${dbNode1.dbFrequency} Hz',
                      style: blackTextStyleInter.copyWith(
                        fontWeight: bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Power Factor',
                      style: greyTextStyleInter,
                    ),
                    Text(
                      '${dbNode1.dbPowerFactor}',
                      style: blackTextStyleInter.copyWith(
                        fontWeight: bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  Widget contentSecond() {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height/2.4,
      child: const MainPageChart(),
    );
  }

  Widget contentThird() {
    return Container(

      margin: const EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
        top: defaultMargin,
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 9,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'Temperature',
                    style: greyTextStyleInter,

                  ),
                  Text(
                    '${dbNode1.dbTemperature} \u{00B0}C',
                    style: blackTextStyleInter.copyWith(
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Humidity',
                    style: greyTextStyleInter,
                  ),
                  Text(
                    '${dbNode1.dbHumidity} %',
                    style: blackTextStyleInter.copyWith(
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            title: Row(
              children: [
                const SizedBox(
                  width: 100,
                ),
                Expanded(
                  child: Text(
                    'Node 01',
                    style: whiteTextStyleInter.copyWith(fontSize: 16),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),

              ],
            ),
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: getDataNodeStream('Node1_Data'),
            builder: (context, snapshot) {

              if (snapshot.hasError) {
                return Text('Something went wrong');
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

              return SingleChildScrollView(
                      child: Column(
                        children: [
                          contentFirst(),
                          contentSecond(),
                          contentThird(),
                        ],
                      ),
                    );
            }
          ),
          //     }
          // ),

        );

  }
}
