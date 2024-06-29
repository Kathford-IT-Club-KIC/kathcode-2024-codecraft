import 'package:flutter/material.dart';


class Data {
  final String? text;

  Data({this.text});
}

class SearchCard extends StatelessWidget {

  List<Data>? data;
  SearchCard({this.data});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showSearch(context: context,
            delegate: PropertySearch(
              reportData: data?.reversed.toList(),
              // names: reports,
              // contacts: AppStrings.frnContacts
            ));
      },
      child: Card(
        elevation: 4, // Add elevation for a shadow effect
        color: AppColors.white,
        surfaceTintColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child:  Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  enabled: false,
                  decoration: InputDecoration(
                      hintText: 'Search your reports',
                      border: InputBorder.none,
                      fillColor: AppColors.white
                  ),
                ),
              ),
              AppSpacing.horizontalSpaceSmall,
              Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
