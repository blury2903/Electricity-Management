part of 'widget.dart';

class CustomChartBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;

  const CustomChartBottomNavigation({
    super.key,
    required this.onTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20, left: 18, right: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              onTap(0);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: ((selectedIndex == 0))
                            ? kSecondaryColor
                            : kThirdColor,
                      )),
                  width: 50,
                  child: Text(
                    'Energy',
                    style: whiteTextStyleInter.copyWith(
                      fontSize: 10,
                      color: ((selectedIndex == 0))
                          ? kSecondaryColor
                          : kThirdColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              onTap(1);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: ((selectedIndex == 1))
                            ? kSecondaryColor
                            : kThirdColor,
                      )),
                  width: 55,
                  child: Text(
                    'Voltage',
                    style: whiteTextStyleInter.copyWith(
                      fontSize: 10,
                      color: ((selectedIndex == 1))
                          ? kSecondaryColor
                          : kThirdColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              onTap(2);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: ((selectedIndex == 2))
                            ? kSecondaryColor
                            : kThirdColor,
                      )),
                  width: 50,
                  child: Text(
                    'Current',
                    style: whiteTextStyleInter.copyWith(
                      fontSize: 10,
                      color: ((selectedIndex == 2))
                          ? kSecondaryColor
                          : kThirdColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              onTap(3);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: ((selectedIndex == 3))
                            ? kSecondaryColor
                            : kThirdColor,
                      )),
                  width: 50,
                  child: Text(
                    'Power',
                    style: whiteTextStyleInter.copyWith(
                      fontSize: 10,
                      color: ((selectedIndex == 3))
                          ? kSecondaryColor
                          : kThirdColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
