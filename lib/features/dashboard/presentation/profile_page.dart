import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProfilePage'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Center(
              child: Image.asset(
                AppAssets.appLogoImg,
                height: MediaQuery.of(context).size.height * 0.15,
              ),
            ),
            Spacer(),
            CText('Profile Information',
            type: TextType.headLineLarge,
            color:AppColors.darkBlue,
            ),
            AppSpacing.verticalSpaceMedium,
            CText(
              'Name : Srishti Tater',
              type: TextType.headLineLarge,
              color: AppColors.primaryText,
            ),
            AppSpacing.verticalSpaceMedium,
            CText(
              'Email: srishtitater@gmail.com',
              type: TextType.bodyMedium,
              color: AppColors.primaryText,
            ),
            AppSpacing.verticalSpaceLarge,
            ElevatedButton(
                onPressed: (),
              {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BuyerSeller()),
              );
              },
            style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.darkBlue,
            padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 80.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: CText(
        'Switch to Seller now',
        type: TextType.titleMedium,
        color: AppColors.white,
      ),
          ],
        ),
      ),
    )
  }
}
