import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooood/lib/Screeen/Post_Screen.dart';

import 'package:form_field_validator/form_field_validator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Models/CheckOUt_Model.dart';

class AdressScreen extends StatefulWidget {
  AdressScreen({this.quantity, this.totelPrice, Key? key}) : super(key: key);
  double? totelPrice;
  int? quantity;
  @override
  State<AdressScreen> createState() => _AdressScreenState();
}

class _AdressScreenState extends State<AdressScreen> {
  final phoneController = TextEditingController();
  final adressController = TextEditingController();
  final tasteController = TextEditingController();
  final key = GlobalKey<FormState>();
  String? adressdata = 'Type on Location Icon';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    int totel = widget.totelPrice!.toInt();
    int quantity = widget.quantity!;

    return Scaffold(
      backgroundColor: Color(0xFF6B5E55),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Checkout Screen'),
        centerTitle: true,
      ),
      body: Form(
        key: key,
        child: Container(
            height: height,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                SizedBox(
                  height: height * 0.1,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: phoneController,
                      validator: RequiredValidator(
                          errorText: 'Enter your Phone Number'),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 5)),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Phone',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: adressController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 5)),
                          prefixIcon: Icon(
                            Icons.contact_mail,
                            color: Colors.white,
                          ),
                          label: Text(
                            adressdata.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          suffixIcon: IconButton(
                              onPressed: getPosition,
                              icon: Icon(
                                Icons.location_on,
                                color: Colors.white,
                              ))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: height * 0.05,
                    child: Text(
                      'Special Instruction',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Any Specific Preferences? Let us Know.',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: tasteController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 5)),
                          label: Text(
                            'e.g, Spicy or light',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total ',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        widget.totelPrice.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      if (key.currentState!.validate()) {
                        checkOutServices(
                            OrderId: 1,
                            ProductId: 1,
                            Quantity: quantity,
                            Price: totel);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PostScreen(),
                            ),
                            (route) => false);
                      }
                    },
                    child: Container(
                      height: height * 0.05,
                      color: Colors.yellow,
                      child: Center(
                        child: Text(
                          'Order Now',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  getPosition() async {
    var status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      Position data = await _determinedPosition();
      GetAdressFromLatLon(data);
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Turn On Your Location')));
  }

  _determinedPosition() async {
    bool serviceEnable;
    LocationPermission permission;
    serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error('Location Service Disable');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Permission is denied for ever');
    }
    return await Geolocator.getCurrentPosition();
  }

  void GetAdressFromLatLon(Position data) async {
    List<Placemark> placeMark =
        await placemarkFromCoordinates(data.latitude, data.longitude);

    Placemark place = placeMark[0];
    var adress = "${place.street},${place.country}";

    setState(() {
      adressdata = adress;
    });
  }
}
