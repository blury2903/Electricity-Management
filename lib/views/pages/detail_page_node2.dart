part of 'pages.dart';



class DetailPageNode2 extends StatefulWidget {
  const DetailPageNode2({super.key});


  @override
  State<DetailPageNode2> createState() => _DetailPageNode2State();
}


class _DetailPageNode2State extends State<DetailPageNode2> {

  @override
  void initState() {
    super.initState();
    _nameNodeCollection = 'Node2_Data';
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
                          '${dbNode2.dbEnergy} Wh',
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
                      '${dbNode2.dbVoltage} V',
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
                      '${dbNode2.dbCurrent} mA',
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
                      '${dbNode2.dbPower} W',
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
                      '${dbNode2.dbFrequency} Hz',
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
                      '${dbNode2.dbPowerFactor}',
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
                    '${dbNode2.dbTemperature} \u{00B0}C',
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
                    '${dbNode2.dbHumidity} %',
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
    // _getData();
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
                'Node 02',
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
          stream: getDataNodeStream('Node2_Data'),
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
