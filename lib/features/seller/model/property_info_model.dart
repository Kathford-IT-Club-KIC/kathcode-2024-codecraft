class PropertyInfoModel{
  String title;
  String description;
  String address;
  String contactNumber;
  String amount;
  String propertyType;
  String listingType;
  int bedroomCount;
  int bathroomCount;
  int kitchenCount;
  int diningCount;
  List<XFile> images;
  Set<String> utilities;
}
PropertyInfoModel(
{
  required this.title,
  required this.description,
  required this.address,
  required this.contactNumber,
  required this.amount,

}
)

