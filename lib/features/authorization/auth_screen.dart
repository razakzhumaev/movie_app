import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:star_wars_app/internal/components/text_helper.dart';
import 'package:star_wars_app/internal/components/widgets.dart';

@RoutePage()
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
            Image.network(
              'https://i.pinimg.com/564x/d6/e8/af/d6e8af2ec7cd0434dd1b636563991223.jpg',
              height: 1.sh,
              width: 1.sw,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 28.w,
                left: 28.w,
                top: 80.h,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Text(
                    'Razakflix',
                    style: TextHelper.w700s44Notable,
                  ),
                  SizedBox(height: 100.h),
                  const TabBar(
                    indicatorWeight: 5,
                    indicatorColor: Colors.red,
                    labelColor: Colors.red,
                    tabs: [
                      Tab(text: 'SIGN IN'),
                      Tab(text: 'SIGN UP'),
                    ],
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                  SizedBox(height: 10.h),
                  const Expanded(
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
