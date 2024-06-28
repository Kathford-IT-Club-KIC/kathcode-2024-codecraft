import 'package:flutter/material.dart';
import 'package:hackathon_easyghar/features/seller/model/property_info_model.dart';

import '../../../core/constants/app_colors.dart';

class Addpropertystep1 extends StatefulWidget {
  const Addpropertystep1({super.key});

  @override
  State<Addpropertystep1> createState() => _Addpropertystep1State();
}

class _Addpropertystep1State extends State<Addpropertystep1> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _contactNumberController = TextEditingController();
  final _addressController = TextEditingController();
  final _priceController = TextEditingController();
  bool showError = false;

  @override
  void dispose(){
    _titleController.dispose();
    _addressController.dispose();
    _descriptionController.dispose();
    _contactNumberController.dispose();
    _priceController.dispose();
    super.dispose();
  }
  void _navigateToNextPage(BuildContext context){

  }

  Widget build(BuildContext context) {
    if (_titleController.text.isEmpty) {
      setState(() {
        showError = true;
      });
    }
    else
      {
        setState(() {
          showError=false;
        });
        final propertyInfo=PropertyInfoModel(title: _titleController.text,
            description: _descriptionController.text,
            address: _addressController.text,
            contactNumber: _priceController.text,
            amount: _priceController.text,);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddPropertyStep2(propertyInfo: propertyInfo),
          ),
        );
      }
  }
  @override
  Widget build(BuildContext context)
  return Scaffold(appBar: AppBar(
  loading: IconButton(
  icon: Icon(Icons.arrow_back),
  onPressed: ()
  {
    Navigator.pop(context);
  },
  ),
  title: Text(
  'Add Property',
  style: TextStyle(color: AppColors.white),
  ),
  ),
  body: Padding(
  padding: const EdgeInsets.all(16.0),
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    if(showError)
      Container(
        color: Colors.red,
        padding: EdgeInsets.all(6.0),
        child: Row(
  children: [
  Icon(Icons.error, color: Colors.white),
  SizedBox(width: 8),
  Text(
  'Error!!! Title is required',
  style: TextStyle(color: Colors.white),
  ),
  ],

  ),
  ),
  SizedBox(height: 8),
  Text('Information',
  style: TextStyle(fontWeight: FontWeight.bold,
  color: Colors.black),),
  SizedBox(height: 8),
  Text(
  'Give a brief but detailed information about the property',
  style: TextStyle(color: Colors.black),
  ),
  SizedBox(height: 16),
  TextField(
  controller: _titleController,
  style: TextStyle(color: Colors.grey),
  decoration: InputDecoration(
  labelText: 'TITLE',
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(7.0),
  ),
  ),
  ),
  SizedBox(height: 16),
  TextField(
  controller: _descriptionController,
  maxLines: 4,
  style: TextStyle(color: Colors.black),
  decoration: InputDecoration(
  labelText: 'DESCRIPTION',
  hintStyle: TextStyle(color: Colors.black),
  hintText: 'Please enter a description to get the best possible response to your listing. Tell other users what you love about the property, what is great about it and its location',
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(7.0),
  ),
  ),
  ),
  SizedBox(height: 16),
  TextField(
  controller: _addressController,
  style: TextStyle(color: Colors.black),
  decoration: InputDecoration(
  labelText: 'ADDRESS',
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(7.0),
  ),
  ),
  ),
  SizedBox(height: 16),
  TextField(
  controller: _contactNumberController,
  style: TextStyle(color: Colors.black),
  decoration: InputDecoration(
  labelText: 'CONTACT NUMBER',
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(7.0),
  ),
  ),
  ),
  SizedBox(height: 16),
  TextField(
  controller: _priceController,
  style: TextStyle(color: Colors.black),
  decoration: InputDecoration(
  labelText: 'PRICE',
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(7.0),
  ),
  ),
  ),
  ],
  ),
  ),
  bottomNavigationBar: BottomAppBar(
  child: Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    TextButton(onPressed: (){
      Navigator.pop(context);
  }, child: Text('BACK',style: TextStyle(fontWeight: FontWeight.bold)),
  ),
  Text('STEP 1 OF 4'),
  TextButton(
  onPressed: () {
  _navigateToNextPage(context);
  },
  child: Text('NEXT', style: TextStyle(fontWeight: FontWeight.bold)),
  ),
  ],
  ),
  ),
  ),
  );

}

  }
}
