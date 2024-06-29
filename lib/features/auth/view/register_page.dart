

import 'package:flutter/material.dart';
import 'package:hackathon_easyghar/core/constants/constants.dart';
import 'package:hackathon_easyghar/core/widgets/forms/cust_text_field.dart';
import 'package:hackathon_easyghar/core/widgets/forms/field_validators.dart';
import 'package:hackathon_easyghar/core/widgets/text/custom_text.dart';
import 'package:hackathon_easyghar/features/auth/view/login_page.dart';

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
                    validator: (value)=> FieldValidators.validateEmail(value),
                    ),
                    AppSpacing.verticalSpaceLarge,
                    CustTextField(
                        labelText:'Password',
                        hintText: 'Password',
                        controller: passwordController,
                      prefixIcon: Icon(Icons.lock, color: AppColors.darkBlue),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                          color: AppColors.darkBlue,
                        ),
                        onPressed: _togglePasswordVisibility,
                      ),
                      obscureText: _obscureText,
                      validator: (value)=>
                      FieldValidators.validatePassword(value),
                    ),
                    AppSpacing.verticalSpaceLarge,
                    CustTextField(
                      labelText:'Confirm Password',
                      hintText: 'Confirm Password',
                      controller: passwordController,
                      prefixIcon: Icon(Icons.lock, color: AppColors.darkBlue),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                          color: AppColors.darkBlue,
                        ),
                        onPressed: _togglePasswordVisibility,
                      ),
                      obscureText: _obscureText,
                      validator: (value){
                        if (value!=passwordController.text)
                          {
                            return 'Passwords do not match';
                          }
                        return null;
                      },
                    ),
                    AppSpacing.verticalSpaceLarge,
                    ElevatedButton(onPressed: (){
                      if(_formKey.currentState!.validate()){
                        AppMethods.showLoaderDialog(context);
                        _registerUser();
                      }
                    },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.darkBlue,
                        padding: EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 80.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                        ),
                    AppSpacing.vericalSpaceLarge,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CText('Already have account?',
                        type: TextType.bodyMedium,
                        color: AppColors.secondaryText,),
                        TextButton(onPressed: (){Navigator.pop(context);},
                            child: CText('Login',
                            type: TextType.bodyMedium,
                            color: AppColors.teal,
                            fontWeight: FontWeight.bold,
                            ),
                        ),
                      ],

                    ),
                  ],
                ),
            ),
            if(_registerFuture !=null)
  FutureBuilder<Response>(
  future: _registerFuture,
  builder: (context, snapshot) {
  if (snapshot.connectionState == ConnectionState.waiting) {
  return Container();
  } else if (snapshot.hasError) {
  Navigator.pop(context); // Hide the loader
  AppMethods.displayToastFailure(
  message: 'Registration failed: ${snapshot.error}');
  return Text('Error: ${snapshot.error}');
  } else if (snapshot.hasData) {
  final response = snapshot.data!;

  Navigator.pop(context);
  if (response.statusCode == 200
  || response.statusCode == 201)
  {
  AppMethods.displayToastSuccess(
  message: 'Registration successful');
  WidgetsBinding.instance.addPostFrameCallback((_){
  Navigator.push(context,
  MaterialPageRoute(builder: (builder) => LoginScreen()));
  });
  else{
  AppMethods.displayToastFailure(
  message: 'Registration failed, please try again');
  }
  }
  return Container();
  },
      ),
    }

          ],
        ),
      ),
    );
}
}