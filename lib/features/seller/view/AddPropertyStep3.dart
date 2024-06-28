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
    getState(() {
      images.add(pickedFile);
      if (images.length >= 3) {
        showError = false;
      }
    });
  }
}
  void _navigateToNextPage(BuildContext context) {
    if (images.length < 3) {
      setState(() {
        showError = true;
      });
    } else {
      widget.propertyInfo.images = images;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddPropertyStep4(propertyInfo: widget.propertyInfo),
        ),
      );
    }
  }
@override
    Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: ()
          {
            Navigator.pop(context);
          },
        ),
        title: Text('Add Property'),
      ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(showError)
                Container(
                  color: Colors.red,
                  padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.error, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'Error!!! At least 3 images are required',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),



        ),
      SizedBox(height: 8),
      Text('Images',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),),
              SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: images.length + 1,
                  itemBuilder: (context, index) {
                    if (index < images.length) {
                      return Stack(
                        children: [
                          Image.file(File(images[index].path)),
                          Positioned(
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  images.removeAt(index);
                                  if (images.length < 3) {
                                    showError = true;
                                  }
                                });
                              },
                              child: Icon(Icons.close, color: Colors.red),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          color: Colors.grey[200],
                          child: Center(
                            child: Icon(Icons.add),
                          ),
                        ),
                      );
                    }
                  },
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
              }, child: Text('BACK',style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              Text('Step 3 OF 4'),
              TextButton(onPressed: (){
                _navigateToNextPage(context);
              }, child: Text('NEXT', style: TextStyle(fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        ),
      ),
        );
    }
}
