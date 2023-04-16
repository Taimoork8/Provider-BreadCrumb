import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_one/provider/breab_crump_provider.dart';
import 'package:provider_one/view/widgets/bread_crump_widget.dart';
import 'dart:developer' as devtools show log;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  ///This app is about bread crumb
  ///like tabs

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Consumer<BreadCrumbProvider>(
              builder: (context, value, child) {
                return BreadCrumpWidget(
                  breadcrumbs: value.items,
                );
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                side: const BorderSide(
                  color: Colors.deepPurple,
                  width: 1,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/Add_breadcrumb',
                );
              },
              child: const Text('Add new bread crumb'),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextButton(
              style: TextButton.styleFrom(
                side: const BorderSide(
                  color: Colors.deepPurple,
                  width: 1,
                ),
              ),
              onPressed: () {
                ///use read only for comunication one-way only oruse it in onpressed or
                /// tap to call a function only.
                context.read<BreadCrumbProvider>().reset();
                devtools.log('BreadCrumb Reseted');
              },
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
