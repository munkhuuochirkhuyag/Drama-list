import 'package:daalt/model/cast.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final Cast cast;
  const Profile({required this.cast, super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(widget.cast.image!),
                ),
                SizedBox(height: 8.0),
                Text(
                  widget.cast.name!,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('Follower',
                          style: TextStyle(color: Colors.black)),
                    ),
                    SizedBox(width: 8.0),
                    TextButton(
                      onPressed: () {},
                      child: Text('Following',
                          style: TextStyle(color: Colors.black)),
                    ),
                    SizedBox(width: 8.0),
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('All', style: TextStyle(color: Colors.black)),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('дууcсан',
                          style: TextStyle(color: Colors.black)),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Одоо үзэж',
                          style: TextStyle(color: Colors.black)),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('My ', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                movieList(widget.cast.movieImage!, widget.cast.movie!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget movieList(String image, String name) {
  return Card(
    margin: EdgeInsets.all(8.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            width: 100.0,
            height: 150.0,
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.blue.shade50,
            height: 150.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
