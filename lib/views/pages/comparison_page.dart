part of 'pages.dart';

class ComparisonPage extends StatefulWidget {
  const ComparisonPage({Key? key}) : super(key: key);

  @override
  State<ComparisonPage> createState() => _ComparisonPageState();
}

class _ComparisonPageState extends State<ComparisonPage> {

  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'Energy Meter',
          style: whiteTextStyleInter.copyWith(
            fontWeight: regular,
            fontSize: 14,
          ),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 30,
            ),
          ),
          Text(
            'ENERGY CONSUMPTION',
            style: blackTextStyleInter.copyWith(
              fontSize: 30,
              fontWeight: bold,
            ),
          ),
          AspectRatio(
            aspectRatio: 1.3,
            child: Row(
              children: <Widget>[
            const SizedBox(
            height: 18,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: StreamBuilder<QuerySnapshot>(
                  stream: getDataNodeStream('Node1_Data'),
                  builder: (context, snapshot1) {
                    if(!snapshot1.hasData) {
                      return const CircularProgressIndicator();
                    }
                    return StreamBuilder(
                      stream: getDataNodeStream('Node2_Data'),
                      builder: (context, snapshot2) {
                        if(!snapshot2.hasData) {
                          return const CircularProgressIndicator();
                        }

                        final List<PieChartSectionData> sections = showingSections(snapshot1.data!, snapshot2.data!);

                        return PieChart(

                          PieChartData(
                            pieTouchData: PieTouchData(
                              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                                setState(() {
                                  if (!event.isInterestedForInteractions ||
                                      pieTouchResponse == null ||
                                      pieTouchResponse.touchedSection == null) {
                                    touchedIndex = -1;
                                    return;
                                  }
                                  touchedIndex = pieTouchResponse
                                      .touchedSection!.touchedSectionIndex;
                                });
                              },
                            ),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            sectionsSpace: 0,
                            centerSpaceRadius: 40,
                            sections: sections,
                          ),
                          swapAnimationDuration: const Duration(milliseconds: 150), // Optional
                          swapAnimationCurve: Curves.linear, // Optional
                        );

                      }
                    );
                  }
                )
              ),
            ),
             Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Indicator(
                  color: Colors.red,
                  text: 'Node 1',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.blue,
                  text: 'Node 2',
                  isSquare: true,
                ),
              ],
            ),
            const SizedBox(
              width: 28,
            ),
            ],
          ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: getDataNodeStream('Node1_Data'),
            builder: (context, snapshot1) {
              if(!snapshot1.hasData) {
                return const CircularProgressIndicator();
              }
              return StreamBuilder<QuerySnapshot>(
                stream: getDataNodeStream('Node2_Data'),
                builder: (context, snapshot2) {
                  if(!snapshot2.hasData) {
                    return const CircularProgressIndicator();
                  }
                  final document1 = snapshot1.data!.docs;
                  final document2 = snapshot2.data!.docs;
                  String value1 = '';
                  String value2 = '';
                  double formatValue1 = 0.0;
                  double formatValue2 = 0.0;


                  document1.forEach((element) {
                    value1 = element['Energy'];
                  });
                  document2.forEach((element) {
                    value2 = element['Energy'];
                  });
                  formatValue1 = toDouble(value1) * 100.0;
                  formatValue2 = toDouble(value2) * 100.0;
                  double total = formatValue1 + formatValue2;

                  return Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 50,
                          left: 20,
                          right: 0,
                          bottom: 0,
                        ),
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 0,
                              left: 20,
                              right: 0,
                              bottom: 0,
                            ),
                          ),
                          Text(
                            'Total (Wh):     ',
                            style: greyTextStyleInter.copyWith(
                              fontSize: 20,
                              fontWeight: bold,
                            ),
                          ),
                          Text(
                            '${total.toStringAsFixed(2)} ',
                            style: blackTextStyleInter.copyWith(
                              fontSize: 30,
                              fontWeight: bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 20,
                            ),
                          ),
                          Text(
                            'Node 1 (Wh):   ',
                            style: greyTextStyleInter.copyWith(
                              fontSize: 20,
                              fontWeight: bold,
                            ),
                          ),
                          Text(
                            '${formatValue1.toStringAsFixed(2)} ',
                            style: blackTextStyleInter.copyWith(
                              fontSize: 30,
                              fontWeight: bold,
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 0,
                              left: 20,
                              right: 0,
                              bottom: 0,
                            ),
                          ),
                          Text(
                            'Node 2 (Wh):  ',
                            style: greyTextStyleInter.copyWith(
                              fontSize: 20,
                              fontWeight: bold,
                            ),
                          ),
                          Text(
                            '${formatValue2.toStringAsFixed(2)} ',
                            style: blackTextStyleInter.copyWith(
                              fontSize: 30,
                              fontWeight: bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                }
              );
            }
          ),

        ],
      )
    );
  }

  List<PieChartSectionData> showingSections(QuerySnapshot snapshot1, QuerySnapshot snapshot2) {

    final List<QueryDocumentSnapshot> documents1 = snapshot1.docs;
    final List<QueryDocumentSnapshot> documents2 = snapshot2.docs;

    final List<PieChartSectionData> sections = [];

    for (int i = 0; i < 2; i++) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      String value1 = '';
      String value2 = '';
      double formatValue1 = 0.0;
      double formatValue2 = 0.0;
      double percentValue1 = 0.0;
      double percentValue2 = 0.0;

      documents1.forEach((element) {
        value1 = element['Energy'];
      });
      documents2.forEach((element) {
        value2 = element['Energy'];
      });
      formatValue1 = toDouble(value1) * 100.0;
      formatValue2 = toDouble(value2) * 100.0;
      double total = formatValue1 + formatValue2;
      percentValue1 = toDouble(((formatValue1 * 100.0) / total).toStringAsFixed(2));
      percentValue2 = toDouble(((formatValue2 * 100.0) / total).toStringAsFixed(2));

      switch (i) {
        case 0:


          sections.add(
            PieChartSectionData(
              color: Colors.red,
              value: percentValue1,
              title: '${percentValue1.toString()} %',
              radius: radius,
              titleStyle: blackTextStyleInter.copyWith(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                shadows: shadows,
              ),
            ),
          );
          break;
        case 1:

          sections.add(
            PieChartSectionData(
              color: Colors.blue,
              value: percentValue2,
              title: '${percentValue2.toString()} %',
              radius: radius,
              titleStyle: blackTextStyleInter.copyWith(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                shadows: shadows,
              ),
            ),
          );
          break;
        default:
          throw Error();
      }
    }

    return sections;
  }


}
