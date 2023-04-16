import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import 'package:provider/provider.dart';
import 'package:provider_one/component/bread_crump.dart';
import 'package:provider_one/provider/breab_crump_provider.dart';

class AddBreadCrumbScreen extends StatefulWidget {
  const AddBreadCrumbScreen({super.key});

  @override
  State<AddBreadCrumbScreen> createState() => _AddBreadCrumbScreenState();
}

class _AddBreadCrumbScreenState extends State<AddBreadCrumbScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add BreadCrumb'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter a new breadcrumb here....',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              style: TextButton.styleFrom(
                side: const BorderSide(
                  color: Colors.deepPurple,
                  width: 1,
                ),
              ),
              onPressed: () {
                final text = _controller.text;
                if (text.isNotEmpty) {
                  final breadCrumb = BreadCrumb(
                    isActive: false,
                    name: text,
                  );
                  context.read<BreadCrumbProvider>().add(
                        breadCrumb,
                      );
                  devtools.log('New BreadCrumb is Added: $text');
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
