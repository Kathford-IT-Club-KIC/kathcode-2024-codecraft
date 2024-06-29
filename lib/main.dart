void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      child: MaterialApp(
        title: 'Easy Ghar',
        theme: AppThemes.lightTheme,
        debugShowCheckedModeBanner: false,
        home: OnBoardingPage(),
      ),
    );  
  }
}