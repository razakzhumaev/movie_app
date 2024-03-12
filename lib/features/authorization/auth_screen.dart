// import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:star_wars_app/internal/components/widgets.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({
    super.key,
  });

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isHiddenPassword = true;
  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: DefaultTabController(
        length: 2,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/space.jpg',
              height: 1.sh,
              width: 2.sw,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 28.w,
                left: 28.w,
                top: 80.h,
              ),
              child: const Column(
                children: [
                  Text(
                    'Star Wars',
                    style: TextStyle(
                      fontFamily: 'Notable',
                      fontSize: 44,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Cinema',
                    style: TextStyle(
                      fontFamily: 'Notable',
                      fontSize: 44,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 80),
                  TabBar(
                    indicatorWeight: 5,
                    indicatorColor: Colors.black,
                    labelColor: Colors.black,
                    tabs: [
                      Tab(text: 'SIGN IN'),
                      Tab(text: 'SIGN UP'),
                    ],
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: TabBarView(
                      children: [
                        SignIn(),
                        SignUp(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
