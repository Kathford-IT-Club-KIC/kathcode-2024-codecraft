

import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ), //Appbar
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/logo/logo.png",
              height: MediaQuery.of(context).size.height * 0.15
            ), //image.asset
            SizedBox(height: 16),
            Text(
              'Contact Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ), //textstyle
            ), //text
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.location_on,color: Colors.blue),
                SizedBox(width: 8),
                Expanded(
                  child:Text(
                    'Balkumari, Lalitpur, Nepal',
                    style: TextStyle(fontSize: 16),
                  ), //text
                ), //Expanded
              ],
            ), //Rows
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.phone, color: Colors.blue),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '+1 234 567 890',
                        style: TextStyle(fontSize: 16),
                  ), //text
                ), //expanded
              ],
            ), //Row
            SizedBox(height: 16),
            Row(
            children: [
              Icon(Icons.email, color: Colors.blue),
              SizedBox(width: 8),
              Expanded(
                child: Text(
               'contact@easyghar.com',
                style: TextStyle(fontSize: 16),
    ),   //text
    ),  //expanded
    ],
    ),  //row
    SizedBox(height: 16),
    Row(
     children: [
       Icon(Icons.language, color: Colors.blue),
        SizedBox(height: 16),
        Expanded(
        child: Text(
        'www.easyghar.com',
    style: TextStyle(fontSize: 16),
        ),  //text
        ), //expanded

    ],
    ),   //row
          ],
        ), //column
      ), //padding
    ); //scaffold
  }
}