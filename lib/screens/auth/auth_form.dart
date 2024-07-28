import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final Future<void> Function(String email, String password, String name, bool isLogin) onSubmit;

  AuthForm({required this.onSubmit});

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  var _isLogin = true;

  void _submit() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final name = _nameController.text;
    await widget.onSubmit(email, password, name, _isLogin);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          if (!_isLogin)
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text(_isLogin ? 'Login' : 'Sign Up'),
            onPressed: _submit,
          ),
          TextButton(
            child: Text(_isLogin ? 'Create an Account' : 'I already have an account'),
            onPressed: () {
              setState(() {
                _isLogin = !_isLogin;
              });
            },
          ),
        ],
      ),
    );
  }
}
