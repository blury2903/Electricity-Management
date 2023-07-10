part of 'pages.dart';

class CriticalPage extends StatefulWidget {
  const CriticalPage({super.key});

  @override
  State<CriticalPage> createState() => _CriticalPageState();
}

class _CriticalPageState extends State<CriticalPage> {
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
        leading: Container(
          height: 55,
          width: 55,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/ic_primary.png'),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: kFourthColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: kFourthColor,
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: ListTile(
                contentPadding: const EdgeInsets.all(10.0),
                leading: Container(
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 10,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/ic_voltage.png',
                      ),
                    ),
                  ),
                ),
                title: Text(
                  'Operation Room 02',
                  style: blackTextStyleInter,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'tm01',
                      style: blackTextStyleInter.copyWith(
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      '09.20 03 November 2020',
                      style: greyTextStyleInter.copyWith(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                trailing: Text(
                  '18 (%)',
                  style: blackTextStyleInter.copyWith(
                    color: const Color(
                      0xffE74C3C,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
