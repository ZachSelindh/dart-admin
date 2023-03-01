import 'dart:io';

import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final void Function(
    String email,
    String password,
    String username,
    bool isLogin,
    BuildContext ctx,
  ) sumbitFn;
  final bool isLoading;

  const AuthForm(this.sumbitFn, this.isLoading, {super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  File? _userImageFile;

  void _trySubmit(ctx) {
    final isValid = _formKey.currentState?.validate();
    FocusScope.of(context).unfocus();

    if (_userImageFile == null) {
      if (!_isLogin) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).colorScheme.error,
            content: const Text('Please add a profile image'),
          ),
        );
        return;
      }
    }

    if (isValid == true) {
      _formKey.currentState?.save();
      widget.sumbitFn(
        _userEmail.trim(),
        _userPassword.trim(),
        _userName.trim(),
        _isLogin,
        ctx,
      );
    }
  }

  void pickedImage(File image) {
    _userImageFile = image;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    key: const ValueKey('email'),
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                    ),
                    validator: (value) {
                      if (value == null) return 'Please enter an email';
                      if (value.isEmpty || !value.contains('@')) return 'Please enter a valid email';
                      return null;
                    },
                    onSaved: (value) {
                      if (value == null) return;
                      _userEmail = value;
                    },
                  ),
                  if (!_isLogin)
                    TextFormField(
                      key: const ValueKey('username'),
                      decoration: const InputDecoration(
                        labelText: 'Username',
                      ),
                      validator: (value) {
                        if (value == null) return 'Please enter a username';
                        if (value.isEmpty || value.length < 4) return 'Please enter at least 4 characters';
                        return null;
                      },
                      onSaved: (value) {
                        if (value == null) return;
                        _userName = value;
                      },
                    ),
                  TextFormField(
                    key: const ValueKey('password'),
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null) return 'Please enter a password';
                      if (value.isEmpty || value.length < 7) return 'Password must be at least 7 characters long';
                      return null;
                    },
                    onSaved: (value) {
                      if (value == null) return;
                      _userPassword = value;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  if (widget.isLoading) const CircularProgressIndicator(),
                  if (!widget.isLoading)
                    ElevatedButton(
                      onPressed: () => _trySubmit(context),
                      child: Text(_isLogin ? 'Login' : "Sign Up"),
                    ),
                  if (!widget.isLoading)
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                      child: Text(_isLogin ? "Create Account" : "I already have an account"),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
