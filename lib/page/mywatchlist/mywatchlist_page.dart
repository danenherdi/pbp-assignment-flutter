import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/mywatchlist_model.dart';
import 'package:counter_7/page/navigator_drawer.dart';
import 'package:counter_7/page/mywatchlist/detail_mywatchlist_page.dart';

class MyWatchlistPage extends StatefulWidget {
  const MyWatchlistPage({super.key});

  @override
  State<MyWatchlistPage> createState() => _MyWatchlistPageState();
}

class _MyWatchlistPageState extends State<MyWatchlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
      ),
      drawer: const NavigatorDrawer(),
      body: FutureBuilder(
        future: fetchMyWatchlist(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "Tidak ada watchlist",
                    style: TextStyle(
                      color: Color(0xff59A5D8),
                      fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index)=> InkWell(
                  child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: snapshot.data![index].fields.statusWatchedFilm ? Colors.green : Colors.red,
                        blurRadius: 2,
                        offset: const Offset(4.0, 3.0)
                      )
                    ]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${snapshot.data![index].fields.titleFilm}",
                        style: const TextStyle(
                          fontSize: 16
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) =>  DetailMywatchlistPage(titleFilm: snapshot.data![index].fields.titleFilm,
                  releaseDateFilm: snapshot.data![index].fields.releaseDateFilm, ratingFilm: snapshot.data![index].fields.ratingFilm,
                  reviewFilm: snapshot.data![index].fields.reviewFilm, statusWatchedFilm: snapshot.data![index].fields.statusWatchedFilm)));
                },
              )
            );
          }
        }
      }
      )
    );
  }
}