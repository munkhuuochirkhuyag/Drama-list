import 'package:daalt/detail.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(48),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildImage("assets/images/home6.png"),
                  buildImage("assets/images/home5.png"),
                  buildImage("assets/images/home6.png"),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildImage("assets/images/home4.png"),
                  buildImage("assets/images/home2.png"),
                  buildImage("assets/images/home3.png"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(String assetPath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Detail()));
      },
      child: Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(assetPath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
