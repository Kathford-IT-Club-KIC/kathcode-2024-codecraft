import 'package:flutter/widgets.dart';

class PropertyCard extends StatelessWidget{
  final String imageUrl;
  final String title;
  final String price;
  final String location;
  final String description;
  final String status;

}
PropertyCard(
{
  required this.imageUrl,
  required this.title,
  required this.price,
  required this.location,
  required this.description,
  required this.status,

});
  @override
 widget build(BuildContext context){
    return Card(
      elevation:4,
      margin: EdgeInsets.all(16.0),
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _buildPropertyImage()),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPropertyInfo(),
                    SizedBox(height: 7),
                    Expanded(child: _buildPropertyDescription()),
                  ],
                ),
          ),)
        ],
      )
    )
  }
idget _buildPropertyImage() {
  return ClipRRect(
    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    child: Image.network(
      imageUrl,
      height: 180,
      width: double.infinity,
      fit: BoxFit.cover,
    ),
  );
}
Widget _buildPropertyInfo(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.black),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: Text(price, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.lightBlue),
            ),),
          ],
        )
      ],
    )
}