

import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget{
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage>{
  final _formKey =GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
   bool _obscureText = true;
   Future<Response>? _registerFuture;
  final AuthService userService = AuthService(HttpServiceImpl());
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  void _registerUser()
  {
    if(_formKey.currentState!.validate())
      {
        final nameParts = fullNameController.text.split(' ');
        final firstname=nameParts.first;
        final lastname= nameParts.length>1 ? nameParts.sublist(1).join
      }
  }

}