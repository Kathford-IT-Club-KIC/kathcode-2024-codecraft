
class AddPropertyStep2 extends StatefulWidget{
  final PropertyInfoModel propertyInfo;

  AddPropertyStep2({required this.propertyInfo});

  @override
  _AddPropertyStep2State createState() =>
      _AddPropertyStep2State();
}


class _AddPropertyStep2State extends
State<AddPropertyStep2> {
  int bedroomCount = 1;
  int bathroomCount = 1;
  int kitchenCount = 1;
  int diningCount = 1;
  String propertyType = 'House';
  String listingType = 'For Sale';

  @override
  void initState(){
    super.initState();
    bedroomCount =
        widget.propertyInfo.bedroomCount;
    bathroomCount=
        widget.propertyInfo.bathroomCount;
    kitchenCount =
        widget.propertyInfo.kitchenCount;
    diningCount =
        widget.propertyInfo.diningCount;
    propertyType = widget.propertyInfo.propertyType;
    listingType = widget.propertyInfo.listingType;
  }
  void_navigateToNextPage(BuildContext context){
    widget.propertyInfo.bedroomCount=
        bedroomCount;
    widget.propertyInfo.bathroomCount=
        bathroomCount;
    widget.propertyInfo.kitchenCount =
        kitchenCount;
    widget.propertyInfo.diningCount =
        diningCount;
    widget.propertyInfo.propertyType =
        propertyType;
    widget.properlyInfo.listingType = listingType;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder:(context) =>
            AddPropertyStep3(propertyInfo:
            widget.propertyInfo),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Add Property"),
    ),
    body: Padding(
        padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment:
    CrossAxisAlignment.start,
    children: [
    Text(
    'OTHER INFORMATION'
    style: TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    ),
    ),
      SizedBox(height: 8),
      Text(
        'Provide other information that could help users easily find your property',
        style: TextStyle(color: Colors.black),
      ),
      SizedBox(height: 16),
      DropdownButtonFormField<String>(
        decoration: InputDecorstion(
          labelText: 'Property Type',
    ),
    value: propertyType,
    items: ['House', 'Flat']
        .map((label) => DropdownMenuItem(
child: Text(label,style:
    TextStyle(fontWeight: FontWeight.w800, fontSize:
    16.0),),
    value: label,
    ))
        .toList(),
    onChanged: (value) {
    setState(() {
      propertyType = value!;
    });
    },
    ),
    SizedBox(height: 16),
    Text(
    'Listing Type',
    style: TextStyle(fontWeight:
    FontWeight.bold),
    ),
    Row(
    children: [
    Expanded(
    child: RadioListTile(
    title: Text('For Sale'),
    value: 'For Sale',
      groupValue: listingType,
      onChanged:(value){
        setState(() {
          listingType = value.toString();
        });
      },
    ),
    ),
   Expanded(
    child: RadioListTile(
    title: Text('For Rent'),
    value: 'For Rent',
    groupValue: listingType,
    onchanged: (value){
    setState(() {
    listingType = value.toString();
    });
    },
    ),
    ),
    ],
    ),
    SizedBox(height: 16),
    Text(
    'Property Room',
     style: TextStyle(fontWeight:
    FontWeight.bold),
    ),
    SizedBox(height: 8),
    Row(
    children: [
      Text('Bedroom'),
    Spacer(),
    IconButton(
    icon: Icon(Icons.remove),
    onPressed: () {
      setState(() {
        if (bedroomCount> 1) bedroomCount--;
    });
    },
    ),
 Text('$bedroomCount'),
 IconBUtton(
 icon: Icon(Icons.add),
 onPress:(){
    setState(() {
    bedroomCount++;
    });
    };
    );
    ];
    );
    Row( children: [
      Text('Bathroom'),
      Spacer(),
    IconButton(
    icon: Icon(Icons.remove),
    onPressed: () {
    setState(() {
    if(bathroomCount >1) bathroomCount--;
    });
    },
    ),
    Text('$bathroomCount'),
    IconButton(
    icon: Icon(Icons.add),
    onPressed: (){
    setState(() {
    bathroomCount++;
    });
    },
    ),
    ],
    ),
Row(
    children: [
     Text('Kitchen'),
     Spacer(),
     IconButton(
     icon: Icon(Icons.remove),
    onPressed: () {
    setState((){
    if(kitchenCount > 1) kitchenCount --;
    });
    },
    ),
    ],
    ),
    Row(
    children: [
      Text('Dining Hall'),
    Spacer();
    IconButton(
    icon: Icon(Icons.remove),
    onPressed: () {
    setState(() {
    if (diningCount > 1) diningCount--;
    });
    },
    ),
    Text('$diningCount'),
    IconButton(
    icon: Icon(Icons.add),
    onPressed: () {
    setState(() {
    diningCount++;
    });
    },
    ),
    ],
    ),
    ],
    ),
    ),
    bottomNavigationBar: BottonAppBar(
    child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TextButton(
    onPressed: (){
      Navigator.pop(context);
    },
    child: Text('BACK', style: TextStyle(fontWeight: FontWeight.bold)),
    ),
    child: Text('Next' style: TextStyle(fontWeight: FontWeight.bold),),
    ),
    ],
    ),
    ),
    ),
    );
  }
}












