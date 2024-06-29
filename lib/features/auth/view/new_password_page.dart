class NewPasswordPage extends StatefulWidget {
  @override
  Statee<NewPasswordPage> createStae() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
final_formKey = GlobalKey<FormState> ();
final TextEditingController oldPasswordController = TextEditingController();
final TextEditingController newPasswordController = TextEditingController();
final TextEditingController confirmPasswordController = TextEditingController();

bool_obscureText = true;
Future<SendEmailModel>? _resetPasswordFuture;
final AuthService userService = AuthService(HttpServiceImpl());

void_togglePasswordVisibility(){
  setState((){
    _obscureText = !_obscureText;
  })
}

void resetPassword(){
  if(_formKey.currentState!.validate())
{
  //Show loader before starting the password reset process
  AppMethods.showLoaderDialog(context);

  final data = {
    "oldPassword": oldPasswordController.text,
    "newPassword": newPasswordController.text
  };

  setState((){
    _resetPasswordFuture = userService.resetPassword(data);
  });
}
}

@override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        mainAxisAlignmentt: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Space(),
          Image.asset(
            AppAssets.appLogoImg,
            height: MediaQuery.of(context).size.height * 0.15,
          ),
        Spacer(),
        Center(
            child: CText(
              'New Password',
              type: TextType.headlineLarge,
              color: AppColors.darkBlue,
            ),
        ),
          AppSpacing.verticalSpaceMedium,
          Center(
            child: CText(
              'Enter your new password below.',
              type: TextType.bodyMedium,
              color: AppColors.primaryText,
              fontWeight: FontWeight.w600,
            ),
          ),
        AppSpacing.verticalSpaceLarge,
        AppSpacing.verticalSpaceMedium,
        Form(
          key:_formKey,
            child: Column(
              children: [
  CustTextField(
  labelText: 'Old Password',
  hintText: 'Old Password',
  controller: oldPasswordController,
  prefixIcon: Icon(Icons.lock, color: AppColors.darkBlue),
  suffixIcon: IconButton(
  icon: Icon(
  _obscureText ? Icons.visibility : Icons.visibility_off,
  color: AppColors.darkBlue,
  ),
  onPressed: _togglePasswordVisibility,
  ),
  obscureText: _obscureText,
  validator: (value) => FieldValidators.validatePassword(value),
  ),
  AppSpacing.verticalSpaceLarge,
  CustTextField(
  labelText: 'New Password',
  hintText: 'New Password',
  controller: newPasswordController,
  prefixIcon: Icon(Icons.lock, color: AppColors.darkBlue),
  suffixIcon: IconButton(
  icon: Icon(
  _obscureText ? Icons.visibility : Icons.visibility_off,
  color: AppColors.darkBlue,
  ),
  onPressed: _togglePasswordVisibility,
  ),
  obscureText: _obscureText,
  validator: (value) => FieldValidators.validatePassword(value),
  ),
  AppSpacing.verticalSpaceLarge,
  CustTextField(
  labelText: 'Confirm Password',
  hintText: 'Confirm Password',
  controller: confirmPasswordController,
  prefixIcon: Icon(Icons.lock, color: AppColors.darkBlue),
    suffixIcon: IconButton(
      icon: Icon(
        _obscureText ? Icons.visibility : Icons.visibility_off,
        color: AppColors.darkBlue,
      ),
      onPressed: _togglePasswordVisibility,
    ),
    obscureText: _obscureText,
    validator: (value) {
      if (value != newPasswordController.text) {
        return 'Passwords do not match';
      }
      return null;
    },
  ),
  AppSpacing.verticalSpaceLarge, ElevatedButton(
  onPressed:_resetPassword,
  style: ElevatedButton.styleFrom(
  backgroundColor: AppColors.darkBlue,
  padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 80.0),
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(8),
  ),
  ),
  child: Text(
  'Submit',
  style: TextStyle(
  fontSize: 19.0,
  fontWeight: FontWeight.w600,
  color: AppColors.white,
  ),
  ),
  ),
  if (_resetPasswordFuture != null)
  FutureBuilder<SendEmailModel>(
  future: _resetPasswordFuture,
  builder: (context, snapshot) {
  if (snapshot.connectionState == ConnectionState.waiting) {
  return Container();
  } else if (snapshot.hasError) {
  Navigator.pop(context);
  return Text('Error: ${snapshot.error}');
  } else if (snapshot.hasData) {
  final response = snapshot.data!;
  WidgetsBinding.instance.addPostFrameCallback((_) {
  if (response.success ?? false) {
  Navigator.pop(context);
  AppMethods.displayToastSuccess(message: "Password reset successful");

  Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => LoginScreen()));
  }
  else{
    Navigator.pop(context);

ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(content: Text('Failed to reset password')),
);
}
});
return Container();
}
return Container();
},
),
],
),
),
Spacer(flex: 2),
],
),
),
);
}
}
