import 'package:flutter/material.dart';
import 'package:hackathon_easyghar/features/seller/model/property_info_model.dart';

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
      }
    return const Placeholder();
  }
}
