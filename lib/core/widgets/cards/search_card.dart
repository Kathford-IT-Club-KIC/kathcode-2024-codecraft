

import 'package:flutter/material.dart';
import 'package:hackathon_easyghar/core/constants/app_colors.dart';

class Data{
  final String? text;
  Data({this.text});
}
class SearchCard extends StatelessWidget {
  List<Data>?data;
  SearchCard({this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showSearch(context: context, delegate: PropertySearch(
          reportData: data?.reversed.toList(),
        ));
      },
      child: Card(
        elevation: 4,
        color: AppColors.white,
        surfaceTintColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Row(
            children: [
              Expanded(child: TextFormField(enabled: false,
              decoration: InputDecoration(
                hintText: 'Searc',
                border: InputBorder.none,
                fillColor: AppColors.white
              ),),
              ),
              AppSpacing.horizontalSpaceSmall,
              Icon(Icons.search,
              color: Colors.grey,),
            ],
          ),
        ),
      ),
    );
  }
}
