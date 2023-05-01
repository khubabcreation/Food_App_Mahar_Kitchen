import 'package:flutter/material.dart';

import '../Models/NotesModel.dart';
import '../Post_Screen_Widget/Custome_Drawer.dart';
import 'Cart Screen.dart';
import 'DbHandler.dart';

class FinalItems extends StatefulWidget {
  FinalItems(
      {required this.price,
      required this.name,
      required this.Image_Url,
      Key? key})
      : super(key: key);
  String Image_Url;
  String name;
  double? price;

  @override
  State<FinalItems> createState() => _FinalItemsState();
}

class _FinalItemsState extends State<FinalItems> {
  DbHelper? helper;
  late Future<List<NotesModel>> notesList;

  void initState() {
    super.initState();
    helper = DbHelper();
    loadData();
  }

  loadData() async {
    notesList = helper!.getNotesList();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    GlobalKey<ScaffoldState> state = GlobalKey<ScaffoldState>();

    return SafeArea(
      child: Scaffold(
        key: state,
        drawer: MyDrawer(),
        body: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF6B5E55),
              Color(0xFF5D5047),
              Color(0xFF423731),
              Color(0xFF382D27),
              Color(0xFF302720),
            ], end: Alignment.bottomCenter, begin: Alignment.topCenter),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        state.currentState?.openDrawer();
                      },
                      icon: Icon(Icons.menu),
                      color: Colors.white70,
                    ),
                    IconButton(
                      icon: Icon(Icons.shopping_cart, color: Colors.white70),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartScreen(),
                            ));
                      },
                    ),
                  ],
                ),
              ),

              ///Image of the Card
              SizedBox(
                height: height * 0.5,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 22,
                    color: Colors.transparent,
                    child: widget.Image_Url == "https://food.elms.pk/"
                        ? Center(
                            child: Text(
                              'Processing',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          )
                        : Image.network(widget.Image_Url),
                  ),
                ),
              ),

              SizedBox(
                  height: height * 0.1,
                  width: double.infinity,
                  child: Card(
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 3.0),
                              child: Text(
                                widget.name,
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.price.toString(),
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.01,
                              horizontal: width * 0.02),
                          child: Text(
                            'Taste You Love That',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white70),
                          ),
                        )
                      ],
                    ),
                  )),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.timelapse,
                      color: Colors.yellow,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                    child: Text(
                      '20-30 min',
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 5, vertical: height * 0.02),
                child: Text(
                  'Awesome',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 10, vertical: height * 0.05),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () {
                      helper!
                          .insert(NotesModel(
                        title: widget.name,
                        quantity: 1,
                        rupees: widget.price,
                      ))
                          .then((value) {
                        var snack = SnackBar(
                            backgroundColor: Colors.grey,
                            content:
                                Text('Data has been Added ! Check Your Cart'));
                        ScaffoldMessenger.of(context).showSnackBar(snack);
                        setState(() {
                          notesList = helper!.getNotesList();
                        });
                      }).onError((error, stackTrace) {
                        print(error.toString());
                      });
                    },
                    child: Container(
                      color: Colors.yellow,
                      height: height * 0.05,
                      width: width * 0.3,
                      child: Center(
                        child: Text('Add to Cart'),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
