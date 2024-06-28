import 'dart:io';

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
  List<File> images;
  Set<String> utilities;
 PropertyInfoModel({
  required this.title,
  required this.description,
  required this.address,
  required this.contactNumber,
  required this.amount,
this.propertyType='House',
this.listingType='For Sale',
this.bedroomCount =1,
this.bathroomCount=1,
this.kitchenCount = 1,
this.diningCount = 1,
this.images = const [],
this.utilities = const{},});

}

