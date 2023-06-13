import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholl/pages/ui/main_page.dart';
import 'package:scholl/pages/ui/register_page.dart';
import 'package:scholl/pages/widgets/custom_button.dart';
import 'package:scholl/pages/widgets/form_widgets.dart';
import 'package:scholl/pages/widgets/snackbar_box.dart';
import 'package:scholl/theme/theme.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isVisible = false;

  formFalidation() {
    if (emailController.text.isEmpty && emailController.text.isEmpty) {
      return snackbarBox(
        'Masukkan email atau password terlebih dahulu',
      );
    } else if (!EmailValidator.validate(emailController.text)) {
      return snackbarBox(
        'Format email tidak sesuai',
      );
    } else {
      Get.offAll(const MainPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Text(
        'Login',
        style: blackTextStyle.copyWith(
          fontSize: 22,
          fontWeight: semiBold,
        ),
      );
    }

    Widget image() {
      return Center(
        child: Image.asset(
          'images/register.png',
        ),
      );
    }

    Widget formemail() {
      return FormWidget(
        title: 'Email',
        textEditingController: emailController,
        hintText: 'Masukkan email...',
      );
    }

    Widget password() {
      return FormWidget(
        title: 'Password',
        textEditingController: passwordController,
        hintText: 'Masukkan password...',
        obscureText: !_isVisible,
        widget: IconButton(
          onPressed: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
          icon: !_isVisible
              ? const Icon(
                  Icons.visibility_off,
                  color: Colors.grey,
                )
              : Icon(
                  Icons.visibility,
                  color: blueColor,
                ),
        ),
      );
    }

    Widget buttonLogin() {
      return SizedBox(
        width: double.infinity,
        height: 45,
        child: CustomButton(
          title: 'Login',
          onTap: () {
            formFalidation();
          },
        ),
      );
    }

    Widget creatAccount() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Belum punya akun?',
            style: greyTextStyle.copyWith(),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return RegisterPage();
                  },
                ),
              );
            },
            child: Text(
              ' Daftar Sekarang',
              style: textStyle.copyWith(
                color: const Color(0xFFA9BAE6),
                fontWeight: semiBold,
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(defaultMargin),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 31,
              ),
              title(),
              const SizedBox(
                height: 24,
              ),
              image(),
              const SizedBox(
                height: 20,
              ),
              formemail(),
              const SizedBox(
                height: 14,
              ),
              password(),
              const SizedBox(
                height: 30,
              ),
              buttonLogin(),
              const SizedBox(
                height: 10,
              ),
              creatAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
