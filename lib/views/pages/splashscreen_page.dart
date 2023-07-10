part of 'pages.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {

    return EasySplashScreen(
      logo: const Image(image: AssetImage('assets/logo.png')),
      title: Text(
        'Energy Meter',
          style: whiteTextStyleInter.copyWith(
          fontSize: 24,
          fontWeight: bold,
          ),
      ),
      // backgroundColor:  const Color(0xff141519),
      showLoader: true,
      loadingText: const Text(
        "Loading...",
        style: TextStyle(
          color: Color(0xff141519),
        ),
      ),

      loaderColor: const Color(0xff141519),
      durationInSeconds: 5,
      navigator: const LoginPage(),
    );


    //   Scaffold(
    //   backgroundColor: const Color(0xff141519),
    //   body: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Container(
    //         width: MediaQuery.of(context).size.width / 2,
    //         height: MediaQuery.of(context).size.height / 4,
    //         decoration: const BoxDecoration(
    //           image: DecorationImage(
    //             image: AssetImage('assets/logo.png'),
    //
    //             fit: BoxFit.cover,
    //           ),
    //         ),
    //       ),
    //       SizedBox(
    //         height: 12,
    //       ),
    //       Center(
    //         child: Text(
    //           'Energy Meter',
    //           style: whiteTextStyleInter.copyWith(
    //             fontSize: 24,
    //             fontWeight: bold,
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
