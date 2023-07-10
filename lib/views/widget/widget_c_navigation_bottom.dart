part of 'widget.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;

  const CustomBottomNavigation({
    super.key,
    required this.onTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 60,
      width: double.infinity,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(defaultRadius),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              onTap(0);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/ic_home' +
                                ((selectedIndex == 0)
                                    ? '_color.png'
                                    : '_nocolor.png'),
                          ),
                          fit: BoxFit.contain)),
                ),
                Container(
                  width: 50,
                  child: Text(
                    'Home',
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
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(

                          'assets/ic_comparison' +
                              ((selectedIndex == 1)
                                  ? '_color.png'
                                  : '_nocolor.png'),
                        ),
                        fit: BoxFit.contain),
                  ),
                ),
                Container(
                  width: 65,
                  child: Text(
                    'Comparison',
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
        ],
      ),
    );
  }
}
