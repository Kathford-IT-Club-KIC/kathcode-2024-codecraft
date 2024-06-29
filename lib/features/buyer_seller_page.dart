class BuyerSellerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vetrical: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSpacing.verticalSpaceMedium,
          AppSpacing.verticalSpaceMedium,

          Center(
            child: Image.asset(
              AppAssets.appLogoImg,
              height: MediaQuery.of(context).size.height * 0.15,
           ),
          ),
          SvgPicture.asset('assets/home/rent.svg', height: 350,),
          Center(
            child: CText(
              'Welcome to EasyGhar',
              type: TextType.headlineLarge,
              color: AppColors.darkBlue,
            ),
          ),
          AppSpacing.verticalSpaceMedium,
          Center(
            child: CText
                'Find your perfect property or add a new one easily.',
                type: TextType.bodyMedium,
                color: AppColors.primaryText,
                fontWeight: FontWeight.w600,
          ),
    ),
    AppSpacing.verticalSpacelarge,
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
       child: CustomElevatedButton(
       onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Dashboard()),
    );
    },
text: 'Buy or Rent a property',
 bakcgroundColor: AppColors.darkBlue,
 textColor: AppColors.white,
       ),
      ),
      SizedBox(width: 8),
      Expanded(
        child: CustomElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddPropertyStep1()),
    ),
  },
      text: 'Add Property',
backgroundColor: AppColors.teal,,
textColor: AppColors.white,
  ),
  ),
],
  ),
Spacer( flex:3),
],
  ),
  ),
  );
}
}
