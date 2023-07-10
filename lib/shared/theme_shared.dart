part of 'shared.dart';

const double defaultMargin = 18.0;
const double defaultRadius = 18.0;

const Color kPrimaryColor = Color(0xff141519);
const Color kSecondaryColor = Color(0xff3498DB);
const Color kThirdColor = Color(0xff9FA1A3);
const Color kFourthColor = Color(0xffFFFFFF);

TextStyle blackTextStyleInter = GoogleFonts.poppins(
  color: kPrimaryColor,
);
TextStyle blueTextStyleInter = GoogleFonts.poppins(
  color: kSecondaryColor,
);
TextStyle greyTextStyleInter = GoogleFonts.poppins(
  color: kThirdColor,
);
TextStyle whiteTextStyleInter = GoogleFonts.poppins(
  color: kFourthColor,
);

const FontWeight light = FontWeight.w300;
const FontWeight regular = FontWeight.w400;
const FontWeight medium = FontWeight.w500;
const FontWeight semiBold = FontWeight.w600;
const FontWeight bold = FontWeight.w700;
const FontWeight extraBold = FontWeight.w800;
const FontWeight black = FontWeight.w900;

class MyUtility {
  BuildContext context;

  MyUtility(this.context);

  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
}
