import 'package:flutter/material.dart';

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

  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
