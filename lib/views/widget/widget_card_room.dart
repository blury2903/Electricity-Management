part of 'widget.dart';



class CustomCardRoom extends StatelessWidget {
  final String lImage;
  final String tRoom;
  final String sEnergy;
  final String cVoltage;
  final String cCurrent;
  final String cPower;
  final String cFrequency;
  final String cPowerFactor;
  final TextAlarmColor textCardColor;
  const CustomCardRoom({
    super.key,
    required this.textCardColor,
    required this.lImage,
    required this.tRoom,
    required this.sEnergy,
    required this.cVoltage,
    required this.cCurrent,
    required this.cPower,
    required this.cFrequency,
    required this.cPowerFactor,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 1,
            offset: Offset(4, 8), // Shadow position
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5.5,
              margin: const EdgeInsets.only(bottom: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: AssetImage(lImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                // top: 5,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Monitored',
                            style: greyTextStyleInter.copyWith(
                              fontWeight: bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Location',
                            style: greyTextStyleInter.copyWith(
                              fontWeight: light,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        child: const Icon(Icons.arrow_forward_ios),
                        onPressed: (){

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                            (tRoom == 'NODE 01'
                                ?  DetailPageNode1()
                                :  DetailPageNode2()
                            )
                            ),

                          );
                        },
                      )
                    ],
                  ),
                  // const SizedBox(
                  //   width: 240,
                  // ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 4),
              child: Text(
                tRoom,
                style: blackTextStyleInter.copyWith(
                  fontSize: 18,
                  fontWeight: regular,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 2,
                width: double.infinity,
                color: kSecondaryColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                top: 2,
              ),
              child: Text(
                'Energy',
                style: greyTextStyleInter.copyWith(
                  fontWeight: light,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    sEnergy,
                    style: blackTextStyleInter.copyWith(
                        fontWeight: bold,
                        fontSize: 20,
                        color: textCardColor.colorEnergy,
                    ),
                  ),
                  // SizedBox(
                  //   width: 5,
                  // ),
                  // Text(
                  //   'Wh',
                  //   style: blackTextStyleInter.copyWith(
                  //     fontWeight: regular,
                  //   ),
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Voltage',
                        style: greyTextStyleInter.copyWith(
                          fontWeight: light,
                        ),
                      ),
                      Text(
                        cVoltage,
                        style: blackTextStyleInter.copyWith(
                          fontWeight: bold,
                          color: textCardColor.colorVoltage,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.orange.shade200),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Current',
                          style: greyTextStyleInter.copyWith(
                            fontWeight: light,
                          ),
                        ),
                        Text(
                          cCurrent,
                          style: blackTextStyleInter.copyWith(
                            fontWeight: bold,
                            color: textCardColor.colorCurrent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Power',
                        style: greyTextStyleInter.copyWith(
                          fontWeight: light,
                        ),
                      ),
                      Text(
                        cPower,
                        style: blackTextStyleInter.copyWith(
                          fontWeight: bold,
                          color: textCardColor.colorPower,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
