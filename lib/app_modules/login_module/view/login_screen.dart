import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vax_care_healthcare_provider/app_constants/app_colors.dart';
import 'package:vax_care_healthcare_provider/app_modules/home_page_module/view/home_screen.dart';
import 'package:vax_care_healthcare_provider/app_modules/login_module/bloc/login_bloc.dart';
import 'package:vax_care_healthcare_provider/app_modules/login_module/widget/password_text_field.dart';
import 'package:vax_care_healthcare_provider/app_utils/app_helpers.dart';
import 'package:vax_care_healthcare_provider/app_utils/app_localstorage.dart';
import 'package:vax_care_healthcare_provider/app_widgets/form_logo.dart';
import 'package:vax_care_healthcare_provider/app_widgets/normal_text_field.dart';
import 'package:vax_care_healthcare_provider/app_widgets/overlay_loader_widget.dart';
import 'package:vax_care_healthcare_provider/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      final loginBloc = BlocProvider.of<LoginBloc>(context);

      loginBloc.add(
        LoginEvent.loggedIn(
          _emailController.text.trim(),
          _passwordController.text.trim(),
        ),
      );
    } else {
      AppHelpers.showErrorDialogue(
        context,
        "Please add email and password",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: () {},
            success: (response) async {
              if (response.status == "success") {
                await AppLocalstorage.hospitalLogin(
                  hospitalName: response.name,
                  hospitalId: response.user,
                );

                SchedulerBinding.instance.addPostFrameCallback((_) {
                  MyApp.navigatorKey.currentState?.pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );

                  AppHelpers.showCustomSnackBar(
                    context,
                    "Loggedin successfully",
                  );
                });
              } else {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  AppHelpers.showErrorDialogue(
                    context,
                    "Login Failed",
                  );
                });
              }
            },
            failure: (errorMessage) => AppHelpers.showErrorDialogue(
              context,
              "Login Failed: $errorMessage",
            ),
          );
        },
        builder: (context, state) {
          bool isLoading = state.maybeWhen(
            loading: () => true,
            orElse: () => false,
          );
          return OverlayLoaderWidget(
            isLoading: isLoading,
            childWidget: Form(
              key: _formKey,
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.05,
                    vertical: screenSize.height * 0.05,
                  ),
                  constraints:
                      BoxConstraints(maxWidth: screenSize.width * 0.85),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FormLogo(),
                        _gap(),
                        NormalTextField(
                          textEditingController: _emailController,
                          validatorFunction: (value) {
                            // add email validation
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }

                            bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value);
                            if (!emailValid) {
                              return 'Please enter a valid email';
                            }

                            return null;
                          },
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          textFieldIcon: Icon(Icons.email_outlined),
                          textInputType: TextInputType.emailAddress,
                        ),
                        _gap(),
                        PasswordTextField(
                          passwordController: _passwordController,
                        ),
                        _gap(),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              backgroundColor: AppColors.firstColor,
                            ),
                            onPressed: _login,
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _gap() {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(height: screenSize.height * 0.025);
  }
}
