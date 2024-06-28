class OnBoardingPage extends StatefulWidget{
  const OnBoardingPage({super.key});
  @override
  OnBoardingPage createState()=>OnBoardingPageState()
}
class OnBoardingPageState extends State<OnBoardingPage>{
final introKey=GlobalKey<IntroductionScreenState>();

void _onIntroEnd(context){
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder:(_)=>LoginScreen()),

  );
}
Widget _builderImage(String assetName){
  return Lottie.asset(assetName);
}
@override
  Widget build(BuildContext context){
  const bodyStyle=TextStyle(fontSize:19.0,color:AppColors.secondaryText);

  const pageDecoration=pageDecoration(
    titleTextStyle:TextStyle(fontSize:28.0,fontWeight:FontWeight.w600,color:AppColors.darkBlue),
    bodyTextStyle:bodyStyle,
    bodyPaddingEdgeInsets.fromLTRB(16.0,0.0,16.0,16.0),
    pageColor:AppColors.white,
    imagePadding:EdgeInsets.zero,
  );
  return IntroductionScreen(
    key:introKey,
    globalBackgroundColor:Colors.white,
    allowImplicitScrolling:true,
    page:[
      pageViewModel(
        title:"Find Your Perfect Stay",
        body:"with variety of rental options",
        image:_buildImage(AppAssets.onBoardOne),
        decoration:pageDecoration.copyWith(pageMargin:EdgeInsets.only(top:75,left:16.0,right:16.0)),
      ),
      pageViewModel(
        title:"Connect with Community ",
        body:"Discover a place to belog and connect",
        image:_buildImage(AppAssets.onBoardThree),
        decoration:pageDecoration.copyWith(pageMargin:EdgeInsets.only(top:75,left:16.0,right:16.0)),
      ),

    ],
    onDone:()=>_onIntroEnd(context),
    onSkip:()=>onIntroEnd(context),
    showSkipButton:true,
    skipOrBackFlex:0,
    netFlex:0,
    showBackButton:false,
    showBackButton:false,
    showBackButton:true,
    skip: const cText('Skip',type:TextType.bodyLarge,fontWeight:FontWeight.w600,)
    done:  const cText('Done',type:TextType.bodyLarge,fontWeight:FontWeight.w600,)
  curve:Curves.fastLinearToSlowEaseIn,
  controlsMargin: const EdgeInsets.all(16),
  controlsPadding: kIsWeb
  ? const EdgeInsets.all(12.0)
      : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
  dotsDecorator: const DotsDecorator(
  size: Size(10.0, 10.0),
  color: Color(0xFFBDBDBD),
  activeSize: Size(22.0, 10.0),
  activeShape: RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(25.0)),
  ),
  ),
  ),
}
}