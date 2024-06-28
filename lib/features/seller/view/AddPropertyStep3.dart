import 'package:flutter/material.dart';

import '../model/property_info_model.dart';
class Addpropertystep3 extends StatefulWidget {
  final PropertyInfoModel propertyInfo;
  Addpropertystep3({required this.propertyInfo})
  const Addpropertystep3({super.key});

  @override
  _Addpropertystep3State createState() => _Addpropertystep3State();
}

class _Addpropertystep3State extends State<Addpropertystep3> {

  List<XFile> images = [];
  final ImagePicker _picker = ImagePicker();
  bool showError = false;
  Future<void> _pickImage()
async
{
  final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  if(pickedFile != null){
    getState(()
    {
      images.add(pickedFile);
      if(images.add(pickedFile>=3){
        showError=false;
      });
    })
  }
}
}
