import 'package:flutter/material.dart';
import 'package:counter_7/navigator_drawer.dart';
import 'package:counter_7/model.dart';

class DataBudgetViewPage extends StatefulWidget {
  const DataBudgetViewPage({super.key, required this.addBudget, required this.listOfBudgets});

  final Function(BudgetModel newBudget) addBudget;
  final List<BudgetModel> listOfBudgets;

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
            drawer: NavigatorDrawer(addBudget: widget.addBudget, listOfBudgets: widget.listOfBudgets),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: widget.listOfBudgets.map<Column>((data) => Column(
                  children: <Widget>[
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                          )
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              data.judul!,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(data.nominal!.toString()),
                                Text(data.jenis!),
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