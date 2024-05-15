import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
          Image.asset(
            "assets/images/home1.png",
            fit: BoxFit.fitWidth,
            width: double.infinity,
            height: 300,
          ),
          Text(
            'Our beloved Summer',
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
                    color: Colors.red,
                    child: Center(child: Text('Tab 1')),
                  ),
                  Container(
                    color: Colors.green,
                    child: Center(child: Text('Tab 2')),
                  ),
                  Container(
                    color: Colors.blue,
                    child: Center(child: Text('Tab 3')),
                  ),
                  Container(
                    color: Colors.yellow,
                    child: Center(child: Text('Tab 3')),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
