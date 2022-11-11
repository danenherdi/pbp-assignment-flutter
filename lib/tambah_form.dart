import 'package:flutter/material.dart';
import 'package:counter_7/navigator_drawer.dart';

class TambahBudgetFormPage extends StatefulWidget {
  const TambahBudgetFormPage({super.key});

  @override
  State<TambahBudgetFormPage> createState() => _TambahBudgetFormPageState();
}

class _TambahBudgetFormPageState extends State<TambahBudgetFormPage> {
  // Variabel
  final _formKey = GlobalKey<FormState>();
  String judul = "";
  num nominal = 0;
  List<String> tipe = ['Pemasukan', 'Pengeluaran'];


  @override
      Widget build(BuildContext context) {
          return Scaffold(
              appBar: AppBar(
                  title: Text('Form Budget'),
              ),
              drawer: const NavigatorDrawer(),
              body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Judul",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  )
                                ),

                                onChanged: (String? value){
                                  setState(() {
                                    judul = value!;
                                  });
                                },
                                validator: (String? value){
                                  if(value == null || value.isEmpty){
                                    return 'Judul tidak boleh kosong!';
                                  }
                                  return null;
                                }          
                              ),

                              TextFormField(
                                keyboardType: TextInputType.number,

                                decoration: InputDecoration(
                                  labelText: "Nominal",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  )
                                ),
                                          
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
          );
      }
}