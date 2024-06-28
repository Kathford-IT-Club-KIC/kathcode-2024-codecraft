

class FlatsNearBy extends StatelessWidget {
  const FlatsNearby({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Ctext("Flats Nearby", type: TextType.displayLarge,
            color: AppColors.darkBlue,
          ),
        ),
        ///Horizontal Property List
      padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: SizedBox(
          height: 400, //adjust height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (BuildContex context, int index){
              return InkWell(
                onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (builder) => PropertyDetailPage(
    title: 'Beautiful 2BHK Flat',
    price: '\$1200/month',
    location: '123 Main Street, City, Country',
    description: 'This beautiful 2BHK flat is located in the heart of the city and offers stunning view',
    imageUrls: AppAssts.networkImgList,
    amenities: ['Swimming Pool', 'Gym', 'Garden', 'Garage', 'Wi-Fi', 'Parking', 'Air Conditioning', 'Security'],
    contactNumber: '+1234567890',
    nearbyLocations: ['Park', 'Supermarket', 'School', 'Hospital'],
    ))); //propertyDetailPage, MaterialPageRoute
    },
    child: Container(
    width: MediaQuery.of(context).size.width * 0.8, //Adjust width as needed
    margin: EdgeInsets.symmetric(horizontal: 8.0),
    child: PropertyCard(
    imageUrl: AppAssets.networkImgList[index],
    title: 'Beautiful 2BHK FLat',
    price: '\$1200/month',
    location: '123 Main Street, City, Country',
    description: 'This beautiful 2BHK flat is located in the heart of the city and offers stunning view',
    ), //property cards
    ), //container
    ); //inkwell
   },
     ), //listview.builder
    ), //sizedBox
    ), //padding

      ],
    ); //column
  }
}