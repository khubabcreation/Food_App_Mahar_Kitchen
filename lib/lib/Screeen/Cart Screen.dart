import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooood/lib/Bloc/Totel_Bloc/totel_bloc.dart';

import 'package:provider/provider.dart';
import '../Bloc/Price_Bloc/price_bloc.dart';
import '../Models/NotesModel.dart';
import '../Post_Screen_Widget/Custome_Drawer.dart';
import 'Adress_Screen.dart';
import 'DbHandler.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  DbHelper? helper;
  List<NotesModel>? notesList;
  double totel = 0;
  int quan = 0;
  @override
  void initState() {
    super.initState();
    helper = DbHelper();
    loadData();
  }

  Future<List<NotesModel>> loadData() async {
    notesList = await helper!.getNotesList();
    return notesList!;
  }

  // int product =0;

  @override
  Widget build(BuildContext context) {
    print(notesList);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFF6B5E55),
      drawer: MyDrawer(),
      body: Column(children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Cart',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.white,
                  icon: Icon(Icons.cancel_outlined),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All List',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                TextButton(
                    onPressed: () {
                      //here is the code of clear all
                    },
                    child: Text(
                      'Clear All',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ))
              ],
            ),
          ),
        ),
        Expanded(
            flex: 4,
            child: FutureBuilder(
                future: loadData(),
                builder: (context, AsyncSnapshot<List<NotesModel>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var model = snapshot.data![index];
                        quan = model.quantity;

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
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
                            child: Row(
                              children: [
                                Expanded(
                                    child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ///Row fro Deletion
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          snapshot.data![index].title
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 32),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              setState(() async {
                                                helper!.delete(
                                                    snapshot.data![index].id!);
                                                notesList = await helper!
                                                    .getNotesList();
                                                snapshot.data!.remove(
                                                    snapshot.data![index]);
                                                setState(() {});
                                              });
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.white,
                                            ))
                                      ],
                                    ),

                                    ///Row For increment and decrement
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ///Decrement button

                                        IconButton(
                                            onPressed: () async {
                                              model.quantity--;
                                              int actualprice = model.quantity;

                                              if (actualprice > 1) {
                                                int subtotel =
                                                    actualprice * 500;
                                                int grandtotel = subtotel - 500;

                                                Provider.of<PriceBloc>(context,
                                                        listen: false)
                                                    .add(priceDecremet(
                                                        givePrice: grandtotel
                                                            .toString()));
                                              } else {}

                                              int res =
                                                  await helper!.update(model);
                                              if (res > 0) {
                                                setState(() {});
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            "Not updated")));
                                              }
                                            },
                                            icon: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            )),
                                        Text(
                                          model.quantity.toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),

                                        ///incremnt buttton
                                        IconButton(
                                            onPressed: () async {
                                              model.quantity++;
                                              int res =
                                                  await helper!.update(model);

                                              if (res > 0) {
                                                setState(() {});
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            "Not updated")));
                                              }
                                            },
                                            icon: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            )),
                                        Text(
                                          snapshot.data![index].rupees
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22),
                                        )
                                      ],
                                    )
                                  ],
                                ))
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                })),
        Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 3,
          child: FutureBuilder(
            future: getTotal(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sub Total',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            snapshot.data.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sales Tax',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            '50.0',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery Charge:',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            '200.0',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          BlocBuilder<TotelBloc, TotelState>(
                            builder: (context, state) {
                              if (state is TotelInitial) {
                                return Text(
                                  totel.toString(),
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                );
                              } else if (state is totelLoadinState) {
                                return CircularProgressIndicator();
                              } else if (state is totelLoadedState) {
                                String number = state.number.toString();
                                return Text(
                                  number.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                );
                              } else if (state is totelErrorState) {
                                return Text('Error State');
                              }
                              return SizedBox();
                            },
                          )
                        ],
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => AdressScreen(),
                      //         ));
                      //   },
                      //   child:
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AdressScreen(
                                    totelPrice: totel, quantity: quan),
                              ));
                        },
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Text(
                              'Proceed To Checkout',
                              style: TextStyle(color: Colors.black45),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ),
      ]),
    ));
  }

  Future<double> getTotal() async {
    var notesList = await helper!.getNotesList();
    double sum = 0;
    for (var item in notesList) {
      sum += item.quantity * item.rupees!;
      totel = sum + 250;
    }

    return sum;
  }
}
