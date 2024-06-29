

import 'package:flutter/material.dart';
import 'package:hackathon_easyghar/core/constants/constants.dart';
import 'package:hackathon_easyghar/core/widgets/forms/cust_text_field.dart';
import 'package:hackathon_easyghar/core/widgets/forms/field_validators.dart';
import 'package:hackathon_easyghar/core/widgets/text/custom_text.dart';

import '../../../core/constants/app_assets.dart';

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
        final lastname= nameParts.length>1 ? nameParts.sublist(1).join (' '): '';
         setState(() {
           _registerFuture=userService.registerUser(
             firstname: firstname,
             lastname: lastname,
             email: usernameController.text,
             password: passwordController.text,
           );
         });
      }
  }
@override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Register Page"),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 14.0),
        child: ListView(
          children: [
            Image.asset(AppAssets.appLogoImg,height:  MediaQuery.of(context).size.height *0.15,
            ),
            Center(
              child: CText(
                'Create your EasyGhar Account',
                type: TextType.headlineLarge,
                color: AppColors.darkBlue,
              ),
            ),
            AppSpacing.verticalSpaceMedium,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CText('Join us to find your renrtal home',
                type:  TextType.bodyMedium,
                color: AppColors.primaryText,
                fontWeight: FontWeight.w500,),
              ],
            ),
            AppSpacing.verticalSpaceLarge,
            AppSpacing.verticalSpaceMedium,
            Form(
                key:_formKey,
                child: Column(
                  children: [
                    CustTextField(labelText: 'Full Name',
                    hintText:  'Full Name',
                      prefixIcon: Icon(Icons.person, color: AppColors.darkBlue),
                      controller: fullNameController,
                      validator: (value)=> FieldValidators.validateFullName(value),,
                    ),
                    AppSpacing.verticalSpaceLarge,
                    CustTextField(labelText: 'Email',
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email,color:AppColors.darkBlue),
                    controller: usernameController,
                    validator: (value)=> FieldValidators.validateEmail(value),),
                  ],
                ))
          ],
        ),
      ),
    )
}
}