import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_one/provider/breab_crump_provider.dart';
import 'package:provider_one/view/screen/add_breadcrumb_screen.dart';
import 'package:provider_one/view/screen/home_screen.dart';

void main() async {
  runApp(
    ChangeNotifierProvider(
      create: (_) => BreadCrumbProvider(),
      child: MaterialApp(
        title: 'Flutter Provider state Management',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        routes: {
          '/Add_breadcrumb': (context) => const AddBreadCrumbScreen(),
        },
      ),
    ),
  );
}
