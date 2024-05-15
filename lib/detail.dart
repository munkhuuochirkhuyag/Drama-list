import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daalt/model/cast.dart';
import 'package:daalt/model/movie.dart';
import 'package:daalt/profile.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final Movie movie;
  const Detail({required this.movie, Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _castData = fetchCastData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  late Future<List<Cast>> _castData;

  Future<List<Cast>> fetchCastData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('cast').get();
    List<Cast> casts = [];
    querySnapshot.docs.forEach((doc) {
      casts.add(Cast(
        name: doc['name'],
        image: doc['image'],
        movie: doc['movie'],
        movieImage: doc['movieImage'],
      ));
    });
    return casts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DramaList'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            widget.movie.image!,
            fit: BoxFit.fitWidth,
            width: double.infinity,
            height: 300,
          ),
          Text(
            widget.movie.name!,
            style: TextStyle(fontSize: 25),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                fillColor: Color.fromRGBO(141, 178, 246, 1),
                child: Icon(
                  Icons.add,
                  size: 35.0,
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                fillColor: Color.fromRGBO(141, 178, 246, 1),
                child: Icon(
                  Icons.share_rounded,
                  size: 35.0,
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                fillColor: Color.fromRGBO(141, 178, 246, 1),
                child: Icon(
                  Icons.favorite_border,
                  size: 35.0,
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                fillColor: Color.fromRGBO(141, 178, 246, 1),
                child: Icon(
                  Icons.menu,
                  size: 35.0,
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              )
            ],
          ),
          SizedBox(height: 18),
          Text(
            'Description',
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(height: 84),
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Cast&Crew'),
              Tab(text: 'photos'),
              Tab(text: 'Recommend'),
              Tab(text: 'Episode'),
            ],
          ),
          Expanded(
            child: Container(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder<List<Cast>>(
                          future: _castData,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              List<Cast> filteredCasts = snapshot.data!
                                  .where(
                                      (cast) => cast.movie == widget.movie.name)
                                  .toList();

                              return filteredCasts.isEmpty
                                  ? SizedBox(
                                      child: Text('Хоосон байна.'),
                                    )
                                  : SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: GridView.count(
                                        crossAxisSpacing: 17,
                                        mainAxisSpacing: 30,
                                        crossAxisCount: filteredCasts.length,
                                        children: filteredCasts.map((cast) {
                                          return buildCast(cast);
                                        }).toList(),
                                      ),
                                    );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Center(child: Text('Хоосон байна.')),
                  ),
                  Container(
                    child: Center(child: Text('Хоосон байна.')),
                  ),
                  Container(
                    child: Center(child: Text('Хоосон байна.')),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCast(Cast cast) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Profile(cast: cast)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(cast.image!),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
