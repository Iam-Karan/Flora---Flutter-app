import 'package:fauna/Model/item.dart';
import 'package:fauna/Screens/Details/product_details.dart';
import 'package:outline_search_bar/outline_search_bar.dart';
// import 'package:fauna/Screens/details/product_details.dart';
import 'package:flutter/material.dart';

import 'flowers_card.dart';

class Flowers extends StatefulWidget {
  const Flowers({Key? key}) : super(key: key);

  @override
  _FlowersState createState() => _FlowersState();
}

class _FlowersState extends State<Flowers> {
  List<FlowerItem> flowerItems = [];
  List<FlowerItem> finalflowerItems = [];
  @override
  void initState() {
    super.initState();
    fetchFlowersData();
  }

  fetchFlowersData() async {
    dynamic result = await DatabaseManager().getItemList();
    if (result == null) {
      print("flower list null");
    } else {
      setState(() {
        finalflowerItems = result;
        for(var i = 0; i< finalflowerItems.length; i++){
          if(finalflowerItems[i].type == "bouquet"){
              flowerItems.add(finalflowerItems[i]);
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          OutlineSearchBar(
            margin: EdgeInsets.all(15.0),
            hintStyle: TextStyle(fontSize: 16.0, color: Colors.black),
            hintText: 'search',
            borderColor: Colors.red,
            borderRadius: BorderRadius.circular(10.0),
            textStyle: TextStyle(fontSize: 16.0, color: Colors.black),
            borderWidth: 2.0,
          ),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: flowerItems.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                  ),
                  itemBuilder: (context, index) => FlowerCard(
                    Floweritem: flowerItems[index],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            Floweritem: flowerItems[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
    ;
  }
}
