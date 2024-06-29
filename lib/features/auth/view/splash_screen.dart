class SplashScreen extends StatelessWidget{
  SplashScreen({super.key});
  @override
  Widget build(BuildContext context){
    hideSystemNavBar();
    return Scaffold(body:Column(
      children:[
        AppSpacing.verticalSpaceMassive,
        SizedBox(
                height: AppSpacing.screenHeight(context) * 0.15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AppAssets.appLogoImg,),
                  ],
                )),
                AppSpacing.verticalSpaceSmall,
                Padding(padding:EdgeInsets.symmetric(horizontal:AppSpacing.veryLargePadding)
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CText(
                    AppStrings.letUsFindYour,
                    color: AppColors.darkBlue,
                    type: TextType.displayLarge,
                    fontSize: 28.0,
                  ),
                  AppSpacing.verticalSpaceTiny,
                  CText(
                    AppStrings.dreamRealState,
                    color: AppColors.darkBlue,
                    type: TextType.displayLarge,
                    fontSize: 28.0,
                  ),
                  AppSpacing.verticalSpaceMedium,
                  CText(
                    AppStrings.splashScreenSubTextOne,
                    color: AppColors.primaryText,
                    type: TextType.bodyLarge,
                  ),
                  AppSpacing.verticalSpaceLarge,
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => OnBoardOne(),
                            //   ),
                            // );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                            // Adjust padding as needed
                            decoration: BoxDecoration(
                              color: AppColors.green,
                              borderRadius: BorderRadius.circular(
                                  12.0), // Adjust border radius as needed
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                                child: CText(
                                  AppStrings.getStarted,
                                  type: TextType.bodyLarge,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
  
                                  // You might need to adjust text color based on your gradient
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.verticalSpaceLarge,
                ],
              ),
            )//padding

            AppSpacing.verticalSpaceMedium,
            AppSpacing.verticalSpaceMedium,
            Expanded(child:Image.asset(
              AppAssets.homeImg,
              fit:BoxFit.fill,
            ),),
      ],
    ),);
  }
  void hideSystemNavBar(){
    systemChrome.setEnableSystemUIMode(SystemUiMode.manual,overlays:[SystemUiOverlay.top]);
  }
}