import 'package:flutter/material.dart';

import '../model/property_info_model.dart';

class AddPropertyStep4 extends StatefulWidget{
  final PropertyInfoModel propertyInfo;
  AddPropertyStep4({required this.propertyInfo});
  @override
  _AddPropertyStep4State createState() =>
      _AddPropertyStep4State();
}
class_AddPropertyStep4State extends
State<AddPropertyStep4> {
final List<Map<String, dynamic>> utilities = [
{'name': 'Elevator', 'icon': Icons.elevator},
{'name':'Door Man', 'icon':
Icons.door_front_door},
{'name':'Heating','icon': Icons.thermostat},
{'name': 'Private Bathroom', 'icon': Icons.bathtub},
{'name': 'TV', 'icon': Icons.tv},
{'name': 'Parking', 'icon': Icons.local_parking},
{'name': 'Gym', 'icon': Icons.fitness_center},
{'name': 'CCTV', 'icon': Icons.videocam},
{'name': 'Security', 'icon': Icons.security},
];
final Set<String> selectedUtilities = {};
final AddPropertyService userService =
    AddPropertyService(HttpServiceImpl());
Future<Response>?_addPropertyFuture;
double uploadProgress = 0;

void _submitProperty(BuildContext context)
async{
  widget.propertyInfo.utilities = selectedUtilities;

setState(() {
  _addPropertyFuture =
      userService.addProperty(
        PropertyInfo(
          propertyInfoModel: widget.propertyInfo,
          latitude: 37.7749,
        longitude: -122.4194,
        ),
            (int sent, int total) {
          setState(() {
            uploadProgress = sent / total;
          });
        },
      );
});

try{
  Response response = await _addPropertyFuture!;
  Navigation.pop(context);
  if(response.statusCode == 200 || response.statusCode ==201){
    _showUploadSuccessPopup(context);
  } else{
    _showUploadFailurePopup(context);
  }
  } catch(e){
  Navigator.pop(context); // Dismiss the loader
  _showUploadFailurePopup(context);
}
}

void _showUploadSuccessPopup(BuildContext context) {
  showDialog(context: context, builder: BuildContext context){
  return AlertDialog(
    title: Text('Success',
    content: Text('Property uploaded successfully!'),
    actions: [
      TextButton(
  onPressed: (){
    Navigator.of(context).pop();
    Navigator.of(context).pop();

  },
  child: Text('OK'),
  ),
  ],
  );
},
);
}
void _showUploadFailurePopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Failure'),
        content: Text('Failed to upload property. Please try again.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}


@override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    title: Text('Add Property'),
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
          children: [
          Text(
          'UTILITIES',
          style: TextStyle(
            fontWeight: FontWeight.bold,
              color:Colors.grey,
  ),
  ),
  SizedBox(height: 8),
  Text('Select as many utilities as you have on your property',
  style: TextStyle(color: Colors.grey),
  ),
  SizedBox(height: 16),
  Expanded(
  child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 8,
    mainAxisSpacing: 8,
  ),
  itemCount: utilities.length,
  itemBuilder: (context, index) {
  final utility = utilities[index];
  final isSelected = selectedUtilities.contains(utility['name']);
  return GestureDetector(
  onTap: () {
  setState(() {
  if (isSelected) {
  selectedUtilities.remove(utility['name']);
  }else{
  selectedUtilities.add(utility['name']);
  }
  });
  },
  child:Container(
  decoration: BoxDecoration(
  color: isSelected ? Colors.purple : Colors.grey[200],
 borderRadius:
  BorderRadius.circular(8),
  ),
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children:[
    Icon(
  utility['icon'],
  color:isSelected ? Colors.white: Colors.black,
  size: 36,
  ),
  SizedBox(height: 8),
  Text(
  utility['name'],
  style: TextStyle(
    color: isSelected ? Colors.white : Colors.black,
  ),
  ),
  ],
  ),
  ),
  );
  },
  ),
  ),

  if(uploadProgress > 0 && uploadProgress < 1)
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          LinearProgressIndicator(
            value: uploadProgress,
            backgroundColor: Colors.grey[200],
            color: Colors.blue,
          ),
          Text(
            "${(uploadProgress * 100).toStringAsFixed(1)}%",
            style: TextStyle(color: Colors.black),
          ),
         ],
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
    TextButton(
  onPressed: (){
    Navigator.pop(context);
  },
  child: Text('BACK', style:
  TextStyle(fontWeight: FontWeight.bold)),
  ),
  Text('STEP 4 OF 4'),
  TextButton(
  onPressed: () {
  AppMethods.showLoaderDialog(context);
  _submitProperty(context);
  },
  child: Text('SUBMIT', style:
  TextStyle(fontWeight: FontWeight.bold)),
  ),
  ],
  ),
  ),
  ),
  );

}









