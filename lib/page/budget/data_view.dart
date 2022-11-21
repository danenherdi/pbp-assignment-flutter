import 'package:flutter/material.dart';
import 'package:counter_7/page/navigator_drawer.dart';
import 'package:counter_7/model/budget_model.dart';

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
              title: const Text('Data Budget'),
            ),
            drawer: const NavigatorDrawer(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: listOfBudgets.map<Column>((budgetModelData) => Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                budgetModelData.judul!,
                                
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                                ),
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(budgetModelData.nominal!.toString()),
                                
                                Text(budgetModelData.jenis!),
                              ],
                            )
                          ],
                        )
                      )
                    ),
                    const SizedBox(height: 10.0),
                  ]
                )).toList(),
              ),
            )
        );
    }
}