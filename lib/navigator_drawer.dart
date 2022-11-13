import 'package:counter_7/model.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/data_view.dart';
import 'package:counter_7/tambah_form.dart';
import 'package:counter_7/main.dart';

class NavigatorDrawer extends Drawer{
  const NavigatorDrawer({super.key, required this.addBudget, required this.listOfBudgets});

  final Function(BudgetModel newBudget) addBudget;
  final List<BudgetModel> listOfBudgets;

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
              MaterialPageRoute(builder: (context) => TambahBudgetFormPage(addBudget: addBudget, listOfBudgets: listOfBudgets)),
              );
          },
        ),
        ListTile(
          title: const Text('Data Budget'),
          onTap: (){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DataBudgetViewPage(addBudget: addBudget,listOfBudgets: listOfBudgets)),
            );
          }, 
        )
      ],
    ),
  );
}