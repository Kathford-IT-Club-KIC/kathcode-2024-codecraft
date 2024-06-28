

<<<<<<< HEAD
import '../../../core/constants/app_colors.dart';

=======
>>>>>>> ea03dda8547c420cca78f1379d8fcd3bb7698568
class RecentlyAdded extends StatelessWidget{
  const RecentlyAdded({super.key});

  @override
  Widget build(BuildContext context){
    return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AppSpacing.verticalSpaceLarge,
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: CText(
          "Recently Added",
          type: TextType.displayLarge,
          color: AppColors.darkBlue,
          ), //CText
          ), //Padding
          ///Horizontal property list
          Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: SizedBox(
              height: 400, //adjust height as needed
              child: FutureBuilder<PropertyListModel>(
                future: PropertyService().fetchRecentlyAddedProperties(),
                builder: (context, snapshot) {

                  if(snapshot.connectionState == ConnectionState.waiting) {
return Center(child: CircularProgressIndicator());
}
 else if (snapshot.hasError) {
   return Center(child: Text('Error: ${snapshot.error}'));
}
else if (!snapshot.hasData || snapshot.data!.data!.isEmpty) {
return Center(child: Text('No properties found'));
}
else {
final properties = snapshot.data!.data!;
return ListView.builder(
  scrollDirection: Axis.horizontal,
  itemCount: properties.length,
  itemBuilder: (BuildContext context, int index) {
final property = properties [index];
return InkWell(
onTap: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (builder) => Property DetailPage(
title: property.title!,
price: '\$${property.amount}/month',
location: property.address!,
description: property.description!,
imageUrls: property.propertyImage!,
amenities: property.amenities ?? '',
status: property.status ?? 'N/A',
contactNumber: property.contactNumber.toString() ?? '',
lat: property.location?.coordinates?.first.toString() ?? '0.0',
lang: property.location?.coordinates?.[1].toString() ?? '0.0',
nearbylocations: ['Park', 'Supermarket', 'School', 'Hospital'],
),
),
);
},
child: Container(
width: MediaQuery.of(context).size.width * 0.8, //adjust width
margin: EdgeInsets.symmetric(horizontal: 8.0),
child: PropertyCard(
imageUrl: property.propertyImage!.isNotEmpty
    ? property.propertyImage?.first ??''
    : AppAssets.errorImage,
title: property.title ?? '',
price: '\$${property.amount}/month',
location: property.address ?? '',
description: property.description ?? '',
status: property.status ?? '',
),
),
);
},
);
}
},
),
),
],
);
}
}