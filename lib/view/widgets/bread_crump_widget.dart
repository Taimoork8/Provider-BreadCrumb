import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:provider_one/component/bread_crump.dart';

class BreadCrumpWidget extends StatelessWidget {
  final UnmodifiableListView<BreadCrumb> breadcrumbs;
  const BreadCrumpWidget({
    super.key,
    required this.breadcrumbs,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: breadcrumbs.map(
        (breadcrumb) {
          return Text(
            breadcrumb.title,
            style: TextStyle(
              color: breadcrumb.isActive ? Colors.blue : Colors.black,
            ),
          );
        },
      ).toList(),
    );
  }
}
