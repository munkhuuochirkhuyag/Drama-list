import 'package:daalt/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daalt/detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> _movieData;

  @override
  void initState() {
    super.initState();
    _movieData = fetchMovieData();
  }

  Future<List<Movie>> fetchMovieData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('movie').get();
    List<Movie> movies = [];
    querySnapshot.docs.forEach((doc) {
      movies.add(Movie(
        name: doc['name'],
        image: doc['image'],
      ));
    });
    return movies;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 251, 209, 255),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 40, right: 220),
                child: Image.asset("assets/images/home7.png"),
              ),
              SizedBox(height: 20),
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: ExactAssetImage("assets/images/home1.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(48),
                ),
              ),
              SizedBox(height: 20),
              FutureBuilder<List<Movie>>(
                future: _movieData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return SizedBox(
                      height: 600,
                      width: double.infinity,
                      child: GridView.count(
                        crossAxisSpacing: 17,
                        mainAxisSpacing: 30,
                        crossAxisCount: 3,
                        children: snapshot.data!.map((movie) {
                          return buildMovie(movie);
                        }).toList(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMovie(Movie movie) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Detail(movie: movie)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(movie.image!),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
