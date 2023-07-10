part of 'pages.dart';

bool isLogin = false;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }



  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  // init var email pass
  String email = '';
  String password = '';
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future signIn() async {

      await Auth().signIn(email: email, password: password).then((value) {
        setState(() {
          isLogin = true;
        });
      });

  }

  Widget headerImage() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 5,
      width: double.infinity,
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height / 5,
          width: MediaQuery.of(context).size.width / 3,
          decoration: const BoxDecoration(
            image: DecorationImage(
              scale: 3,
              image: AssetImage('assets/logo.png'),
            ),
          ),
        ),
      ),
    );
  }

  Widget headerTitle() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 9,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi there',
            style: blueTextStyleInter.copyWith(
              fontSize: 24,
              fontWeight: bold,
            ),
          ),
          Text(
            'Please login to continue.',
            style: greyTextStyleInter.copyWith(fontWeight: light),
          ),
        ],
      ),
    );
  }

  Widget content() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 2.7,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xffF0F9FF),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: defaultMargin,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Email',
                style: blueTextStyleInter.copyWith(
                  fontWeight: light,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2.5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2.5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Type your email here. ',
                  hintStyle: greyTextStyleInter.copyWith(
                    fontSize: 12,
                    fontWeight: light,
                  ),
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some email';
                  }
                  return null;
                },
                // controller: emailController,
                onSaved: (value) {
                  setState(() {
                    email = value!;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Password',
                style: blueTextStyleInter.copyWith(
                  fontWeight: light,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  suffix: InkWell(
                    onTap: _toggle,
                    child: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      size: 15.0,
                      color: kThirdColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2.5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2.5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Type your password here.',
                  hintStyle: greyTextStyleInter.copyWith(
                    fontSize: 12,
                    fontWeight: light,
                  ),
                ),
                // controller: passwordController,
                // The validator receives the text that the password has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some password';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    password = value!;
                  });
                },
              ),
              const SizedBox(
                height: 25,
              ),
              // Align(
              //   alignment: Alignment.bottomRight,
              //   child: Text(
              //     'Forgot password ?',
              //     style: blueTextStyleInter.copyWith(
              //       fontWeight: light,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget footer() {
    final ButtonStyle style = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
    return Container(
      height: MediaQuery.of(context).size.height / 15,
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: 60,
      ),
      child: ElevatedButton(
        style: style,
        onPressed: () {
          if(_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            signIn().whenComplete(() {
              if(isLogin == true) {
                Flushbar(

                  duration: const Duration(milliseconds: 1500),
                  flushbarPosition: FlushbarPosition.TOP,
                  backgroundColor: Colors.green,
                  titleText: Text(
                    'Login success!',
                    style: whiteTextStyleInter.copyWith(fontWeight: bold),
                  ),

                  messageText: Text(
                    'User: $email',
                    style: whiteTextStyleInter,
                  ),
                ).show(context);
              }
              else {
                Flushbar(
                  duration: const Duration(milliseconds: 1500),
                  flushbarPosition: FlushbarPosition.TOP,
                  backgroundColor: Colors.red,
                  titleText: Text(
                    'Login failed',
                    style: whiteTextStyleInter.copyWith(fontWeight: bold),
                  ),
                  messageText: Text(
                    '',
                    style: whiteTextStyleInter,
                  ),
                ).show(context);
              }
            });
          }





        },
        child: Text(
          'Submit',
          style: whiteTextStyleInter,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return const MainPage();
          }
          else {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: defaultMargin,
                    right: defaultMargin,
                  ),
                  child: Column(
                    children: [
                      headerImage(),
                      headerTitle(),
                      content(),
                      footer(),
                    ],
                  ),
                ),
              ),
            );
          }

        }
      ),
    );
  }
}
