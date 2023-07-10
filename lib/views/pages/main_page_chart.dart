part of 'pages.dart';

class MainPageChart extends StatefulWidget {
  final int initialPage;
  const MainPageChart({
    super.key,
    this.initialPage = 0,
  });

  @override
  State<MainPageChart> createState() => _MainPageChartState();
}

class _MainPageChartState extends State<MainPageChart> {
  int _selectedPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _selectedPage = widget.initialPage;
    _pageController = PageController(initialPage: widget.initialPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: kFourthColor,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 12,
                bottom: 12,
                right: 20,
                top: 30,
              ),
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _selectedPage = index;
                  });
                },
                children: const [
                  Center(
                    child: EnergyChart(),
                  ),
                  Center(
                    child: VoltageChart(),
                  ),
                  Center(
                    child: CurrentChart(),
                  ),
                  Center(
                    child: PowerChart(),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: CustomChartBottomNavigation(
                selectedIndex: _selectedPage,
                onTap: (index) {
                  setState(() {
                    _selectedPage = index;
                  });
                  _pageController.jumpToPage(_selectedPage);
                },
              ),
            ),



          ],
        ),
      ),
    );
  }
}
