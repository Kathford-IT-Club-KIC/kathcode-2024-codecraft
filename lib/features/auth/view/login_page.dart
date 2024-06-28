class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class_LoginScreenState extends State<LoginScreen>{
final _formKey = GlobalKey<FormState>();
final TextEditingController usernameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

bool _obscureText = true;
Future<Response>? _loginFuture;

final AuthService authService = AuthService(HttpServiceImpl());

void_togglePasswordVisibility() {
  setState((){
  _obscureText = !_obscureText;
});
}

void_loginUser(){
if(_formKey.currentState!.validate()){
setState((){
_loginFuture = authService.loginUser(
email: usernameController.text,
password: passwordController.text,
);
});
}
}

@override
Widget build(BuildContext context){
return Scaffold(
body: Padding(
padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
child: ListView(
children: [
AppSpacing.verticalSpaceLarge,
Image.asset(
AppAssets.appLogoImg,
height: MediaQuery.of(context).size.height * 0.15,
),
AppSpacing.verticalSpaceLarge,
CText(
'Welcome to EasyGhar',
type: TextType.headlineLarge,
color: AppColors.darkBlue,
),
AppSpacing.verticalSpaceMedium,
CText(
'More than just a rental,\ndiscover a place to belong.',
type: TextType.bodyMedium,
color: AppColors.primaryText,
fontWeight: FontWeight.w600,
),
AppSpacing.verticalSpaceLarge,
AppSpacing.verticalSpaceMedium,
Form(
  key: _formKey,
  child: Column(
  children: [
  CustTextField(
  labelText: 'Email',
  hintText: 'Email',
prefixlcon: lcon(Lcons.person, color: AppColors.darkBlue),
controller: usernameController,
validator: (value) => FieldValidators.validateEmail(value),
  ),
AppSpacing.verticalSpaceLarge,
CustTextField(
labelText: 'Password',
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
  validator: (value) =>

FieldValidators.validatePassword(value),
),
AppSpacing.verticalSpaceLarge,
  ElevatedButton(
  onPressed: () {
  if (_formKey.currentState!.validate()) {
  // Show loader before starting the login process

AppMethods.showLoaderDialog(context);
_loginUser();
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
child: CText(
'Login;,
type: TextType.titleMdium,
color: AppColors.white,
),
),
  AppSpacing.verticalSpaceMedium,
  Align(
  alignment: Alignment.bottomRight,
  child: TextButton(
  onPressed: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (context) => EmailInputPage()));
  },
child: CText(
'Forgot Password?',
type: TextType.bodyLarge,
color: AppColors.teal,
fontWeight: FontWeight.w600,
),
),
),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  CText(
  'Don\'t have an account?',
  type: TextType.bodyMedium,
  color: AppColors.secondaryText,
  ),
  TextButton(
  onPressed: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (context) => RegisterPage()),
  );
  },
child: CText(
'Register'
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
AppSpacing.verticalSpaceLarge,

FutureBuilder<Response>(
future:_loginFuture,
builder: (context, snapshot){
iF (snapshot.connectionState == ConnectionState.waiting) {
return Container();
//return CircularProgressIndicator();
}
else if(snapshot.hasData){
final response = snapshot.data!;
final userLoginModel = UserLoginModel.fromJson(response.data);

saveUserInfo(userLoginModel);

WidgetsBinding.instance.addPostFrameCallback((_) {
  Navigator.pushReplacement(
  context,
  MaterialPageRoute(
  builder: (context) => BuyerSellerPage(),
  ),
  );
  });

  return CText(
  'Login successful!',
  type: TextType.bodyMedium,
  color: Colors.green,
  );
  } else if (snapshot.hasError) {

  Navigator.pop(context);

return CText(
'An error occured during login',
type: TextType.bodyMedium,
color: Colors.red,
);
} else{
return Container();
}
},
),
],
),
),
);
}

void saveUserInfo(UserLoginModel userModel) {
  print("Access token : ${userModel.message?.accessToken ?? ''}");
  SharedPref.updateAccessToken(token: userModel.message?.accessToken ?? '');

}
}