import 'package:flutter/material.dart';
import 'package:counter_7/page/mywatchlist/mywatchlist_page.dart';

class DetailMywatchlistPage extends StatefulWidget {
  const DetailMywatchlistPage({super.key, required this.titleFilm, required this.releaseDateFilm ,required this.ratingFilm, required this.reviewFilm, required this.statusWatchedFilm});

  final String titleFilm;
  final String releaseDateFilm;
  final String ratingFilm;
  final String reviewFilm;
  final bool statusWatchedFilm;

  @override
  State<DetailMywatchlistPage> createState() => _DetailMywatchlistPageState();
}

class _DetailMywatchlistPageState extends State<DetailMywatchlistPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(widget.titleFilm,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ) 
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: 'Release Date: ',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text: widget.releaseDateFilm, style: const TextStyle(fontWeight: FontWeight.normal))
                  ]
                )
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Rating: ',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text: widget.ratingFilm, style: const TextStyle(fontWeight: FontWeight.normal)),
                    const TextSpan(text: '/5', style: TextStyle(fontWeight: FontWeight.normal)),
                  ]
                )
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Status: ',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text: widget.statusWatchedFilm ? 'Watched' : 'Not Watched', style: const TextStyle(fontWeight: FontWeight.normal))
                  ]
                )
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Review:\n',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text: widget.reviewFilm, style: const TextStyle(fontWeight: FontWeight.normal))
                  ] 
                )
              ),
            ],
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
                Navigator.pop(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => const MyWatchlistPage()
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              child: const Text("Back",
              style: TextStyle(color: Colors.white),
              ),
            ),                    
          ],
        )
      ),
    );
  }
}