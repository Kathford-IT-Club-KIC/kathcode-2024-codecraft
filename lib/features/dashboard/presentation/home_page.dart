import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
   final List<Data> data =[
     Data(text:'3BHK Flat'),
     Data(text: '2BHK Flat'),
     Data(text: '1BHK Flat'),
     Data(text: ' 2 Rooms'),
     Data(text: 'Single Room'),
   ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text("HomePage", style: TextStyle(color: AppColors.white),),),
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
              padding: const EdgeInsets.all(18.0),
          child: SearchCard(data:data),
          ),

          CarouselSlider(
            items[
              ImageSlider(imageName: AppAssets.sliderImageOne,fit: BoxFit.cover,),
              ImageSlider(imageName: AppAssets.sliderImageTwo,fit: BoxFit.cover,),
              ImageSlider(imageName: AppAssets.sliderImageThree, fit: BoxFit.cover,),
            ],
            options: CarouselOptions(
              autoPlay: true,
              enableInfiniteScroll: true,
              viewportFraction : 0.80,
              padEnds: true,
            ),


          ),
              Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    RecentlyAdded(),
  AppSpacing.verticalSpaceLarge,
  PremiumFlats(),
  ],
    )

        ],
      ),
    );
    return const Placeholder();
  }
}
