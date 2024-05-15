import 'dart:developer';

import 'package:daalt/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:daalt/auth/auth_service.dart';

class SigIn extends StatefulWidget {
  const SigIn({super.key});

  @override
  State<SigIn> createState() => _SigInState();
}

class _SigInState extends State<SigIn> {
  final _auth = AuthService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              bottom: 500,
              left: 80,
              right: 80,
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Э-мэйл'),
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'Э-мэйлээ оруулна уу!';
                  }
                  final regex = RegExp('[^@]+@[^\.]+\..+');
                  if (!regex.hasMatch(text)) {
                    return 'Э-мэйлээ зөв эсэхийг шалгана уу?';
                  }
                  return null;
                },
              ),
            ),
            Positioned(
              bottom: 420,
              left: 80,
              right: 80,
              child: TextFormField(
                obscureText: true,
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(labelText: 'Нууц үг'),
                validator: (text) =>
                    text!.isEmpty ? 'Нууц үгээ оруулна уу!' : null,
              ),
            ),
            Positioned(
              bottom: 80,
              left: 80,
              right: 80,
              child: ElevatedButton(
                onPressed: _signup,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 113, 191, 211),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                child: const Text('Бүртгүүлэх'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _signup() async {
    final user = await _auth.createUserWithEmailAndPassword(
        _emailController.text, _passwordController.text);
    if (user != null) {
      log('Amjilttai bvrtgvvlle');
      Navigator.pop(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }
}
