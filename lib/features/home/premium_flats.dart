

class PremiumFlats extends StatelessWidget {
  const PremiumFlats({super.key});

  @override
  Widget build(BuildContext Context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: CText("Premium Flats", type: TextType.displayLarge,
             color: AppColors.darkBlue,
            ), //CText
    ), //padding
///Horizontal Property Lists
    Padding(
            padding: const EgdeInsets.symmetric(vertical: 16.0),
            child: SizedBox(
            height: 400, //Adjust height
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBUilder: (Build Context content, int index){
        return InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (builder)) => PropertyDetailPage(
          title: 'Beautiful 2BHK Flat',
          price: '\$1200/month',
          location: '123 Main Street, City, Country',
          description: 'This is beautiful 2BHK flat  located in the heart of the city and offers stunning view of the Skyline',
          imageUrls: AppAssets.networkImgList,
          amenities: ['Swimming Pool', 'Gym', 'Garden', 'Garage', 'WI-FI', 'Parking', 'Air Conditioning', 'Security'],
          contactNumber: '+1234567890',
          nearbyLocations: ['Park', 'SuperMarket', 'School', 'Hospital'],

    ))); //PropertyDetail, MaterialPageRoute
    },

    child: Container(
    width: MediaQuery.of(context).size.width * 0.8, //Adjust width as Needed
    margin: EdgeInsets.symmetric(horizontal: 8.0),
    child: PropertyCard(
    imageUrl: AppAssets.networkImgList(index),
    title: 'Beautiful 2BHK Flat',
    price: '\$1200/month',
    location: '123 Main Street, City, Country',
    description: 'This is beautiful 2BHK flat  located in the heart of the city and offers stunning view of the Skyline',
    ), //propertycard
    ), //container
    ); //inkwell
    },
    ), //listview.builder
    ), //Sizebox
    ), //padding
    ],
    ); //column
  }
}
