import 'package:flutter/material.dart';

import '../../core/resources/app_button_styles.dart';

import '../../core/resources/app_text_styles.dart';
import '../../core/services/auth_service.dart';
import 'widgets/login_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final result = await _authService.login(
        _emailController.text,
        _passwordController.text,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login Successful! Token: ${result['token']}'),
            backgroundColor: Colors.green,
          ),
        );
        // Navigate to next screen if needed
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString().replaceAll('Exception: ', '')),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Welcome Back 👋',
                style: AppTextStyles.darkGreyColor28OpenSansBold,
              ),
              const SizedBox(height: 8),
              Text(
                'Sign in to continue exploring your library.',
                style: AppTextStyles.greyColor16Regular,
              ),
              const SizedBox(height: 32),
              LoginTextField(
                label: 'Email Address',
                hintText: 'name@example.com',
                controller: _emailController,
              ),
              const SizedBox(height: 16),
              LoginTextField(
                label: 'Password',
                hintText: '••••••••',
                obscureText: true,
                controller: _passwordController,
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: AppTextStyles.primaryColor14RobotoMedium,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _isLoading ? null : _login,
                style: AppButtonStyles.primaryButtonStyle,
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Text(
                        'Login',
                        style: AppTextStyles.whiteColor16OpenSansBold,
                      ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: AppTextStyles.greyColor16Regular,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Create one',
                      style: AppTextStyles.primaryColor14RobotoMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
