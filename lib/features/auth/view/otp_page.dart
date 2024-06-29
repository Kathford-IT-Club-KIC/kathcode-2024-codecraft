import 'package:flutter/cupertino.dart';
import 'package:hackathon_easyghar/core/constants/app_colors.dart';
import 'package:hackathon_easyghar/core/extensions/add_typography.dart';

class OTPInputPage extends StatefulWidget{
  @override
  State<OTPInputPage> createState()=>_OTPInputPageState();
}
class OTPInputPageState extends State<OTPInputPage>{
  final _formKey=GlobalKey<FormState>();
  final TextEditingController otpController=TextEditingController();
  Future<SendEmailModel>?_verifyOtpFuture;
  final AuthService=AuthService(HttpServiceImpl());
  void _verifyOtp() {
    if (_formKey.currentState!.validate()) {
      AppMethods.showLoaderDialog(context);
      setState(()
      {
        _verifyOtpFuture = userService.verifyOtp(otpController.text);
      });
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            spacer(),
            Image.asset(
              AppAsset.appLogoImg,
              height:MediaQuery.of(context).size.height*0.15,
            )
          Spacer(),
      Center(
        child:CText(
          'Enter Otp',
          type:TextType.headlineLarge,
          color:AppColors.darkBlue
        ),//CText
      ),
      AppSpacing:verticalSpaceMedium,
      Center(
        child:CText(
            ' We have sent Otp to your email',
            type:TextType.bodyMedium,
            color:AppColors.primaryText
            fontWeight:FontWeight.w600,
        ),//CText
      ),//center
      AppSpacing:verticalSpaceLarge,
      AppSpacing:verticalSpaceMedium,
      Form(
        key:_formKey,
        child:Column(
          children:[
            CustTextField(
              labelText: 'OTP',
              hintText: 'Enter OTP',
              prefixIcon: Icon(Icons.lock, color: AppColors.darkBlue),
              controller: otpController,
              validator: (value) {
                return FieldValidators.validateFullName(value);
              },
            ),//CustTextField
            AppSpacing:verticalSpaceLarge,
            ElevatedButton(
              onPressed:_verifyOtp,
              style:ElecatedButton.styleForm(
                backgroundColor: AppColors.darkBlue,
                padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 80.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ), //style
              child:Text(
                'Submit',
                style:TextStyle(
                  fontSize:18.0,
                  fontWeight:FontWeight.w600,
                  color:AppColors.white,
                )
              )//Text
                )//elevated button
        AppSpacing.verticalSpaceLarge,
        Align(
          alignment: Alignment.bottomRight,
          child: TextButton(
            onPressed: () {
              // Handle resend OTP action
            },
            child: CText(
              'Resend OTP?',
              type: TextType.bodyLarge,
              color: AppColors.teal,
              fontWeight: FontWeight.w600,
            ),//CText
          ),//TextButton
        ),//align

        if(_verifyOtpFuture!=null)
          FutureBuilder<SendEmailModel>(
        future:_verifyOtpFuture,
      builder:(context,snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          retur Container();
        }
        else if (snapshot.hasError) {
          Navigator.pop(context);
          return Text('Error: ${snapshot.error}');
        }
        else if (snapshot.hasData) {
          final response = snapshot.data!;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (response.success ?? false) {
              Navigator.pop(context);
              AppMethods.displayToastSuccess(
                  message: "OTP Verified. Please reset your password.");
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => NewPasswordPage()));
            }
            else {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Invalid OTP. Please try again.')));
            }
          });
          return Container();
        },
        return Container();
      },
              ),
            Spacer(flex:2),

          ],
        ),
      ),
    );
  }
}