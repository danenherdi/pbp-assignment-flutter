import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:counter_7/tambah_form.dart';
import 'package:counter_7/navigator_drawer.dart';

class DataBudgetViewPage extends StatefulWidget {
  const DataBudgetViewPage({super.key});

  @override
  State<DataBudgetViewPage> createState() => _DataBudgetViewPageState();
}

class _DataBudgetViewPageState extends State<DataBudgetViewPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Data Budget'),
            ),
            drawer: const NavigatorDrawer(),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Text('Hello World!'),
                    ],
                ),
            ),
        );
    }
}