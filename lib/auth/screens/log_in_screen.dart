import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:tezda_app/auth/screens/sign_up_screen.dart';
import 'package:tezda_app/controller/auth_controller.dart';
import 'package:tezda_app/controller/login.dart';
import 'package:tezda_app/utils/app_filled_button.dart';
import 'package:tezda_app/utils/app_text_button.dart';
import 'package:tezda_app/utils/app_text_field.dart';
import 'package:tezda_app/utils/strings.dart';
import 'package:tezda_app/utils/theme.dart';
import 'package:tezda_app/utils/validator.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => LoginScreen(),
    );
  }

  LoginScreen({Key? key}) : super(key: key);

  static final _formKey = GlobalKey<FormState>();
  static final _forgetPasswordKey = GlobalKey<FormState>();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    AuthController.instance.checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SizedBox(
      height: h,
      width: w,
      child: GetBuilder<LoginController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(24, 50, 24, 0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: LoginScreen._formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome!',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: appColors.textColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 13,
                  ),

                  //
                  Text(
                    'Securely login to your pixel account',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: appColors.grey,
                    ),
                  ),

                  const SizedBox(
                    height: 42,
                  ),

                  // Form field

                  ListView(
                    shrinkWrap: true,
                    children: [
                      const AppTextField(
                          title: 'Email address',
                          labelText: 'Email address',
                          textInputAction: TextInputAction.next,
                          // controller: provider.emailController,
                          validator: Validator.nonEmptyField),
                      const SizedBox(height: 24),
                      const AppTextField(
                        title: 'Password',
                        labelText: 'Password',
                        isPassword: true,
                        textInputAction: TextInputAction.done,
                        // controller: provider.passwordController,
                        validator: Validator.password,
                      ),

                      const SizedBox(height: 56),

                      // Proceed button
                      AppFilledButton(
                        buttonText: kProceed,
                        onPressed: () async {
                          if (LoginScreen._formKey.currentState!.validate()) {
                            controller.login(
                                password: _passwordController.text.trim(),
                                email: _emailController.text.trim());
                          }
                        },
                      ),

                      const SizedBox(height: 30),

                      // Sign up button

                      Center(
                        child: AppRichTextButton(
                          highLightedText: kRegister,
                          text: kDontHaveAcct,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    ));
  }
}
