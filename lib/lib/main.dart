import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooood/lib/Bloc/Login_Bloc/login_bloc.dart';
import 'package:fooood/lib/Bloc/Price_Bloc/price_bloc.dart';
import 'package:fooood/lib/Bloc/Product_Bloc/productlist_bloc.dart';
import 'package:fooood/lib/Bloc/SighnUp_Bloc/signup_bloc.dart';
import 'package:fooood/lib/Bloc/Totel_Bloc/totel_bloc.dart';
import 'package:fooood/lib/Bloc/itemlist_Bloc/itemlist_bloc.dart';
import 'package:fooood/lib/Screeen/Splash_Screen.dart';

import 'Bloc/counter_bloc/counter_bloc.dart';
import 'Screeen/Login_Screen.dart';
import 'Screeen/SignUp_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignupBloc>(
          create: (context) {
            return SignupBloc();
          },
        ),
        BlocProvider<LoginBloc>(
          create: (context) {
            return LoginBloc();
          },
        ),
        BlocProvider<ItemlistBloc>(
          create: (context) {
            return ItemlistBloc();
          },
        ),
        BlocProvider<TotelBloc>(
          create: (context) {
            return TotelBloc();
          },
        ),
        BlocProvider<CounterBloc>(
          create: (context) {
            return CounterBloc();
          },
        ),
        BlocProvider<PriceBloc>(
          create: (context) {
            return PriceBloc();
          },
        ),
        BlocProvider<ProductListBloc>(
          create: (context) {
            return ProductListBloc();
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
