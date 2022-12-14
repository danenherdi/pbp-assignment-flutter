import 'package:flutter/material.dart';
import 'package:counter_7/page/budget/data_view.dart';
import 'package:counter_7/page/budget/tambah_form.dart';
import 'package:counter_7/page/mywatchlist/mywatchlist_page.dart';
import 'package:counter_7/main.dart';

class NavigatorDrawer extends Drawer{
  const NavigatorDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
    child: Column(
      children: [
        ListTile(
          title: const Text('counter_7'),
          onTap: (){
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
          },
        ),
        ListTile(
          title: const Text('Tambah Budget'),
          onTap: (){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const TambahBudgetFormPage()),
              );
          },
        ),
        ListTile(
          title: const Text('Data Budget'),
          onTap: (){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const DataBudgetViewPage()),
            );
          }, 
        ),
        ListTile(
          title: const Text('My watch List'),
          onTap: (){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MyWatchlistPage()),
            );
          }, 
        ),
      ],
    ),
  );
}