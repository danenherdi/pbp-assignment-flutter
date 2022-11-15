import 'package:counter_7/data_view.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/navigator_drawer.dart';
import 'package:flutter/services.dart';
import 'package:counter_7/model.dart';

class TambahBudgetFormPage extends StatefulWidget {
  const TambahBudgetFormPage({super.key});

  @override
  State<TambahBudgetFormPage> createState() => _TambahBudgetFormPageState();
}

class _TambahBudgetFormPageState extends State<TambahBudgetFormPage> {
  // Variabel
  final _formKey = GlobalKey<FormState>();
  String judul = "";
  int nominal = 0;
  String? jenis;
  List<String> listJenis = ["Pemasukan", "Pengeluaran"];

  @override
      Widget build(BuildContext context) {
          return Scaffold(
              appBar: AppBar(
                  title: const Text('Form Budget'),
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

                              const SizedBox(
                                height: 10,
                              ),

                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Nominal",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                                
                                onChanged: (String? value){
                                  setState(() {
                                    nominal = int.parse(value!);
                                  });
                                },
                                validator: (String? value){
                                  if(value == null || value.isEmpty){
                                    return 'Nominal angka tidak boleh kosong!';
                                  }
                                  return null;
                                }
                              ),    
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ListTile(
                          title: const Text('Pilih Jenis'),
                          trailing: DropdownButton(
                            value: jenis,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: listJenis.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                jenis = newValue!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              bottomSheet: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          listOfBudgets.add(BudgetModel(judul, nominal, jenis));
                          Navigator.pushReplacement(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => const DataBudgetViewPage()
                            ),
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      child: const Text("Simpan",
                        style: TextStyle(color: Colors.white),
                        ),
                    ),                    
                  ],
                )
              ),
          );
      }
}