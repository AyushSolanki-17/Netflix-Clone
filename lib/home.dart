
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:netflix_clone/videoplayer.dart';

import 'movie.dart';
import 'package:http/http.dart' as http;


// ignore: constant_identifier_names
const REPO_LINK = "https://raw.githubusercontent.com/AyushSolanki-17/StaticServer/main/Youtube/v1/";
// ignore: constant_identifier_names
const API_LINK = REPO_LINK+"demoData.json";


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Movie>? _movies;

  void getData() async{
    var movieResponse = await http.get(Uri.parse(API_LINK));

    var movies = jsonDecode(movieResponse.body);
    var movieList = <Movie>[];
    for(var m in movies){
      var m1 = Movie.fromJson(m);
      movieList.add(m1);
    }

    setState(() {
      _movies = movieList;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SingleChildScrollView(
        child: Column(
          children: [
            if(_movies!=null)
              for(Movie m in _movies!)
                MovieTab(movie: m)
          ],
        ),
      ),
    );
  }
}

class MovieTab extends StatelessWidget {
  const MovieTab({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        child: InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> VideoPlayer(movie: movie.videoLink!)));
          },
          child: Column(
            children: [
              Image.network(REPO_LINK+movie.thumbnailLink!),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(movie.name!,style: TextStyle(fontSize: 25.0,color: Colors.white)),
                  Text(movie.ratings!.toString(),style: TextStyle(fontSize: 25.0,color: Colors.white)),
                ],
              )
            ],
          ),
        )
    );
  }
}