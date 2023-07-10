part of '../../pages.dart';

class CurrentChart extends StatelessWidget {
  const CurrentChart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<FlSpot> spots = [];
    return Container(
      margin: const EdgeInsets.only(top: defaultMargin * 2),
      width: MediaQuery.of(context).size.width / 1.15,
      height: MediaQuery.of(context).size.height / 3.5,
      child: AspectRatio(
        aspectRatio: 1,
        child: StreamBuilder<QuerySnapshot>(
            stream: getDataChart(_nameNodeCollection),
            builder: (context, snapshot) {
              spots.clear();
              leftValue.clear();
              bottomValue.clear();
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                final documents = snapshot.data!.docs;

                documents.forEach((element) {
                  double value = toDouble(element["Current"]) * 1000.0;
                  Timestamp timestamp = element["Timestamp"] as Timestamp;
                  print(timestamp.millisecondsSinceEpoch.toDouble());
                  final spot = FlSpot(timestamp.millisecondsSinceEpoch.toDouble(), value);
                  spots.add(spot);
                });
              };
              print("spots current: $spots");



              return LineChart(
                LineChartData(
                  minX: spots.length > 0 ? spots.last.x : 0,
                  maxX:  spots.length > 0 ? spots.first.x : 0,
                  minY: spots.length > 0 ? spots.reduce((a, b) => a.y < b.y ? a : b).y : 0,
                  maxY: spots.length > 0 ? spots.reduce((a, b) => a.y > b.y ? a : b).y : 0,
                  titlesData: LineTitles.getTitleData(),
                  clipData:  FlClipData.none(),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    drawHorizontalLine: true,
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),

                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      maxContentWidth: 200,
                      fitInsideHorizontally: true,
                      fitInsideVertically: true,
                      tooltipBgColor: Colors.black,
                      getTooltipItems: (touchedSpots) {
                        return touchedSpots.map((LineBarSpot touchedSpot) {
                          final textStyle = TextStyle(
                            color: touchedSpot.bar.gradient?.colors[0] ??
                                touchedSpot.bar.color,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          );
                          final date = DateTime.fromMillisecondsSinceEpoch(touchedSpot.x.toInt());
                          final formattedDate = DateFormat('dd/MM/yyyy\nHH:mm:ss').format(date);
                          return LineTooltipItem(
                            '$formattedDate \n\n Value: ${touchedSpot.y.toStringAsFixed(2)}',
                            textStyle,
                          );
                        }).toList();
                      },
                    ),
                    handleBuiltInTouches: true,
                    getTouchLineStart: (data, index) => 0,
                  ),

                  lineBarsData: [
                    LineChartBarData(
                      spots: spots,
                      isCurved: false,
                      color: Colors.blue,
                      barWidth: 2.5,
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.blue.withOpacity(0.3),
                      ),
                      show: true,
                      curveSmoothness: 0.35,
                    ),
                  ],
                ),
                  swapAnimationDuration: Duration(milliseconds: 150), // Optional
                  swapAnimationCurve: Curves.linear
              );
            }
        ),
      ),
    );
  }
}
