import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:star_wars_app/internal/components/routes/auto_route.gr.dart';
import 'package:star_wars_app/internal/helpers/snack_bar.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isHiddenPassword = true;
  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  Future<void> login() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextInputController.text.trim(),
        password: passwordTextInputController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);

      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        SnackBarService.showSnackBar(
          context,
          'Неправильный email или пароль. Повторите попытку',
          true,
        );
        return;
      } else {
        SnackBarService.showSnackBar(
          context,
          'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку.',
          true,
        );
        return;
      }
    }
    AutoRouter.of(context).replace(const MovieRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Войти',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 34.sp,
              color: const Color.fromARGB(255, 170, 13, 2),
            ),
          ),
          SizedBox(height: 30.h),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            controller: emailTextInputController,
            validator: (email) =>
                email != null && !EmailValidator.validate(email)
                    ? 'Введите правильный Email'
                    : null,
            style: const TextStyle(
              decorationColor: Colors.green,
            ),
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.person_2_outlined,
                color: Colors.grey,
              ),
              hintText: 'Email',
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w300,
              ),
              filled: true,
              fillColor: Colors.grey[200],
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(12.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          TextFormField(
            autocorrect: false,
            controller: passwordTextInputController,
            obscureText: isHiddenPassword,
            validator: (value) =>
                value != null && value.length < 6 ? 'Минимум 6 символов' : null,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              suffix: InkWell(
                onTap: togglePasswordView,
                child: Icon(
                  isHiddenPassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.black,
                ),
              ),
              hintText: 'Пароль',
              hintStyle: const TextStyle(fontWeight: FontWeight.w300),
              filled: true,
              fillColor: Colors.grey[200],
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(12.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Forgot the password?',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 60.h),
          SizedBox(
            height: 48.h,
            width: 319.w,
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor: const MaterialStatePropertyAll(Colors.white),
                backgroundColor: const MaterialStatePropertyAll(Colors.blue),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
              onPressed: login,
              child: const Text('Войти'),
            ),
          ),
        ],
      ),
    );
  }
}

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isHiddenPassword = true;
  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();
  TextEditingController passwordTextRepeatInputController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailTextInputController.dispose();
    passwordTextInputController.dispose();
    passwordTextRepeatInputController.dispose();
    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  Future<void> signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    if (passwordTextInputController.text !=
        passwordTextRepeatInputController.text) {
      SnackBarService.showSnackBar(
        context,
        'Пароли должны совпадать',
        true,
      );
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailTextInputController.text.trim(),
        password: passwordTextInputController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
      if (e.code == 'email-already-in-use') {
        SnackBarService.showSnackBar(
          context,
          'Такой Email уже используется , повторите попытку с использованием другого Email',
          true,
        );
        return;
      } else {
        SnackBarService.showSnackBar(
          context,
          'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку',
          true,
        );
        return;
      }
    }
    AutoRouter.of(context).replace(VerifyEmailRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Создать аккаунт',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 34,
              color: Color.fromARGB(255, 170, 13, 2),
            ),
          ),
          SizedBox(height: 30.h),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            controller: emailTextInputController,
            validator: (email) =>
                email != null && !EmailValidator.validate(email)
                    ? 'Введите правильный Email'
                    : null,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(12.r),
              ),
              filled: true,
              fillColor: Colors.grey[200],
              border: const OutlineInputBorder(),
              hintText: 'Введите Email',
            ),
          ),
          SizedBox(height: 20.h),
          TextFormField(
            autocorrect: false,
            controller: passwordTextInputController,
            obscureText: isHiddenPassword,
            validator: (value) =>
                value != null && value.length < 6 ? 'Минимум 6 символов' : null,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              suffix: InkWell(
                onTap: togglePasswordView,
                child: Icon(
                  isHiddenPassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.black,
                ),
              ),
              hintText: 'Пароль',
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w300,
              ),
              filled: true,
              fillColor: Colors.grey[200],
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(12.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          TextFormField(
            autocorrect: false,
            controller: passwordTextRepeatInputController,
            obscureText: isHiddenPassword,
            validator: (value) =>
                value != null && value.length < 6 ? 'Минимум 6 символов' : null,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              suffix: InkWell(
                onTap: togglePasswordView,
                child: Icon(
                  isHiddenPassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.black,
                ),
              ),
              hintText: 'Пароль',
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w300,
              ),
              filled: true,
              fillColor: Colors.grey[200],
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          SizedBox(height: 60.h),
          SizedBox(
            height: 48.h,
            width: 319.w,
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor: const MaterialStatePropertyAll(
                  Colors.white,
                ),
                backgroundColor: const MaterialStatePropertyAll(
                  Colors.blue,
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
              onPressed: signUp,
              child: const Text('Создать'),
            ),
          ),
        ],
      ),
    );
  }
}
