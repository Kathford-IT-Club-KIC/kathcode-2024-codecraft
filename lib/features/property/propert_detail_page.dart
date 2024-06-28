

class PropertyDetailPage extends StatelessWidget {
  final list<String> imageUrls;
  final String title;
  final String price;
  final String location;
  final String description;
  final String contactNumber;
  final String? status;
  final String? lat;
  final String? lang;
  final list<dynamic>amenities;

  PropertyDetailPage({
    required this.imageUrls,
    required this.title,
    required this.price,
    required this.location,
    required this.description,
    required this.amenities,
    required List<String> nearbyLocations,
    required this.contactNumber,
  });

  final Map<String, IconData> amenityIcons ={
    'Swimming Pool': Icons.pool,
    'Gym': Icons.fitness_center,
    'Garden': Icons.local_florist,
    'Garage': Icons.garage,
    'Wi-Fi': Icons.wifi,
    'Parking': Icons.local_parking,
    'Air Conditioning': Icons.ac_unit,
    'Security': Icons.security,
  };
  @override
  Widget build(BuildContext context){
    return Scaffhold(
      appBar: AppBar(
        title: Text('Property Details',style: TextStyle(color: AppColors.white)),
        backgroundColor: AppColors.lightBlue,
      ), //AppBar
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSpacing.verticalSpaceMedium,
                  _buildImageCarousel(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                        _buildPropertyInfo(),
                      AppSpacing.verticalSpaceMedium,
                      _buildPropertyDescription(),
                      AppSpacing.verticalSpaceMedium,
                      _buildAmenitiesGrid(),
                      AppSpacing.verticalSpaceMedium,
                      _buildGoogleMap(),
                      AppSpacing.verticalSpaceMedium,
                     ],
                        ), // column
    ),
      ],
    ),
    ),
    ),

      _buildContactOwnerCard(),
    ],
    ),
      );
  }
  Widget _buildImageCarousel() {
    return CarouselSlider(
      items: imageUrls.map((url) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
              url,
              width: double.infinity,
              fit: BoxFit.cover
            //height: 350,
          ),
        );
      }).toList(),
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 1.90,
        enlargeCenterPage: true,
      ),
    );
  }
  Widget _buildPropertyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
        Expanded(
          flex: 2,
          child: CText(
            title.trim(),
            maxLines: 3,
            type: TextType.headlineSmall,
            color: AppColors.PrimaryText,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
    AppSpacing.verticalSpaceMedium,
    Row(
    children: [
      Expanded(
    child: Text(
    price,
    style: TextStyle(fontSize:16, fontWeight: FontWeight.w600, color: AppColors.lightBlue),

    ),
    ),
    Expanded(
    child: Text(
    "Status: ${status.toString().capitalizeFirstLetter}",
    style: TextStyle(fontSize:16, fontWeight: FontWeight.w600, color: returnStatusColor(status)),

    ),
    ),
    ],
    ),
        AppSpacing.verticallSpaceMedium,

        Row(
          children: [
            Icon(Icons.location_on, color: AppColors.lightBlue),
            SizedBox(width: 4),
            Expanded(
            child: Text(
            location,
            style: TextStyle(fontSize: 16, color: AppColors.primaryText),
    ),
        ),
     ],
    ),
    ],
    );
  }
  Widget _buildPropertyDescription(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CText(
          'Description',
          type: TextType.headlineSmall,
          color: AppColors.lightBlue,
          fontWeight: FontWeight.w600,
        ),
        AppSpacing.verticalSpaceSmall,
        Text(
          description.toString().capitalizeFirstLetter ?? '',
          style: TextStyle(fontSize: 16, color: AppColors.primaryText),
        ),
      ],
    );
  }
  Widget _buildAmenitiesGrid(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CText(
          'Amenities',
          type: TextType.headlineSmall,
          color: AppColors.lightBlue,
          fontWeight: FontWeight.w600,
        ),
        AppSpacing.verticalSpaceSmall,
        amenitites.length>0
        ? GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 8,
          ),
          itemCount: amenities.length,
          itemBuilder: (context, index){
            final amenity = amenities[index];
            final icon = amenityIcons[amenity] ?? Icons.help_outline;
            return Row(
              children: [
                Icon(icon, color: AppColors.lightBlue),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    amenity,
                    style: TextStyle(fontSizze: 16, color: AppColors.primaryText),
                  ),
                ),
              ],
            );
          },
        )
            : Center(child: Text("No Amenties Available"),),
      ],
    );
  }
  Widget _buildGoogleMap() {
    print("Lat: $lat");
    print("Lang: $lang");
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CText(
          'Property In Map',
          type: TextType.headlineSmall,
          color: AppColors.lightBlue,
          fontWeight: FontWeight.w600,
        ),
        AppSpacing.verticalSpacelarge,
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child:SizedBox(
            height: 250,
              child: SearchwithMap(
                latitude: double.parse(lat ?? '27.7105'),
                longitude: double.parse(lang ?? '85.3488'),

              ),
            ),
          ), //cliprrect

      ],
    );
  }
  //
  Widget buildContactOwnerCard(){
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(Icons.phone, color: AppColors.lightBlue),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
    'Contact Owner',
    style: TextStyle(
    fontSize: 18,
    FontWeight: FontWeight.bold,
    color: AppColors.black,
    ),
    ),
    SizedBox(height: 8),
    ],
    ),
    ),
    ElevatedButton(
    onPressed: () {
      print('Calling $contactNumber');
    },
    style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.lightBlue,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
    ),
    ),
    child: CText('Inquiry', type: TextType.bodyMedium,
    color: AppColors.white,
    fontWeight: FontWeight.w700,
    ),
    ),
    AppSpacing.verticalSpaceSmall,
    ],
    ),
    ),
    );
    }

    Color returnStatusColor(String? status) {
    if(status?.toLowerCase() == 'available'){
  return AppColors.lightBlue;
    }
    esle if(status?.toLowerCase() == 'booked'){
      return AppColors.darkOrange;
    }
    }
    return AppColors.green;
    }
