import 'package:driver_app/features/authentication/bloc/validation/validator_form_bloc.dart';
import 'package:driver_app/shared/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/colors/app_colors.dart';
import '../../../../shared/widgets/snack_bar_top.dart';
import '../../../../shared/widgets/text_field_widget.dart';
import '../../status_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static const routePath = '/login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    BlocProvider.of<ValidatorFormBloc>(context).add(
      ValidatorEventFetch(
        phoneNumber: _phoneController.text,
        password: _passwordController.text,
        otp: '',
        confirmPassword: '',
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
  }

  bool isPasswordVisible = true;

  bool get isKeyboardOpen => MediaQuery.of(context).viewInsets.bottom > 0;

  void closeKeyboard() {
    if (isKeyboardOpen) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: closeKeyboard,
      child: Scaffold(
        backgroundColor: AppColors.kBackground,
        body: BlocListener<ValidatorFormBloc, ValidatorFormState>(
          listener: (context, state) {
            if (state is ValidatorFormSuccess) {
              // Implement your logic here
            } else if (state is ValidatorFormFailure) {
              SnackBarTop.topDeleteError(context, 'Phone number is required');
            }
          },
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: MediaQuery.of(context).size.height * 0.1,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      height: 200,
                      child: Image.asset(
                        'assets/images/login.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      'Login with phone number',
                      style: TextStyle(
                        color: AppColors.kColorBlack,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFieldForms(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      hintText: 'Phone number',
                    ),
                    const SizedBox(height: 20),
                    TextFieldForms(
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: 'Password',
                      obscureText: isPasswordVisible,
                      suffixIcon: isPasswordVisible
                          ? PhosphorIcons.eye_slash
                          : PhosphorIcons.eye,
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                    const SizedBox(height: 40),
                    ButtonAction(
                      text: 'Login',
                      onPressed: () {
                        //check if the form is valid
                        if (_formKey.currentState!.validate()) {
                          if (_phoneController.text.trim().isEmpty) {
                            SnackBarTop.topDeleteError(
                                context, 'Phone number is required');
                          } else if (_phoneController.text.trim().length < 9) {
                            SnackBarTop.topDeleteError(context,
                                'Phone number must be at least 9 digits');
                          } else if (_passwordController.text.trim().isEmpty) {
                            SnackBarTop.topDeleteError(
                                context, 'Password is required');
                          } else if (_passwordController.text.trim().length <=
                              5) {
                            SnackBarTop.topDeleteError(context,
                                'Password must be at least 6 characters');
                          } else {
                            context.go(StatusView.routePath);
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
