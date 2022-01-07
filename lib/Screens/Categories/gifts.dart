import 'package:carousel_slider/carousel_slider.dart';
import 'package:fauna/Model/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outline_search_bar/outline_search_bar.dart';
import 'gift_card.dart';

const kTextLabel = TextStyle(
  color: Colors.black,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

class Gifts extends StatefulWidget {
  const Gifts({Key? key}) : super(key: key);

  @override
  _GiftsState createState() => _GiftsState();
}

class _GiftsState extends State<Gifts> {
  List<GiftItem> giftItems = [];
  List<PerfumeItem> perfumeItems = [];
  @override
  void initState() {
    super.initState();
    fetchPerfumeData();
    fetchGiftData();
  }

  fetchGiftData() async {
    dynamic result = await GiftManager().getGiftItemList();
    if (result == null) {
      print("Gift list null");
    } else {
      setState(() {
        giftItems = result;
      });
    }
  }

  fetchPerfumeData() async {
    dynamic result = await PerfumeManager().getPerfumeItemList();
    if (result == null) {
      print("Perfume list null");
    } else {
      setState(() {
        perfumeItems = result;
      });
    }
    print('${perfumeItems.length}');
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
                margin: EdgeInsets.only(left: 30, top: 10),
                child: Text(
                  "Toys",
                  style: kTextLabel,
                ),
              ),
              Container(
                height: 300,
                width: 40,
                color: Color(0xff561212),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                  ),
                  items: giftItems
                      .map((item) => Container(
                            child: Container(
                              margin: EdgeInsets.all(5.0),
                              child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  child: Stack(
                                    children: <Widget>[
                                      Image.network(item.image.toString(),
                                          fit: BoxFit.fitWidth, width: 1000.0),
                                      Positioned(
                                        bottom: 0.0,
                                        left: 0.0,
                                        right: 0.0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color.fromARGB(
                                                    200, 255, 255, 255),
                                                Color.fromARGB(0, 0, 0, 0)
                                              ],
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                            ),
                                          ),
                                          child: Text(
                                            item.title.toString(),
                                            style: GoogleFonts.ubuntu(
                                              fontSize: 22.0,
                                              color: Color(0xff561212),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0.0,
                                        right: 0.0,
                                        child: Container(
                                          child: Text(
                                            '\$${item.price}',
                                            style: GoogleFonts.ubuntu(
                                              fontSize: 22.0,
                                              color: Color(0xff561212),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ))
                      .toList(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, top: 10),
                child: Text(
                  "Perfume",
                  style: kTextLabel,
                ),
              ),
              Container(
                height: 300,
                width: 40,
                color: Color(0xff071136),
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                  ),
                  items: perfumeItems
                      .map((item) => Container(
                            child: Container(
                              margin: EdgeInsets.all(5.0),
                              child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  child: Stack(
                                    children: <Widget>[
                                      Image.network(
                                        item.image.toString(),
                                        fit: BoxFit.fitWidth,
                                        width: 1000.0,
                                      ),
                                      Positioned(
                                        bottom: 0.0,
                                        left: 0.0,
                                        right: 0.0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color.fromARGB(
                                                    200, 255, 255, 255),
                                                Color.fromARGB(0, 0, 0, 0)
                                              ],
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                            ),
                                          ),
                                          child: Text(
                                            item.title.toString(),
                                            style: GoogleFonts.ubuntu(
                                              fontSize: 22.0,
                                              color: Color(0xff071136),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0.0,
                                        right: 0.0,
                                        child: Container(
                                          child: Text(
                                            '\$${item.price}',
                                            style: GoogleFonts.ubuntu(
                                              fontSize: 22.0,
                                              color: Color(0xff071136),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ))
                      .toList(),
                ),
                // child: GridView.builder(
                //   shrinkWrap: true,
                //   physics: NeverScrollableScrollPhysics(),
                //   itemCount: items.length,
                //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2,
                //     mainAxisSpacing: 20.0,
                //     crossAxisSpacing: 20.0,
                //   ),
                //   itemBuilder: (context, index) => ItemCard(
                //     item: items[index],
                //     press: () {},
                //   ),
                // ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// final List<String> imgList = [];
//
// final List<Widget> imageSliders = giftItems
//     .map((item) => Container(
//           child: Container(
//             margin: EdgeInsets.all(5.0),
//             child: ClipRRect(
//                 borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                 child: Stack(
//                   children: <Widget>[
//                     Image.network(item.image.toString(),
//                         fit: BoxFit.cover, width: 1000.0),
//                     Positioned(
//                       bottom: 0.0,
//                       left: 0.0,
//                       right: 0.0,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [
//                               Color.fromARGB(200, 241, 12, 12),
//                               Color.fromARGB(0, 23, 20, 20)
//                             ],
//                             begin: Alignment.bottomCenter,
//                             end: Alignment.topCenter,
//                           ),
//                         ),
//                         child: Text(item.title.toString()),
//                       ),
//                     ),
//                   ],
//                 )),
//           ),
//         ))
//     .toList();
