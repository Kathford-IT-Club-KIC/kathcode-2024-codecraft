class EmailInputPage extends StatefulWidget {
  @override
  State<EmailInputPage> createState() => _EmailInputPageState();
}

class _EmailInputPageState extends State<EmailInputPage> {
  final _emailInputFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  Future<SendEmailModel>? _sendEmailFuture;
  final AuthService userService = AuthService(HttpServiceImpl());

  void_sendForgotPasswordEmail() {
    if(_emailInputFormKey.currentState!.validate()){
      //Show loader before starting the login process
      AppMethods.showLoaderDialog(context);

      setState(() {
        _sendEmailFuture=userService.sendForgotPasswordEmail(emailController.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        iconTheme: IconThemeData(color: AppColors.primaryText),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Image.asset(
              AppAssets.appLogoImg,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.15,
            ),
            Spacer(),
            Center(
              child: CText(
                'Forgot Password',
                type: TextType.headlineLarge,
                color: AppColors.darkBlue,
              ),
            ),
            AppSpacing.verticalSpaceMedium,
            Center(
              child: CText(
                'Enter your email to recieve an OTP.',
                type: TextType.bodyMedium,
                color: AppColors.primaryText,
                fontWeight: FontWeight.w600,
              ),
            ),
            AppSpacing.verticalSpaceLarge,
            AppSpacing.verticalSpaceMedium,
            Form(
              key: _emailInputFormKey,
              child: Column(
                children: [
                  CustTextField(
                    labelText: 'Email',
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email, color: AppColors.darkBlue),
                    controller: emailController,
                    validator: (value) => FieldValidators.validateEmail(value),
                  ),
                  AppSpacing.verticalSpaceLarge,
                  ElevatedButton(
                    onPressed: _sendForgotPasswordEmail,

                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.darkBlue,
                      padding: EdgeInsets.symmetric(
                          vertical: 14.0, horizontal: 80.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            if(_sendEmailFuture != null)
              FutureBuilder<SendEmailModel>(
                future: _sendEmailFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container();
                  } else if (snapshot.hasError) {
                    Navigator.pop(context);
                    return Text('Error:${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final response = snapshot.data!;

                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (response.success ?? false) {
                        Navigator.pop(context);

                        AppMethods.displayToastSuccess(
                            message: "An OTP is send in your email please check");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => OTPInputPage()),
                        );
                      } else {
                        Navigator.pop(context);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(
                              'Failed to send email: Please cross check your email')),
                        );
                      }
                    });
                    return Container(); // Return an empty container if the registration is successful
                  }
                  return Container(); // Return an empty container if there's no data
                },
              ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }