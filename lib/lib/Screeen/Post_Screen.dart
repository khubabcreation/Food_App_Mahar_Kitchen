import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooood/lib/Bloc/Product_Bloc/productlist_bloc.dart';
import 'package:fooood/lib/Bloc/itemlist_Bloc/itemlist_bloc.dart';
import 'package:fooood/lib/Models/ProductList_Model.dart';
import 'package:fooood/lib/Models/Product_Model.dart';
import 'package:fooood/lib/Post_Screen_Widget/Custome_Drawer.dart';
import 'package:fooood/lib/Screeen/Cart%20Screen.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../Widget/Title_Of_App.dart';
import 'Final_Items.dart';

class PostScreen extends StatefulWidget {
  PostScreen({this.email, Key? key}) : super(key: key);
  String? email;

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  GlobalKey<ScaffoldState> state = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    Provider.of<ItemlistBloc>(context, listen: false).add(getitemEvent());
    Provider.of<ProductListBloc>(context, listen: false).add(GetAllProducts());

    return SafeArea(
        child: Scaffold(
      key: state,
      drawer: MyDrawer(email: widget.email),
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
                //here is the body of the Row
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Title_of_App(
                      height: height, width: width, font_Size: 20)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.03,
              ),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Better Taste',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  )),
            ),
            SizedBox(
              height: height * 0.02,
            ),

            Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                  height: height * 0.04,
                  width: width,
                  child: BlocBuilder<ItemlistBloc, ItemlistState>(
                    builder: (context, state) {
                      if (state is ItemlistInitial) {
                        return SizedBox();
                      } else if (state is itemlistLoadingState) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is itemlistLoadedState) {
                        List<ProductListModel> list = state.itemlist;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: width / 4,
                              child: InkWell(
                                onTap: () {
                                  int? idnum = list[index].categoryId;
                                  Provider.of<ProductListBloc>(context,
                                          listen: false)
                                      .add(ProductItemListEvent(
                                    idNumber: idnum.toString(),
                                  ));
                                },
                                child: Card(
                                  color: Colors.transparent,
                                  child: Center(
                                      child: Text(
                                    list[index].categoryTitle.toString(),
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                              ),
                            );
                          },
                        );
                      } else if (state is itemlistErrorState) {
                        return Text('Error State');
                      } else
                        return SizedBox();
                    },
                  )),
            ),

            SizedBox(
              height: height * 0.04,
            ),

            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Text(
                  'Most Favourites',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            BlocBuilder<ProductListBloc, ProductListState>(
              builder: (context, state) {
                if (state is ProductListInitial) {
                  return SizedBox();
                } else if (state is ProductListLoadingState) {
                  return CircularProgressIndicator();
                } else if (state is ProductListLoadedState) {
                  List<ProductModel> list = state.list;
                  return Expanded(
                      child: GridView.builder(
                    itemCount: list.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      String urlOfImage = list[index].image.toString();
                      String title_Of_Item = list[index].productName.toString();
                      double? rupees = list[index].salePrice;
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FinalItems(
                                  Image_Url: 'https://food.elms.pk/' +
                                      list[index].image.toString(),
                                  name: title_Of_Item,
                                  price: rupees,
                                ),
                              ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                                colors: [
                                  Color(0xFF6B5E55),
                                  Color(0xFF5D5047),
                                  Color(0xFF423731),
                                  Color(0xFF382D27),
                                  Color(0xFF302720),
                                ],
                                end: Alignment.bottomCenter,
                                begin: Alignment.topCenter),
                          ),
                          child: urlOfImage.isEmpty
                              ? Center(
                                  child: Text(
                                  'Processing',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ))
                              : Image.network('https://food.elms.pk/' +
                                  list[index].image.toString()),
                        ),
                      );
                      ;
                    },
                  ));
                } else if (state is ProductListErrorState) {
                  return Text('Error in ProductList');
                } else
                  return SizedBox();
              },
            )

            //here is the body of Column
          ],
        ),
      ),
    ));
  }
}
